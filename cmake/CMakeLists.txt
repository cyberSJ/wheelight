cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(wheelight)

set(CMAKE_C_COMPILER /usr/local/bin/sdcc)
set(CMAKE_CXX_COMPILER /usr/local/bin/sdcc)

###################
# Build example
###################

# Use non-free option to find the header for PIC16F887.
set(NON_FREE_OPTION "use-non-free")

# Define PIC bit type. Either 14 or 16 for the version of SDCC I downloaded.
set(PIC_BIT_TYPE "pic14")

# Define the PIC device.
set(PIC_DEVICE "16f887")

set(CMAKE_C_FLAGS "--${NON_FREE_OPTION} -m${PIC_BIT_TYPE} -p${PIC_DEVICE}")

set(TOP_DIR ${PROJECT_SOURCE_DIR}/..)

set(EXAMPLE_NAME "blink")

add_executable(${EXAMPLE_NAME} ${TOP_DIR}/example/sdcc/${EXAMPLE_NAME}.c)

###################
# Program MCU.
###################

# With this, you can do "make pic_example" to program PIC MCU.
# Use .cmake module because we need environment variable during target
# (pic_example) build time.
add_custom_target(program_pic
                  COMMAND ${CMAKE_COMMAND} -P ${TOP_DIR}/cmake/example/program_pic.cmake
                  DEPENDS ${PROJECT_BINARY_DIR}/${EXAMPLE_NAME}.hex
                  WORKING_DIRECTORY ${TOP_DIR}/build
                  COMMENT "CMake loading the program to PIC MCU")

# sung add common pic cmake where we can sepcify pic device only 1 time.
