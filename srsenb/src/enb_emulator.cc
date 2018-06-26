/**
 *
 * \section COPYRIGHT
 *
 * Copyright 2013-2017 Software Radio Systems Limited
 *
 * \section LICENSE
 *
 * This file is part of srsLTE.
 *
 * srsUE is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * srsUE is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * A copy of the GNU Affero General Public License can be found in
 * the LICENSE file in the top-level directory of this distribution
 * and at http://www.gnu.org/licenses/.
 *
 */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/sctp.h>
#include <arpa/inet.h>

namespace srsenb {

void connect_mme()
{
  socket_fd = 0;
  struct sockaddr_in mme_addr;

  printf("Connecting to MME %s:%d\n", args.mme_addr.c_str(), MME_PORT);

  if((socket_fd = socket(ADDR_FAMILY, SOCK_TYPE, PROTO)) == -1) {
    printf("Failed to create S1AP socket\n");
    return false;
  }

  // Connect to the MME address
  memset(&mme_addr, 0, sizeof(struct sockaddr_in));
  mme_addr.sin_family = ADDR_FAMILY;
  mme_addr.sin_port = htons(MME_PORT);
  if(inet_pton(AF_INET, args.mme_addr.c_str(), &(mme_addr.sin_addr)) != 1) {
    printf("Error converting IP address (%s) to sockaddr_in structure\n", args.mme_addr.c_str());
    return false;
  }

  if(connect(socket_fd, (struct sockaddr*)&mme_addr, sizeof(mme_addr)) == -1) {
    printf("Failed to establish socket connection to MME\n");
    return false;
  }

  printf("SCTP socket established with MME\n");
  return true;
}

} // namespace srsenb
