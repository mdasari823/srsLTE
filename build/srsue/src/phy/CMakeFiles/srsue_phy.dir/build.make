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
include srsue/src/phy/CMakeFiles/srsue_phy.dir/depend.make

# Include the progress variables for this target.
include srsue/src/phy/CMakeFiles/srsue_phy.dir/progress.make

# Include the compile flags for this target's objects.
include srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o: srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make
srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o: ../srsue/src/phy/phy.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsue_phy.dir/phy.cc.o -c /home/mdasari/srsLTE/srsue/src/phy/phy.cc

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsue_phy.dir/phy.cc.i"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/srsue/src/phy/phy.cc > CMakeFiles/srsue_phy.dir/phy.cc.i

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsue_phy.dir/phy.cc.s"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/srsue/src/phy/phy.cc -o CMakeFiles/srsue_phy.dir/phy.cc.s

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.requires:

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.provides: srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.requires
	$(MAKE) -f srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.provides.build
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.provides

srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.provides.build: srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o


srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o: srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make
srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o: ../srsue/src/phy/phch_worker.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsue_phy.dir/phch_worker.cc.o -c /home/mdasari/srsLTE/srsue/src/phy/phch_worker.cc

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsue_phy.dir/phch_worker.cc.i"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/srsue/src/phy/phch_worker.cc > CMakeFiles/srsue_phy.dir/phch_worker.cc.i

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsue_phy.dir/phch_worker.cc.s"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/srsue/src/phy/phch_worker.cc -o CMakeFiles/srsue_phy.dir/phch_worker.cc.s

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.requires:

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.provides: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.requires
	$(MAKE) -f srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.provides.build
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.provides

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.provides.build: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o


srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o: srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make
srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o: ../srsue/src/phy/phch_recv.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsue_phy.dir/phch_recv.cc.o -c /home/mdasari/srsLTE/srsue/src/phy/phch_recv.cc

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsue_phy.dir/phch_recv.cc.i"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/srsue/src/phy/phch_recv.cc > CMakeFiles/srsue_phy.dir/phch_recv.cc.i

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsue_phy.dir/phch_recv.cc.s"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/srsue/src/phy/phch_recv.cc -o CMakeFiles/srsue_phy.dir/phch_recv.cc.s

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.requires:

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.provides: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.requires
	$(MAKE) -f srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.provides.build
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.provides

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.provides.build: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o


srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o: srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make
srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o: ../srsue/src/phy/phch_common.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsue_phy.dir/phch_common.cc.o -c /home/mdasari/srsLTE/srsue/src/phy/phch_common.cc

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsue_phy.dir/phch_common.cc.i"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/srsue/src/phy/phch_common.cc > CMakeFiles/srsue_phy.dir/phch_common.cc.i

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsue_phy.dir/phch_common.cc.s"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/srsue/src/phy/phch_common.cc -o CMakeFiles/srsue_phy.dir/phch_common.cc.s

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.requires:

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.provides: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.requires
	$(MAKE) -f srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.provides.build
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.provides

srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.provides.build: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o


srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o: srsue/src/phy/CMakeFiles/srsue_phy.dir/flags.make
srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o: ../srsue/src/phy/prach.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/srsue_phy.dir/prach.cc.o -c /home/mdasari/srsLTE/srsue/src/phy/prach.cc

srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/srsue_phy.dir/prach.cc.i"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mdasari/srsLTE/srsue/src/phy/prach.cc > CMakeFiles/srsue_phy.dir/prach.cc.i

srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/srsue_phy.dir/prach.cc.s"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mdasari/srsLTE/srsue/src/phy/prach.cc -o CMakeFiles/srsue_phy.dir/prach.cc.s

srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.requires:

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.provides: srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.requires
	$(MAKE) -f srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.provides.build
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.provides

srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.provides.build: srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o


# Object files for target srsue_phy
srsue_phy_OBJECTS = \
"CMakeFiles/srsue_phy.dir/phy.cc.o" \
"CMakeFiles/srsue_phy.dir/phch_worker.cc.o" \
"CMakeFiles/srsue_phy.dir/phch_recv.cc.o" \
"CMakeFiles/srsue_phy.dir/phch_common.cc.o" \
"CMakeFiles/srsue_phy.dir/prach.cc.o"

# External object files for target srsue_phy
srsue_phy_EXTERNAL_OBJECTS =

srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/build.make
srsue/src/phy/libsrsue_phy.a: srsue/src/phy/CMakeFiles/srsue_phy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libsrsue_phy.a"
	cd /home/mdasari/srsLTE/build/srsue/src/phy && $(CMAKE_COMMAND) -P CMakeFiles/srsue_phy.dir/cmake_clean_target.cmake
	cd /home/mdasari/srsLTE/build/srsue/src/phy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/srsue_phy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
srsue/src/phy/CMakeFiles/srsue_phy.dir/build: srsue/src/phy/libsrsue_phy.a

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/build

srsue/src/phy/CMakeFiles/srsue_phy.dir/requires: srsue/src/phy/CMakeFiles/srsue_phy.dir/phy.cc.o.requires
srsue/src/phy/CMakeFiles/srsue_phy.dir/requires: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_worker.cc.o.requires
srsue/src/phy/CMakeFiles/srsue_phy.dir/requires: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_recv.cc.o.requires
srsue/src/phy/CMakeFiles/srsue_phy.dir/requires: srsue/src/phy/CMakeFiles/srsue_phy.dir/phch_common.cc.o.requires
srsue/src/phy/CMakeFiles/srsue_phy.dir/requires: srsue/src/phy/CMakeFiles/srsue_phy.dir/prach.cc.o.requires

.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/requires

srsue/src/phy/CMakeFiles/srsue_phy.dir/clean:
	cd /home/mdasari/srsLTE/build/srsue/src/phy && $(CMAKE_COMMAND) -P CMakeFiles/srsue_phy.dir/cmake_clean.cmake
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/clean

srsue/src/phy/CMakeFiles/srsue_phy.dir/depend:
	cd /home/mdasari/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mdasari/srsLTE /home/mdasari/srsLTE/srsue/src/phy /home/mdasari/srsLTE/build /home/mdasari/srsLTE/build/srsue/src/phy /home/mdasari/srsLTE/build/srsue/src/phy/CMakeFiles/srsue_phy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : srsue/src/phy/CMakeFiles/srsue_phy.dir/depend

