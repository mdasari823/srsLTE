# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mdasari/srsLTE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mdasari/srsLTE/build

# Include any dependencies generated for this target.
include lib/src/common/CMakeFiles/srslte_common.dir/depend.make

# Include the progress variables for this target.
include lib/src/common/CMakeFiles/srslte_common.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/common/CMakeFiles/srslte_common.dir/flags.make

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o: ../lib/src/common/threads.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srslte_common.dir/threads.c.o   -c /home/mdasari/srsLTE/lib/src/common/threads.c

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srslte_common.dir/threads.c.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/threads.c > CMakeFiles/srslte_common.dir/threads.c.i

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srslte_common.dir/threads.c.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/threads.c -o CMakeFiles/srslte_common.dir/threads.c.s

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o


lib/src/common/CMakeFiles/srslte_common.dir/version.c.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/version.c.o: ../lib/src/common/version.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object lib/src/common/CMakeFiles/srslte_common.dir/version.c.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/srslte_common.dir/version.c.o   -c /home/mdasari/srsLTE/lib/src/common/version.c

lib/src/common/CMakeFiles/srslte_common.dir/version.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/srslte_common.dir/version.c.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/version.c > CMakeFiles/srslte_common.dir/version.c.i

lib/src/common/CMakeFiles/srslte_common.dir/version.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/srslte_common.dir/version.c.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/version.c -o CMakeFiles/srslte_common.dir/version.c.s

lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/version.c.o


lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o: ../lib/src/common/snow_3g.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/snow_3g.cc.o -c /home/mdasari/srsLTE/lib/src/common/snow_3g.cc

lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/snow_3g.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/snow_3g.cc > CMakeFiles/srslte_common.dir/snow_3g.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/snow_3g.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/snow_3g.cc -o CMakeFiles/srslte_common.dir/snow_3g.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o: ../lib/src/common/liblte_security.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/liblte_security.cc.o -c /home/mdasari/srsLTE/lib/src/common/liblte_security.cc

lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/liblte_security.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/liblte_security.cc > CMakeFiles/srslte_common.dir/liblte_security.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/liblte_security.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/liblte_security.cc -o CMakeFiles/srslte_common.dir/liblte_security.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o: ../lib/src/common/thread_pool.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/thread_pool.cc.o -c /home/mdasari/srsLTE/lib/src/common/thread_pool.cc

lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/thread_pool.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/thread_pool.cc > CMakeFiles/srslte_common.dir/thread_pool.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/thread_pool.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/thread_pool.cc -o CMakeFiles/srslte_common.dir/thread_pool.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o: ../lib/src/common/mac_pcap.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/mac_pcap.cc.o -c /home/mdasari/srsLTE/lib/src/common/mac_pcap.cc

lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/mac_pcap.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/mac_pcap.cc > CMakeFiles/srslte_common.dir/mac_pcap.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/mac_pcap.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/mac_pcap.cc -o CMakeFiles/srslte_common.dir/mac_pcap.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o: ../lib/src/common/log_filter.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/log_filter.cc.o -c /home/mdasari/srsLTE/lib/src/common/log_filter.cc

lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/log_filter.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/log_filter.cc > CMakeFiles/srslte_common.dir/log_filter.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/log_filter.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/log_filter.cc -o CMakeFiles/srslte_common.dir/log_filter.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o: ../lib/src/common/pdu.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/pdu.cc.o -c /home/mdasari/srsLTE/lib/src/common/pdu.cc

lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/pdu.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/pdu.cc > CMakeFiles/srslte_common.dir/pdu.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/pdu.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/pdu.cc -o CMakeFiles/srslte_common.dir/pdu.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o: ../lib/src/common/buffer_pool.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/buffer_pool.cc.o -c /home/mdasari/srsLTE/lib/src/common/buffer_pool.cc

lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/buffer_pool.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/buffer_pool.cc > CMakeFiles/srslte_common.dir/buffer_pool.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/buffer_pool.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/buffer_pool.cc -o CMakeFiles/srslte_common.dir/buffer_pool.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o: ../lib/src/common/pdu_queue.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/pdu_queue.cc.o -c /home/mdasari/srsLTE/lib/src/common/pdu_queue.cc

lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/pdu_queue.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/pdu_queue.cc > CMakeFiles/srslte_common.dir/pdu_queue.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/pdu_queue.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/pdu_queue.cc -o CMakeFiles/srslte_common.dir/pdu_queue.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o: ../lib/src/common/tti_sync_cv.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o -c /home/mdasari/srsLTE/lib/src/common/tti_sync_cv.cc

lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/tti_sync_cv.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/tti_sync_cv.cc > CMakeFiles/srslte_common.dir/tti_sync_cv.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/tti_sync_cv.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/tti_sync_cv.cc -o CMakeFiles/srslte_common.dir/tti_sync_cv.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o: ../lib/src/common/security.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/security.cc.o -c /home/mdasari/srsLTE/lib/src/common/security.cc

