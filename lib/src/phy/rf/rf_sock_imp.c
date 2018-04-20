/**
 *
 * \section COPYRIGHT
 *
 * Copyright 2013-2015 Software Radio Systems Limited
 *
 * \section LICENSE
 *
 * This file is part of the srsLTE library.
 *
 * srsLTE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * srsLTE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * A copy of the GNU Affero General Public License can be found in
 * the LICENSE file in the top-level directory of this distribution
 * and at http://www.gnu.org/licenses/.
 *
 */

#include <string.h>
#include <unistd.h>
#include <pthread.h>
#include <semaphore.h>
#include <assert.h>
#include <fcntl.h>
#include <errno.h>

#include <sys/time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <sys/uio.h>
#include <sys/un.h>

#include <net/if.h>

#include "srslte/srslte.h"
#include "rf_sock_imp.h"
#include "srslte/phy/rf/rf.h"
#include "srslte/phy/resampling/resample_arb.h"

// J Giovatto Feb 12 2018
// run builtin tests with -a (args) ue or enb, default is loop, (loopback)

// suggest running non DEBUG_MODE with n_prb of 6,15 or 25 for starters
// build 'make clean && cmake -DCMAKE_BUILD_TYPE=Release ../ && make'
// noted n_prb 6 and 15 are not reliable when DEBUG_MODE is enabled 

// n_prb or 6 thru 50 have worked with the increasing cpu utilization
// your mileage will vary. Running w/o linux window manager etc
// is preferred. Running at 1 msec i/o interval really puts a strain
// on the linux scheduler and eventually it falls apart
// 
// running as sudo/root will allow real time priorities to take effect
// and allow unix socket endpoint creation in /tmp
// 1) sudo ./srsepc ./epc.conf
// 2) sudo ./srsue  ./ue.conf
// 3) sudo ./srsenb ./enb.conf


#ifdef DEBUG_MODE
static bool rf_sock_log_dbug  = true;
static bool rf_sock_log_info  = true;
static bool rf_sock_log_warn  = true;
#else
static bool rf_sock_log_dbug  = false;
static bool rf_sock_log_info  = false;
static bool rf_sock_log_warn  = true;
#endif

static char rf_sock_node_type[2] = {0};

#define RF_SOCK_LOG_FMT "%02d:%02d:%02d.%06ld [SRF.%s] [%c] [%02d:%06ld] %s,  "


#define RF_SOCK_WARN(_fmt, ...) do {                                                    \
                                 if(rf_sock_log_warn) {                                 \
                                   struct timeval _tv_now;                              \
                                   struct tm _tm[2];                                    \
                                   gettimeofday(&_tv_now, NULL);                        \
                                   localtime_r(&_tv_now.tv_sec, &_tm[0]);               \
                                   localtime_r(&_info->tv_this_tti.tv_sec, &_tm[1]);    \
                                   fprintf(stdout, RF_SOCK_LOG_FMT _fmt "\n",           \
                                           _tm[0].tm_hour,                              \
                                           _tm[0].tm_min,                               \
                                           _tm[0].tm_sec,                               \
                                           _tv_now.tv_usec,                             \
                                           rf_sock_node_type,                           \
                                           'W',                                         \
                                           _tm[1].tm_sec,                               \
                                           _info->tv_this_tti.tv_usec,                  \
                                           __func__,                                    \
                                           ##__VA_ARGS__);                              \
                                     }                                                  \
                                 } while(0);


#define RF_SOCK_DBUG(_fmt, ...) do {                                                    \
                                 if(rf_sock_log_dbug) {                                 \
                                   struct timeval _tv_now;                              \
                                   struct tm _tm[2];                                    \
                                   gettimeofday(&_tv_now, NULL);                        \
                                   localtime_r(&_tv_now.tv_sec, &_tm[0]);               \
                                   localtime_r(&_info->tv_this_tti.tv_sec, &_tm[1]);    \
                                   fprintf(stdout, RF_SOCK_LOG_FMT _fmt "\n",           \
                                           _tm[0].tm_hour,                              \
                                           _tm[0].tm_min,                               \
                                           _tm[0].tm_sec,                               \
                                           _tv_now.tv_usec,                             \
                                           rf_sock_node_type,                           \
                                           'D',                                         \
                                           _tm[1].tm_sec,                               \
                                           _info->tv_this_tti.tv_usec,                  \
                                           __func__,                                    \
                                           ##__VA_ARGS__);                              \
                                 }                                                      \
                             } while(0);

#define RF_SOCK_INFO(_fmt, ...) do {                                                    \
                                 if(rf_sock_log_info) {                                 \
                                   struct timeval _tv_now;                              \
                                   struct tm _tm[2];                                    \
                                   gettimeofday(&_tv_now, NULL);                        \
                                   localtime_r(&_tv_now.tv_sec, &_tm[0]);               \
                                   localtime_r(&_info->tv_this_tti.tv_sec, &_tm[1]);    \
                                   fprintf(stdout, RF_SOCK_LOG_FMT _fmt "\n",           \
                                           _tm[0].tm_hour,                              \
                                           _tm[0].tm_min,                               \
                                           _tm[0].tm_sec,                               \
                                           _tv_now.tv_usec,                             \
                                           rf_sock_node_type,                           \
                                           'I',                                         \
                                           _tm[1].tm_sec,                               \
                                           _info->tv_this_tti.tv_usec,                  \
                                           __func__,                                    \
                                           ##__VA_ARGS__);                              \
                                 }                                                      \
                             } while(0);


#define RF_SOCK_LOG_FUNC_TODO printf("XXX_TODO file:%s func:%s line:%d XXX_TODO\n", \
                                     __FILE__,                                      \
                                     __func__,                                      \
                                     __LINE__);

