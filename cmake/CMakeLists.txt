cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(wheelight)

set(CMAKE_C_COMPILER /usr/local/bin/sdcc)
set(CMAKE_CXX_COMPILER /usr/local/bin/sdcc)

# Use non-free option to find the header for PIC16F887.
set(NON_FREE_OPTION "use-non-free")

# Define PIC bit type. Either 14 or 16 for the version of SDCC I downloaded.
set(PIC_BIT_TYPE "pic14")

# Define the PIC device.
set(PIC_DEVICE "16f887")

set(CMAKE_C_FLAGS "--${NON_FREE_OPTION} -m${PIC_BIT_TYPE} -p${PIC_DEVICE}")

set(TOP_DIR ${PROJECT_SOURCE_DIR}/..)

add_executable(blink ${TOP_DIR}/example/sdcc/blink.c)

# Program MCU.
message(STATUS "cmake install prefix = " ${CMAKE_INSTALL_PREFIX})
# sung I think make install is not the command I would use to program MCU.
# Maybe these cmake commands are candidates:
# add_custom_command()
# add_custom_target()
# execute_process()

# With this, you can do "make sung_target" to perform custom commands.
add_custom_target(sung_target 
                  cat blink.lst
                  DEPENDS ${PROJECT_BINARY_DIR}/blink.lst)
