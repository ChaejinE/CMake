# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build

# Include any dependencies generated for this target.
include CMakeFiles/program.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/program.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/program.dir/flags.make

CMakeFiles/program.dir/main.cpp.o: CMakeFiles/program.dir/flags.make
CMakeFiles/program.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/program.dir/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/program.dir/main.cpp.o -c /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/main.cpp

CMakeFiles/program.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/program.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/main.cpp > CMakeFiles/program.dir/main.cpp.i

CMakeFiles/program.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/program.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/main.cpp -o CMakeFiles/program.dir/main.cpp.s

CMakeFiles/program.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/program.dir/main.cpp.o.requires

CMakeFiles/program.dir/main.cpp.o.provides: CMakeFiles/program.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/program.dir/build.make CMakeFiles/program.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/program.dir/main.cpp.o.provides

CMakeFiles/program.dir/main.cpp.o.provides.build: CMakeFiles/program.dir/main.cpp.o


# Object files for target program
program_OBJECTS = \
"CMakeFiles/program.dir/main.cpp.o"

# External object files for target program
program_EXTERNAL_OBJECTS =

program: CMakeFiles/program.dir/main.cpp.o
program: CMakeFiles/program.dir/build.make
program: CMakeFiles/program.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable program"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/program.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/program.dir/build: program

.PHONY : CMakeFiles/program.dir/build

CMakeFiles/program.dir/requires: CMakeFiles/program.dir/main.cpp.o.requires

.PHONY : CMakeFiles/program.dir/requires

CMakeFiles/program.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/program.dir/cmake_clean.cmake
.PHONY : CMakeFiles/program.dir/clean

CMakeFiles/program.dir/depend:
	cd /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build /home/cjlotto/git_clone/CMake/b_Practice_Make_file/Practice/build/CMakeFiles/program.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/program.dir/depend