// unix socket endpoints should have visibility for LXC container
// deployment of ue/enb.
#define RF_SOCK_SERVER_PATH "/tmp/srslte-ipc-server-sock"
#define RF_SOCK_CLIENT_PATH "/tmp/srslte-ipc-client-sock"

// env overrides for above
#define SRSLTE_IPC_CLIENT_SOCK_ENV  "SRSLTE_IPC_CLIENT_SOCK" 
#define SRSLTE_IPC_SERVER_SOCK_ENV  "SRSLTE_IPC_SERVER_SOCK" 

// bytes per sample
#define BYTES_PER_SAMPLE(x) ((x)*sizeof(cf_t))

// samples per byte
#define SAMPLES_PER_BYTE(x) ((x)/sizeof(cf_t))

// max sf len
#define RF_SOCK_MAX_SF_LEN_SAMPLES (0x8000)

// max sf len in bytes
#define RF_SOCK_MAX_SF_LEN_BYTES (RF_SOCK_MAX_SF_LEN_SAMPLES * sizeof(cf_t))

// XXX TODO need more mileage w/test apps in loopback mode
// currently only 1 ue and 1 enb per test deplyoment
// no signal mixing for multiple ue as of yet but open to ideas.
#define RF_SOCK_NTYPE_LOOP  (0)  
#define RF_SOCK_NTYPE_UE    (1)  
#define RF_SOCK_NTYPE_ENB   (2)


#define IOV_2_LEN(iov)  (iov)[0].iov_len + (iov)[1].iov_len
#define IOV_NUM 2

// The idea here was to 'scale' timeout/timerdelay/offset and usleep() calls
// by say a factor of 2 to slow down relative time throughout the entire codebase
// to get around the linux scheduler latency.
// Meaning subframes are now 2 msec internally, externally thruput will suffer by 50%
// but for network related testing this could be acceptable.
// This found was to be useful on limited resource (cpu) hardware or tracking logs/gdb.
// Possibly all sleep/delay calls could be wrapped in a "time service" to allow
// for homogeneous timing and tti source between all components.

// rx op before next tti each recv method should wait a fair amount of time
// to recv any message in the current/correct tti.
static const struct timeval tv_zero       = {};
static const struct timeval tv_tti_step   = {0, get_time_scaled(1000)};


// tx msg header info
typedef struct {
  uint64_t       seqnum;
  uint32_t       nof_bytes;
  uint32_t       nof_samples;
  float          srate;
  float          gain;
  struct timeval tx_tti;
  struct timeval tx_time;
} rf_sock_iohdr_t;


typedef struct {
  rf_sock_iohdr_t  hdr;
  cf_t *           data;
  uint8_t          xtra[128];
} rf_sock_iomsg_t;
#define RF_SOCK_MSGQ_SIZE 20
#define RF_SOCK_BUMP_MSGQ_IDX(x) ((x) = ((x) + 1) % RF_SOCK_MSGQ_SIZE)


// tx msg info
typedef struct {
  bool            is_sob;       // start of burst
  bool            is_eob;       // end   of burst
  struct iovec    iov[IOV_NUM]; // outbound msg iov
  rf_sock_iomsg_t iomsg;        // outbound hdr and data
  struct msghdr   mhdr;         // outbound msg info
} rf_sock_tx_info_t;


// rx worker thread info
typedef struct {
  void *               h;
  pthread_t            tid;
  bool                 is_running;
} rf_sock_rx_worker_t;



// rf dev info
typedef struct {
   char *               dev_name;
   int                  nodetype;
   double               rx_gain;
   double               tx_gain;
   double               rx_srate;
   double               tx_srate;
   double               rx_freq;
   double               tx_freq;
   srslte_rf_cal_t      tx_cal;
   srslte_rf_cal_t      rx_cal;
   double               clock_rate;
   void (*error_handler)(srslte_rf_error_t error);
   bool                 rx_stream;
   int                  tx_handle;
   int                  rx_handle;
   uint64_t             tx_seqnum;
   pthread_mutex_t      rx_lock;
   rf_sock_rx_worker_t  rx_worker;
   struct timeval       tv_sos;      // start of stream
   struct timeval       tv_this_tti;
   struct timeval       tv_next_tti;
   size_t               tx_nof_discard;
   size_t               tx_nof_errors;
   size_t               tx_nof_late;
   size_t               tx_nof_ok;
   size_t               rx_nof_errors;
   size_t               rx_nof_late;
   size_t               rx_nof_ok;
   struct sockaddr_un   tx_addr;
   rf_sock_iomsg_t      rx_msgQ[RF_SOCK_MSGQ_SIZE];
   int                  rx_msgQ_num;
   int                  rx_msgQ_head;
   int                  rx_msgQ_tail;
   pthread_cond_t       rx_msgQ_cond;
   rf_sock_tx_info_t    tx_msg;
} rf_sock_info_t;


void rf_sock_suppress_stdout(void *h)
 {
#ifndef DEBUG_MODE
    rf_sock_log_dbug = false;
#endif
 }


static void rf_sock_handle_error(srslte_rf_error_t error)
{
  // XXX TODO make use of this handler
  printf("type %s", 
          error.type == SRSLTE_RF_ERROR_LATE      ? "late"      :
          error.type == SRSLTE_RF_ERROR_UNDERFLOW ? "underflow" :
          error.type == SRSLTE_RF_ERROR_OVERFLOW  ? "overflow"  :
          error.type == SRSLTE_RF_ERROR_OTHER     ? "other"     :
          "unknown error");
}


