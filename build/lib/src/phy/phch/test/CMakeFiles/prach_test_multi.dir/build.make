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
include lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/depend.make

# Include the progress variables for this target.
include lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/progress.make

# Include the compile flags for this target's objects.
include lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/flags.make

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/flags.make
lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o: ../lib/src/phy/phch/test/prach_test_multi.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o"
	cd /home/mdasari/srsLTE/build/lib/src/phy/phch/test && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o   -c /home/mdasari/srsLTE/lib/src/phy/phch/test/prach_test_multi.c

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/prach_test_multi.dir/prach_test_multi.c.i"
	cd /home/mdasari/srsLTE/build/lib/src/phy/phch/test && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mdasari/srsLTE/lib/src/phy/phch/test/prach_test_multi.c > CMakeFiles/prach_test_multi.dir/prach_test_multi.c.i

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/prach_test_multi.dir/prach_test_multi.c.s"
	cd /home/mdasari/srsLTE/build/lib/src/phy/phch/test && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mdasari/srsLTE/lib/src/phy/phch/test/prach_test_multi.c -o CMakeFiles/prach_test_multi.dir/prach_test_multi.c.s

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.requires:

.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.requires

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.provides: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.requires
	$(MAKE) -f lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/build.make lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.provides.build
.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.provides

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.provides.build: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o


# Object files for target prach_test_multi
prach_test_multi_OBJECTS = \
"CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o"

# External object files for target prach_test_multi
prach_test_multi_EXTERNAL_OBJECTS =

lib/src/phy/phch/test/prach_test_multi: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o
lib/src/phy/phch/test/prach_test_multi: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/build.make
lib/src/phy/phch/test/prach_test_multi: lib/src/phy/libsrslte_phy.a
lib/src/phy/phch/test/prach_test_multi: /usr/lib/x86_64-linux-gnu/libfftw3f.so
lib/src/phy/phch/test/prach_test_multi: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mdasari/srsLTE/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable prach_test_multi"
	cd /home/mdasari/srsLTE/build/lib/src/phy/phch/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prach_test_multi.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/build: lib/src/phy/phch/test/prach_test_multi

.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/build

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/requires: lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/prach_test_multi.c.o.requires

.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/requires

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/clean:
	cd /home/mdasari/srsLTE/build/lib/src/phy/phch/test && $(CMAKE_COMMAND) -P CMakeFiles/prach_test_multi.dir/cmake_clean.cmake
.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/clean

lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/depend:
	cd /home/mdasari/srsLTE/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mdasari/srsLTE /home/mdasari/srsLTE/lib/src/phy/phch/test /home/mdasari/srsLTE/build /home/mdasari/srsLTE/build/lib/src/phy/phch/test /home/mdasari/srsLTE/build/lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/src/phy/phch/test/CMakeFiles/prach_test_multi.dir/depend

