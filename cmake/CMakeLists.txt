cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

# This will set ${POJECT_SOURCE_DIR} to path where this CMakeLists.txt file
# resides.
project(wheelight)

# Create a path to wheelight repo's top directory.
set(TOP_DIR ${PROJECT_SOURCE_DIR}/..)

###################
# SDCC PIC example
###################

# Add example to the cmake build tree. However, user must specify explicitly to
# make the example by "make -j4 blink" because EXCLUDE_FROM_ALL option is used
# on purpose. This was used in purpose in order to not build example by default
# when the entire project is built.
add_subdirectory(${TOP_DIR}/cmake/example
                 EXCLUDE_FROM_ALL)