static  rf_sock_info_t rf_sock_info = { .dev_name        = "sockrf",
                                        .nodetype        = RF_SOCK_NTYPE_LOOP,
                                        .rx_gain         = 0.0,
                                        .tx_gain         = 0.0,
                                        .rx_srate        = SRSLTE_CS_SAMP_FREQ,
                                        .tx_srate        = SRSLTE_CS_SAMP_FREQ,
                                        .rx_freq         = 0.0,
                                        .tx_freq         = 0.0,
                                        .rx_cal          = {},
                                        .tx_cal          = {},
                                        .clock_rate      = 0.0,
                                        .error_handler   = rf_sock_handle_error,
                                        .rx_stream       = false,
                                        .tx_handle       = -1,
                                        .rx_handle       = -1,
                                        .tx_seqnum       = 0,
                                        .rx_lock         = PTHREAD_MUTEX_INITIALIZER,
                                        .tv_sos          = {},
                                        .tv_this_tti     = {},
                                        .tv_next_tti     = {},
                                        .tx_nof_late     = 0,
                                        .tx_nof_ok       = 0,
                                        .tx_nof_discard  = 0,
                                        .tx_nof_errors   = 0,
                                        .rx_nof_errors   = 0,
                                        .rx_nof_late     = 0,
                                        .rx_nof_ok       = 0,
                                        .tx_addr         = {},
                                        .rx_msgQ_num     = 0,
                                        .rx_msgQ_head    = 0,
                                        .rx_msgQ_tail    = 0,
                                        .rx_msgQ_cond    = PTHREAD_COND_INITIALIZER,
                                        .tx_msg          = {}
                                      };

#define GET_DEV_INFO(h)  assert(h); rf_sock_info_t *_info = (rf_sock_info_t *)(h)

static bool rf_sock_is_loopback(rf_sock_info_t * _info)
{
  return (_info->nodetype == RF_SOCK_NTYPE_LOOP);
}


static bool rf_sock_is_enb(rf_sock_info_t * _info)
{
  return (_info->nodetype == RF_SOCK_NTYPE_ENB);
}


static bool rf_sock_is_ue(rf_sock_info_t * _info)
{
  return (_info->nodetype == RF_SOCK_NTYPE_UE);
}



static void rf_sock_tv_to_ts(const struct timeval *tv, time_t *full_secs, double *frac_secs)
{
  if(full_secs && frac_secs)
    {
      *full_secs = tv->tv_sec; 
      *frac_secs = tv->tv_usec / 1.0e6;
    }
}


static void rf_sock_ts_to_tv(struct timeval *tv, time_t full_secs, double frac_secs)
{
  if(tv)
    {
      tv->tv_sec  = full_secs;
      tv->tv_usec = frac_secs * 1.0e6;
    }
}

#ifdef HEX_DEBUG_MODE
static void rf_sock_print_hex(const char * note, void * buf, const int buflen)
{
  unsigned char *p = (unsigned char *) buf;

  int i;
  int cnt = 0;
  const int strl = 17;
  char str[strl];
  memset (str, 0, sizeof (str));

  printf ("  %s", note);

  for(i = 0; i < buflen; ++i)
    {
      if(cnt % (strl - 1) == 0)
        {
          printf ("  %s\n%04X: ", str, cnt);
          memset (str, 0, strl);
        }

      if(p[cnt] < ' ' || p[cnt] >= 127)
        {
          str[cnt % (strl - 1)] = '.';
        }
      else
        {
          str[cnt % (strl - 1)] = p[cnt];
        }
      printf ("%02X ", p[cnt++]);
    }

  if (i % 16)
    {
      printf ("  %*s\n\n",
              (strl - 1) + ((strl - 1) - buflen % (strl - 1)) * 2, str);
    }
  else
    {
      printf ("  %s\n", str);
    }
}
#endif

static int rf_sock_resample(void * h,
                            double srate_in, 
                            double srate_out, 
                            void * in, 
                            void * out, 
                            int nof_samples_in)
{
  GET_DEV_INFO(h);

  if(srate_out == 0.0)
    {
      RF_SOCK_WARN("srate_out can not be 0, check config, shutting down now");

      exit(0);
    }

  if(srate_in == 0.0)
    {
      RF_SOCK_WARN("srate_in can not be 0, check config, shutting down now");

      exit(0);
    }

  if(srate_in != srate_out)
   {
     const double sratio = srate_out / srate_in;

     // have noticed that when 'upsample' unable to sync
     if(sratio > 1.0)
      { 
        RF_SOCK_WARN("srate %4.2lf/%4.2lf MHz, sratio %3.3lf, upsample may not decode",
                     srate_in  / 1e6,
                     srate_out / 1e6,
                     sratio);
      }

     srslte_resample_arb_t r;

     srslte_resample_arb_init(&r, sratio, 0);

     return srslte_resample_arb_compute(&r, (cf_t*)in, (cf_t*)out, nof_samples_in);
   }
 else
   {
     // no changes, samples in == samples out
     memcpy(out, in, BYTES_PER_SAMPLE(nof_samples_in));

     return nof_samples_in;
   }
}