lib/src/common/CMakeFiles/srslte_common.dir/security.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/security.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/security.cc > CMakeFiles/srslte_common.dir/security.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/security.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/security.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/security.cc -o CMakeFiles/srslte_common.dir/security.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o: ../lib/src/common/task_dispatcher.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/task_dispatcher.cc.o -c /home/mdasari/srsLTE/lib/src/common/task_dispatcher.cc

lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/task_dispatcher.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/task_dispatcher.cc > CMakeFiles/srslte_common.dir/task_dispatcher.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/task_dispatcher.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/task_dispatcher.cc -o CMakeFiles/srslte_common.dir/task_dispatcher.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o: ../lib/src/common/logger_file.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/logger_file.cc.o -c /home/mdasari/srsLTE/lib/src/common/logger_file.cc

lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/logger_file.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/logger_file.cc > CMakeFiles/srslte_common.dir/logger_file.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/logger_file.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/logger_file.cc -o CMakeFiles/srslte_common.dir/logger_file.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o


lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o: lib/src/common/CMakeFiles/srslte_common.dir/flags.make
lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o: ../lib/src/common/nas_pcap.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srslte_common.dir/nas_pcap.cc.o -c /home/mdasari/srsLTE/lib/src/common/nas_pcap.cc

lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srslte_common.dir/nas_pcap.cc.i"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/lib/src/common/nas_pcap.cc > CMakeFiles/srslte_common.dir/nas_pcap.cc.i

lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srslte_common.dir/nas_pcap.cc.s"
	cd /home/mdasari/srsLTE/build/lib/src/common && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/lib/src/common/nas_pcap.cc -o CMakeFiles/srslte_common.dir/nas_pcap.cc.s

lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.requires:

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.requires

lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.provides: lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.requires
	$(MAKE) -f lib/src/common/CMakeFiles/srslte_common.dir/build.make lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.provides.build
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.provides

lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.provides.build: lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o


# Object files for target srslte_common
srslte_common_OBJECTS = \
"CMakeFiles/srslte_common.dir/threads.c.o" \
"CMakeFiles/srslte_common.dir/version.c.o" \
"CMakeFiles/srslte_common.dir/snow_3g.cc.o" \
"CMakeFiles/srslte_common.dir/liblte_security.cc.o" \
"CMakeFiles/srslte_common.dir/thread_pool.cc.o" \
"CMakeFiles/srslte_common.dir/mac_pcap.cc.o" \
"CMakeFiles/srslte_common.dir/log_filter.cc.o" \
"CMakeFiles/srslte_common.dir/pdu.cc.o" \
"CMakeFiles/srslte_common.dir/buffer_pool.cc.o" \
"CMakeFiles/srslte_common.dir/pdu_queue.cc.o" \
"CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o" \
"CMakeFiles/srslte_common.dir/security.cc.o" \
"CMakeFiles/srslte_common.dir/task_dispatcher.cc.o" \
"CMakeFiles/srslte_common.dir/logger_file.cc.o" \
"CMakeFiles/srslte_common.dir/nas_pcap.cc.o"

# External object files for target srslte_common
srslte_common_EXTERNAL_OBJECTS =

lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/version.c.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/build.make
lib/src/common/libsrslte_common.a: lib/src/common/CMakeFiles/srslte_common.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Linking CXX static library libsrslte_common.a"
	cd /home/mdasari/srsLTE/build/lib/src/common && $(CMAKE_COMMAND) -P CMakeFiles/srslte_common.dir/cmake_clean_target.cmake
	cd /home/mdasari/srsLTE/build/lib/src/common && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/srslte_common.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/src/common/CMakeFiles/srslte_common.dir/build: lib/src/common/libsrslte_common.a

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/build

lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/threads.c.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/version.c.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/snow_3g.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/liblte_security.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/thread_pool.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/mac_pcap.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/log_filter.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/pdu.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/buffer_pool.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/pdu_queue.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/tti_sync_cv.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/security.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/task_dispatcher.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/logger_file.cc.o.requires
lib/src/common/CMakeFiles/srslte_common.dir/requires: lib/src/common/CMakeFiles/srslte_common.dir/nas_pcap.cc.o.requires

.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/requires

lib/src/common/CMakeFiles/srslte_common.dir/clean:
	cd /home/mdasari/srsLTE/build/lib/src/common && $(CMAKE_COMMAND) -P CMakeFiles/srslte_common.dir/cmake_clean.cmake
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/clean

lib/src/common/CMakeFiles/srslte_common.dir/depend:
	cd /home/mdasari/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mdasari/srsLTE /home/mdasari/srsLTE/lib/src/common /home/mdasari/srsLTE/build /home/mdasari/srsLTE/build/lib/src/common /home/mdasari/srsLTE/build/lib/src/common/CMakeFiles/srslte_common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/common/CMakeFiles/srslte_common.dir/depend