static int rf_sock_send_msg(void * h)
{
   GET_DEV_INFO(h);

   int nbytes_inq = 0;

   const int n_bytes = IOV_2_LEN(_info->tx_msg.iov);

   // check tx socket backlog
   if(ioctl(_info->tx_handle, TIOCOUTQ, &nbytes_inq) < 0)
     {
       RF_SOCK_WARN("ioctl error, %s,", strerror(errno));
     }
   else
     {

       // do not over run the tx socket
       if(nbytes_inq > 0)
        {
          ++_info->tx_nof_discard;

          RF_SOCK_WARN("%d bytes already in Q, discard this msg len %d, total discard %zu",
                       nbytes_inq, 
                       n_bytes,
                       _info->tx_nof_discard);

          return 0;
        } 
     }

#ifdef HEX_DEBUG_MODE
   rf_sock_print_hex("tx hdr ",  _info->tx_msg.mhdr.msg_iov[0].iov_base, _info->tx_msg.mhdr.msg_iov[0].iov_len);
   rf_sock_print_hex("tx data",  _info->tx_msg.mhdr.msg_iov[1].iov_base, 64);
#endif

   const int rc = sendmsg(_info->tx_handle, &_info->tx_msg.mhdr, 0);

   if(rc != n_bytes)
     {
       if(errno == ENOTCONN     || 
          errno == ECONNREFUSED || 
          errno == EAGAIN       ||
          errno == EWOULDBLOCK  ||
          errno == ENOENT)
         {
           if(! (++_info->tx_nof_errors % (1000/ get_time_scaled(1))))
             {
               RF_SOCK_WARN("semdmsg, %s, please re-start %s", 
                            strerror(errno), 
                            rf_sock_is_ue(_info) ? "eNb" : "Ue");
             }
         }
       else if(errno == EPERM || errno == EACCES)
        {
           RF_SOCK_WARN("sendmsg error %s, check file permission and user priviledge, shutting down now", 
                        strerror(errno));
        
           exit(0);
        }
      else
        {
           RF_SOCK_WARN("sendmsg errorno [%d], %s, shutting down now", errno, strerror(errno));

           exit(0);
        }
     }

   return rc;
}




static void rf_sock_rx_q_notify(void *h)
{
   GET_DEV_INFO(h);

   pthread_mutex_lock(&_info->rx_lock);

   RF_SOCK_BUMP_MSGQ_IDX(_info->rx_msgQ_head);

   if(_info->rx_msgQ_head == _info->rx_msgQ_tail)
     {
       RF_SOCK_BUMP_MSGQ_IDX(_info->rx_msgQ_tail);
     }
   else
     {
       _info->rx_msgQ_num += 1;
     }

   pthread_cond_signal(&_info->rx_msgQ_cond);

   RF_SOCK_DBUG("Q count %d, head %d, tail %d", 
                _info->rx_msgQ_num,
                _info->rx_msgQ_head,
                _info->rx_msgQ_tail);

   pthread_mutex_unlock(&_info->rx_lock);
}



static void * rf_sock_rx_worker(void * h)
{
   GET_DEV_INFO(h);

   _info->rx_worker.is_running = true;

   struct iovec iov[IOV_NUM] = {};

   struct timeval tv_now, tv_diff, tv_delay;

   while(_info->rx_worker.is_running)
     {
       rf_sock_iomsg_t * iomsg = &_info->rx_msgQ[_info->rx_msgQ_head];

       iov[0].iov_base = &iomsg->hdr;
       iov[0].iov_len  = sizeof(iomsg->hdr);
       iov[1].iov_base = iomsg->data;
       iov[1].iov_len  = RF_SOCK_MAX_SF_LEN_BYTES;

       // dump each msg into the rx_msgQ as we get them
       // when recv is called pull out msgs that
       // have current tti time
       const int rc = readv(_info->rx_handle, iov, IOV_NUM);

       gettimeofday(&tv_now, NULL);

#ifdef HEX_DEBUG_MODE
       rf_sock_print_hex("rx hdr ", iov[0].iov_base, iov[0].iov_len);
       rf_sock_print_hex("rx data", iov[1].iov_base, 64);
#endif

       if(rc <= 0)
        {
          if(! (errno == EAGAIN || errno == EWOULDBLOCK))
            {
              RF_SOCK_WARN("RX reqlen %ld, error %s", 
                            IOV_2_LEN(iov), strerror(errno));

              ++_info->rx_nof_errors;
            }
        }
       else
        {
          timersub(&iomsg->hdr.tx_tti, &tv_now, &tv_diff);

          timersub(&tv_now, &iomsg->hdr.tx_time, &tv_delay);

          if(timercmp(&tv_diff, &tv_tti_step, <))
           {
             ++_info->rx_nof_late;

             RF_SOCK_WARN(" RX LATE, seqnum %lu, tx_delay %ld:%06ld, tx_tti %ld:%06ld, tti_diff %ld:%06ld, total late %zu",
                          iomsg->hdr.seqnum,
                          tv_delay.tv_sec,
                          tv_delay.tv_usec,
                          iomsg->hdr.tx_tti.tv_sec % 60,
                          iomsg->hdr.tx_tti.tv_usec,
                          tv_diff.tv_sec,
                          tv_diff.tv_usec,
                          _info->rx_nof_late);
           }
         else
           {
             rf_sock_rx_q_notify(h);

             ++_info->rx_nof_ok;

             if(! (_info->rx_nof_ok % 1000))
              {
                RF_SOCK_WARN(" RX OK, seqnum %lu, tx_delay %ld:%06ld, tx_tti %ld:%06ld, tti_diff %ld:%06ld, total ok %zu",
                             iomsg->hdr.seqnum,
                             tv_delay.tv_sec,
                             tv_delay.tv_usec,
                             iomsg->hdr.tx_tti.tv_sec % 60,
                             iomsg->hdr.tx_tti.tv_usec,
                             tv_diff.tv_sec,
                             tv_diff.tv_usec,
                             _info->rx_nof_ok);
              }
           }
       }
    }     

   return NULL;
}



static int rf_sock_set_sock_block(rf_sock_info_t * _info, int fd, bool blocking)
{
  int flags = fcntl(fd, F_GETFL, 0);
 
  if(flags < 0)
   {
     RF_SOCK_WARN("get flags error %s", strerror(errno));

     return -1;
   } 

  if(! blocking) 
   {
     if(fcntl(fd, F_SETFL, flags | O_NONBLOCK) < 0)
      {
        RF_SOCK_WARN("set flags error %s", strerror(errno));

        return -1;
      }
   }
  else
   {
     if(fcntl(fd, F_SETFL, flags & ~O_NONBLOCK) < 0)
      {
        RF_SOCK_WARN("set flags error %s", strerror(errno));

        return -1;
      }
   }

  return 0;
}


static int rf_sock_open_unix_sock(rf_sock_info_t * _info, 
                                  const char * local,
                                  const char * remote)
{
  struct sockaddr_un lcl_addr;

  int rx_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

  if(rx_fd < 0)
    {
      RF_SOCK_WARN("unix sock open error %s", strerror(errno));

      return -1;
    }

  int tx_fd = socket(AF_UNIX, SOCK_DGRAM, 0);

  if(tx_fd < 0)
    {
      RF_SOCK_WARN("unix sock open error %s", strerror(errno));

      return -1;
    }

  memset(&lcl_addr, 0, sizeof(lcl_addr));
  lcl_addr.sun_family = AF_UNIX;
  strncpy(lcl_addr.sun_path, local, strlen(local));

  if(unlink(local) < 0)
    {
      if(errno == EPERM || errno == EACCES)
        {
          RF_SOCK_WARN("unlink %s error %s, check file permission and sudo priviledge", 
                       local, strerror(errno));
        
          return -1;
        }
      else if(errno != ENOENT)
        {
          RF_SOCK_WARN("unlink %s error %s", local, strerror(errno));

          return -1;
        }
    }

  if(bind(rx_fd, (struct sockaddr *) &lcl_addr, sizeof(lcl_addr)) < 0)
    {
      RF_SOCK_WARN("unix sock bind %s error %s", local, strerror(errno));

      return -1;
    }
  else
    {
      RF_SOCK_INFO("unix sock bind to %s", local);
    }

  memset(&_info->tx_addr, 0, sizeof(_info->tx_addr));
  _info->tx_addr.sun_family = AF_UNIX;
  strncpy(_info->tx_addr.sun_path, remote, strlen(remote));

  RF_SOCK_INFO("unix sock send to %s", remote);

  _info->tx_handle = tx_fd;
  _info->rx_handle = rx_fd;

  return 0;
}


static int rf_sock_open_ipc(rf_sock_info_t * _info)
{
  const char * client_path = getenv(SRSLTE_IPC_CLIENT_SOCK_ENV);

  if(!client_path)
    {
      client_path = RF_SOCK_CLIENT_PATH;
    }

  RF_SOCK_INFO("unix_socket client %s", client_path);

  const char * server_path = getenv(SRSLTE_IPC_SERVER_SOCK_ENV);

  if(!server_path)
    {
      server_path = RF_SOCK_SERVER_PATH;
    }

  RF_SOCK_INFO("unix_socket server %s", server_path);

  if(rf_sock_is_enb(_info))
    {
      strncpy(rf_sock_node_type, "E", 1);

      return rf_sock_open_unix_sock(_info,
                                    server_path,
                                    client_path);

    }
  else if(rf_sock_is_ue(_info))
    {
      strncpy(rf_sock_node_type, "U", 1);

      return rf_sock_open_unix_sock(_info,
                                    client_path, 
                                    server_path);
    }
  else if(rf_sock_is_loopback(_info))
    {
      strncpy(rf_sock_node_type, "L", 1);

      return rf_sock_open_unix_sock(_info,
                                    client_path, 
                                    client_path);
    }
  else
    {
      RF_SOCK_WARN("invalid mode, expected enb or ue or loopback");

      return -1;
    }
}

// begin RF API

char* rf_sock_devname(void *h)
 {
   GET_DEV_INFO(h);

   return _info->dev_name;
 }


bool rf_sock_rx_wait_lo_locked(void *h)
 {
   RF_SOCK_LOG_FUNC_TODO;

   return false;
 }


int rf_sock_start_rx_stream(void *h, bool now)
 {
   GET_DEV_INFO(h);
   
   pthread_mutex_lock(&_info->rx_lock);

   gettimeofday(&_info->tv_sos, NULL);

   // aligin time on the second, 1 in a million chance its on 
   if(_info->tv_sos.tv_usec > 0)
    {
      usleep(1000000 - _info->tv_sos.tv_usec);
   
      _info->tv_sos.tv_sec  += 1;
      _info->tv_sos.tv_usec = 0;
    }

   // set this tti time
   _info->tv_this_tti  = _info->tv_sos;

   // set next tti time
   timeradd(&_info->tv_sos, &tv_tti_step, &_info->tv_next_tti);

   RF_SOCK_WARN("start rx stream, t_scale %d, time_0 %ld:%06ld, next_tti %ld:%06ld", 
                 get_time_scaled(1),
                 _info->tv_sos.tv_sec, 
                 _info->tv_sos.tv_usec,
                 _info->tv_next_tti.tv_sec, 
                 _info->tv_next_tti.tv_usec);

   _info->rx_stream = true;

   pthread_mutex_unlock(&_info->rx_lock);

   return 0;
 }


int rf_sock_stop_rx_stream(void *h)
 {
   GET_DEV_INFO(h);

   pthread_mutex_lock(&_info->rx_lock);

   // XXX how important is this
   RF_SOCK_WARN("end rx stream");

   _info->rx_stream = false;

   pthread_mutex_unlock(&_info->rx_lock);

   return 0;
 }


void rf_sock_flush_buffer(void *h)
 {
   RF_SOCK_LOG_FUNC_TODO;
 }


bool rf_sock_has_rssi(void *h)
 {
   GET_DEV_INFO(h);

   RF_SOCK_DBUG("yes");

   return true;
 }


float rf_sock_get_rssi(void *h)
 {
   GET_DEV_INFO(h);

   const float rssi = -33.0;  // XXX TODO what value ???

   RF_SOCK_DBUG("rssi %4.3f", rssi);

   return rssi;
 }


void rf_sock_register_error_handler(void *h, srslte_rf_error_handler_t error_handler)
 {
   GET_DEV_INFO(h);

   _info->error_handler = error_handler;
 }


int rf_sock_open(char *args, void **h)
 {
   return rf_sock_open_multi(args, h, 1);
 }


int rf_sock_open_multi(char *args, void **h, uint32_t nof_channels)
 {
   rf_sock_info_t * _info = &rf_sock_info;

   RF_SOCK_INFO("channels %u, args [%s]", nof_channels, args ? args : "none");

   if(args && strncmp(args, "enb", strlen("enb")) == 0)
    {
      rf_sock_info.nodetype = RF_SOCK_NTYPE_ENB;
    }
   else if(args && strncmp(args, "ue", strlen("ue")) == 0)
    {
      rf_sock_info.nodetype = RF_SOCK_NTYPE_UE;
    }
   else
    {
      RF_SOCK_INFO("default nodetype is loopback");

      rf_sock_info.nodetype = RF_SOCK_NTYPE_LOOP;
    }
       
   if(nof_channels != 1)
    {
      RF_SOCK_WARN("only supporting 1 channel, not %d", nof_channels);

      return -1;
    }

   if(rf_sock_open_ipc(&rf_sock_info) < 0)
    {
      RF_SOCK_WARN("could not create ipc channel");

      return -1;
    }

   // set to block
   if(rf_sock_set_sock_block(_info, rf_sock_info.rx_handle, true) < 0)
     {
       RF_SOCK_WARN("rx sock set block error %s", strerror(errno));

       return -1; 
     }

    memset(&rf_sock_info.tx_msg, 0x0, sizeof(rf_sock_info.tx_msg));

    if((rf_sock_info.tx_msg.iomsg.data = malloc(RF_SOCK_MAX_SF_LEN_BYTES)) == NULL)
      {
        RF_SOCK_WARN("FAILED to allocate memory for tx_msg");
        return -1;
      }

    // preload any tx info
    rf_sock_info.tx_msg.iov[0].iov_base = &rf_sock_info.tx_msg.iomsg.hdr;
    rf_sock_info.tx_msg.iov[0].iov_len  = sizeof(rf_sock_info.tx_msg.iomsg.hdr);
    rf_sock_info.tx_msg.iov[1].iov_base = NULL;
    rf_sock_info.tx_msg.iov[1].iov_len  = 0; // set per tx msg
 
    rf_sock_info.tx_msg.mhdr.msg_name       = &rf_sock_info.tx_addr;
    rf_sock_info.tx_msg.mhdr.msg_namelen    = sizeof(rf_sock_info.tx_addr);
    rf_sock_info.tx_msg.mhdr.msg_iov        = rf_sock_info.tx_msg.iov;
    rf_sock_info.tx_msg.mhdr.msg_iovlen     = IOV_NUM;
    rf_sock_info.tx_msg.mhdr.msg_control    = 0;
    rf_sock_info.tx_msg.mhdr.msg_controllen = 0;
    rf_sock_info.tx_msg.mhdr.msg_flags      = 0;

    for(int i = 0; i < RF_SOCK_MSGQ_SIZE; ++i)
      {
        memset(&rf_sock_info.rx_msgQ[i], 0x0, sizeof(rf_sock_info.rx_msgQ[i]));

        if((rf_sock_info.rx_msgQ[i].data = malloc(RF_SOCK_MAX_SF_LEN_BYTES)) == NULL)
          {
            RF_SOCK_WARN("FAILED to allocate memory for rx_msg[%d]", i);
            return -1;
          }
      }

    if(pthread_create(&rf_sock_info.rx_worker.tid, 
                      NULL, 
                      rf_sock_rx_worker, 
                      &rf_sock_info) < 0)
      {
         RF_SOCK_WARN("could not create rx_worker thread %s", strerror(errno));
         return -1;
      }

     // XXX other threads are FIFO, need to check for priority inversions
     const int policy = SCHED_RR;

     // XXX what prio ???
     const struct sched_param param = {sched_get_priority_max(policy) / 2};
       
     if(pthread_setschedparam(rf_sock_info.rx_worker.tid, policy, &param) < 0)
       {
          RF_SOCK_WARN("could not set worker thread rt_priority %s", strerror(errno));
          return -1;
       }
      else
       {
          RF_SOCK_INFO("set worker thread priority/policy %d:%d", param.sched_priority, policy);
       }


   *h = &rf_sock_info;

   return 0;
 }


int rf_sock_close(void *h)
 {
   GET_DEV_INFO(h);

   close(_info->rx_handle);

   close(_info->tx_handle);

   return 0;
 }


void rf_sock_set_master_clock_rate(void *h, double rate)
 {
   GET_DEV_INFO(h);

   RF_SOCK_DBUG("rate %4.2lf MHz to %4.2lf MHz", 
                 _info->clock_rate / 1e6, rate / 1e6);

   _info->clock_rate = rate;
 }


bool rf_sock_is_master_clock_dynamic(void *h)
 {
   RF_SOCK_LOG_FUNC_TODO;

   return false;
 }


double rf_sock_set_rx_gain(void *h, double gain)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("gain %3.2lf to %3.2lf", _info->rx_gain, gain);

   _info->rx_gain = gain;

   return _info->rx_gain;
 }


double rf_sock_set_tx_gain(void *h, double gain)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("gain %3.2lf to %3.2lf", _info->tx_gain, gain);

   _info->tx_gain = gain;

   return _info->tx_gain;
 }


double rf_sock_get_rx_gain(void *h)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("gain %3.2lf", _info->rx_gain);

   return _info->rx_gain;
 }


double rf_sock_get_tx_gain(void *h)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("gain %3.2lf", _info->tx_gain);

   return _info->tx_gain;
 }


double rf_sock_set_rx_srate(void *h, double rate)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("srate %4.2lf MHz to %4.2lf MHz", 
                 _info->rx_srate / 1e6, rate / 1e6);

   _info->rx_srate = rate;

   return _info->rx_srate;
 }


double rf_sock_set_tx_srate(void *h, double rate)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("srate %4.2lf MHz to %4.2lf MHz", 
                 _info->tx_srate / 1e6, rate / 1e6);

   _info->tx_srate = rate;

   return _info->tx_srate;
 }


double rf_sock_set_rx_freq(void *h, double freq)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("freq %4.2lf MHz to %4.2lf MHz", 
                 _info->rx_freq / 1e6, freq / 1e6);

   _info->rx_freq = freq;

   return _info->rx_freq;
 }


double rf_sock_set_tx_freq(void *h, double freq)
 {
   GET_DEV_INFO(h);

   RF_SOCK_INFO("freq %4.2lf MHz to %4.2lf MHz", 
                 _info->tx_freq / 1e6, freq / 1e6);

   _info->tx_freq = freq;

   return _info->tx_freq;
 }


void rf_sock_set_tx_cal(void *h, srslte_rf_cal_t *cal)
{
   GET_DEV_INFO(h);

   memcpy(&(_info->tx_cal), cal, sizeof(srslte_rf_cal_t));

   RF_SOCK_INFO("gain %3.2lf, phase %3.2lf, I %3.2lf, Q %3.2lf", 
                 cal->dc_gain, 
                 cal->dc_phase, 
                 cal->iq_i,
                 cal->iq_q);
}


void rf_sock_set_rx_cal(void *h, srslte_rf_cal_t *cal)
{
   GET_DEV_INFO(h);

   memcpy(&(_info->rx_cal), cal, sizeof(srslte_rf_cal_t));

   RF_SOCK_INFO("gain %3.2lf, phase %3.2lf, I %3.2lf, Q %3.2lf", 
                 cal->dc_gain,
                 cal->dc_phase,
                 cal->iq_i,
                 cal->iq_q);
}


void rf_sock_get_time(void *h, time_t *full_secs, double *frac_secs)
 {
   GET_DEV_INFO(h);

   RF_SOCK_DBUG("XXX");

   rf_sock_tv_to_ts(&_info->tv_this_tti, full_secs, frac_secs);
 }



static void rf_sock_recv_bump_time(void *h)
{
   GET_DEV_INFO(h);

   struct timeval tv_in, tv_diff;

   gettimeofday(&tv_in, NULL);

   // this is where we set the pace for the system TTI
   timersub(&_info->tv_next_tti, &tv_in, &tv_diff);

   if(timercmp(&tv_diff, &tv_zero, >))
     {
       select(0, NULL, NULL, NULL, &tv_diff);
     }

   do{
       _info->tv_this_tti = _info->tv_next_tti;

       timeradd(&_info->tv_this_tti, &tv_tti_step, &_info->tv_next_tti);
    } while(timercmp(&tv_in, &_info->tv_next_tti, >=));
}




int rf_sock_recv_with_time(void *h, void *data, uint32_t nsamples, 
                           bool blocking, time_t *full_secs, double *frac_secs)
 {
   GET_DEV_INFO(h);

   rf_sock_recv_bump_time(h);

   struct timeval tv_diff, tv_now, tv_rxtti = _info->tv_this_tti;

   int nof_bytes_pending = BYTES_PER_SAMPLE(nsamples);

   int nof_samples_pending = nsamples;

   uint8_t * p2data = (uint8_t *)data;

   int nof_sf_pending = (nsamples / (_info->rx_srate / 1000.0f));

   memset(data, 0x00, nof_bytes_pending);

   // lock for msqQ info
   pthread_mutex_lock(&_info->rx_lock);

   int nof_sf_available = _info->rx_msgQ_num;

   RF_SOCK_INFO("RX IN  pending %d, rx_srate %6.2f Mhz, nsamples %d, inQ %d",
                nof_sf_pending,
                _info->rx_srate / 1.0e6,
                nsamples,
                nof_sf_available);

   while((nof_sf_available > 0) && (nof_sf_pending > 0))
     {   
       int nof_sf_ready = 0;

       gettimeofday(&tv_now, NULL);

       nof_sf_available = _info->rx_msgQ_num;

       // check for ready subframes
       for(int i = 0, tail = _info->rx_msgQ_tail; 
             (i < nof_sf_available) && (nof_sf_pending > nof_sf_ready);
                ++i, RF_SOCK_BUMP_MSGQ_IDX(tail))
        {
          rf_sock_iomsg_t * iomsg = &_info->rx_msgQ[tail];

          timersub(&tv_now, &iomsg->hdr.tx_tti, &tv_diff);

          bool sf_ready = timercmp(&tv_diff, &tv_zero, >=);

          if(sf_ready)
            {
              nof_sf_ready += 1;
            }

#ifdef DEBUG_MODE
          RF_SOCK_DBUG("RX sf_needed %d, inQ %d, tail %d, seqn %ld, tx_tti %ld:%06ld, tti_diff %ld:%06ld, ready %s",
                        nof_sf_pending - nof_sf_ready,
                        nof_sf_available,
                        tail,
                        iomsg->hdr.seqnum,
                        iomsg->hdr.tx_tti.tv_sec % 60,
                        iomsg->hdr.tx_tti.tv_usec,
                        tv_diff.tv_sec,
                        tv_diff.tv_usec,
                        sf_ready ? "yes" : "no");
#endif
         }

        if(nof_sf_ready >= nof_sf_pending)
          {
            for(int i = 0; i < nof_sf_ready; ++i)
              {
                rf_sock_iomsg_t * iomsg = &_info->rx_msgQ[_info->rx_msgQ_tail];

#ifdef HEX_DEBUG_MODE
                rf_sock_print_hex("Q hdr" , &iomsg->hdr, sizeof(iomsg->hdr));
                rf_sock_print_hex("Q data", iomsg->data, 64);
#endif

                const int nof_samples_out = rf_sock_resample(h,
                                                             iomsg->hdr.srate,
                                                             _info->rx_srate,
                                                             iomsg->data,
                                                             p2data, 
                                                             iomsg->hdr.nof_samples);

                const int nof_bytes_out = BYTES_PER_SAMPLE(nof_samples_out);

                p2data += nof_bytes_out;

                nof_bytes_pending   -= nof_bytes_out;
                nof_samples_pending -= nof_samples_out;

                nof_sf_pending     -= 1;
                _info->rx_msgQ_num -= 1;

                RF_SOCK_BUMP_MSGQ_IDX(_info->rx_msgQ_tail);

                // use the msg tti
                tv_rxtti = iomsg->hdr.tx_tti;
            }
         }
       else
         {
           if(rf_sock_is_enb(_info))
             {
                break;
             }
           else
             {
#ifdef DEBUG_MODE
                RF_SOCK_DBUG("RX wait, pending sm/by/sf %d/%d/%d", 
                              nof_samples_pending, 
                              nof_bytes_pending,
                              nof_sf_pending);
#endif

                pthread_cond_wait(&_info->rx_msgQ_cond, &_info->rx_lock);
             }
          }
      }

   pthread_mutex_unlock(&_info->rx_lock);

   if(nof_sf_pending > 0)
    {
      RF_SOCK_INFO("RX OUT pending sm/by/sf %d/%d/%d, rx_tti %ld:%06ld", 
                    nof_samples_pending, 
                    nof_bytes_pending,
                    nof_sf_pending,
                    tv_rxtti.tv_sec % 60,
                    tv_rxtti.tv_usec);
    }

   rf_sock_tv_to_ts(&tv_rxtti, full_secs, frac_secs);

   // we always just return what was asked for
   // enb does not seem to care and ue is not happy with 0
   return nsamples;
 }



int rf_sock_recv_with_time_multi(void *h, void **data, uint32_t nsamples, 
                                 bool blocking, time_t *full_secs, double *frac_secs)
{
   return rf_sock_recv_with_time(h, 
                                 data[0],
                                 nsamples, 
                                 blocking,
                                 full_secs,
                                 frac_secs);
}


int rf_sock_send_timed(void *h, void *data, int nsamples,
                       time_t full_secs, double frac_secs, bool has_time_spec,
                       bool blocking, bool is_sob, bool is_eob)
{
   GET_DEV_INFO(h);

   if(nsamples <= 0)
     {
       RF_SOCK_DBUG("msg len %d, sob %d, eob %d", nsamples, is_sob, is_eob);

       return 0;
     }

   struct timeval tx_tti = _info->tv_next_tti;

   // set the time this msg is expected to be sent OTA (this_tti + ~4)
   if(has_time_spec)
     {
       rf_sock_ts_to_tv(&tx_tti, full_secs, frac_secs);
     }

   const uint32_t nof_bytes = BYTES_PER_SAMPLE(nsamples);

   _info->tx_msg.is_sob                = is_sob;
   _info->tx_msg.is_eob                = is_eob;
   _info->tx_msg.iomsg.hdr.srate       = _info->tx_srate;
   _info->tx_msg.iomsg.hdr.gain        = _info->tx_gain;
   _info->tx_msg.iomsg.hdr.seqnum      = ++_info->tx_seqnum;
   _info->tx_msg.iomsg.hdr.nof_bytes   = nof_bytes;
   _info->tx_msg.iomsg.hdr.nof_samples = nsamples;
   _info->tx_msg.iov[1].iov_len        = nof_bytes;
   _info->tx_msg.iov[1].iov_base       = data;

   struct timeval tv_now, tv_diff;

   gettimeofday(&tv_now, NULL);

   _info->tx_msg.iomsg.hdr.tx_time = tv_now;

   _info->tx_msg.iomsg.hdr.tx_tti  = tx_tti;

   timersub(&tx_tti, &tv_now, &tv_diff);

   // this msg tx tti time has passed
   if(timercmp(&tv_diff, &tv_zero, <))
     {
       ++_info->tx_nof_late;

       RF_SOCK_WARN("TX LATE, seqnum %lu, tx_tti %ld:%06ld, tti_diff %ld:%06ld, total late %zu",
                    _info->tx_msg.iomsg.hdr.seqnum,
                    tx_tti.tv_sec % 60,
                    tx_tti.tv_usec,
                    tv_diff.tv_sec,
                    tv_diff.tv_usec,
                    _info->tx_nof_late);
     }
   else
     {
       ++_info->tx_nof_ok;

       const int rc = rf_sock_send_msg(h);

       if(rc > 0 && ! (_info->tx_nof_ok % 100))
         {
            RF_SOCK_WARN("TX OK, seqnum %lu, tx_tti %ld:%06ld, tti_diff %ld:%06ld, total ok %zu",
                         _info->tx_msg.iomsg.hdr.seqnum,
                          tx_tti.tv_sec % 60,
                         tx_tti.tv_usec,
                         tv_diff.tv_sec,
                         tv_diff.tv_usec,
                         _info->tx_nof_ok);
         }
     }

#ifdef HEX_DEBUG_MODE
       rf_sock_print_hex("sample data", data, 64);
#endif

   return nsamples;
}



int rf_sock_send_timed_multi(void *h, void *data[4], int nsamples,
                             time_t full_secs, double frac_secs, bool has_time_spec,
                             bool blocking, bool is_sob, bool is_eob)
{
  return rf_sock_send_timed(h, 
                            data[0], 
                            nsamples,
                            full_secs,
                            frac_secs,
                            has_time_spec,
                            blocking,
                            is_sob,
                            is_eob);
}



