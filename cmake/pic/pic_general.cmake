###########################
# This file contains general options for programming PIC with CMake
###########################
if(NOT PIC_GENERAL_INCLUDED)
set(PIC_GENERAL_INCLUDED true)

message(STATUS "Loading pic_general.cmake...")

#################
# SDCC options.
# SDCC is a C++ compiler for PIC, which most importantly produces a hex file for
# a given source code. This hex file is then loaded with pk2cmd command-line
# tool.
#################

set(CMAKE_C_COMPILER /usr/local/bin/sdcc)
set(CMAKE_CXX_COMPILER /usr/local/bin/sdcc)

# Use non-free option to find the header for PIC16F887.
set(SDCC_NON_FREE_OPTION "use-non-free")

# Define PIC bit type. Either 14 or 16 for the version of SDCC I downloaded.
# The header file for the pic16f887.h should be located at:
# /usr/local/share/sdcc/non-free/include/pic14
set(SDCC_PIC_BIT_TYPE "pic14")

# Define the PIC device.
set(SDCC_PIC_DEVICE "16f887")

# Combine all of the necessary options for SDCC compiler
set(CMAKE_C_FLAGS "--${SDCC_NON_FREE_OPTION} -m${SDCC_PIC_BIT_TYPE} -p${SDCC_PIC_DEVICE}")


#####################
# pk2cmd options.
# pk2cmd is a command-line tool which programs PIC MCU with hex files.
#####################

# Command-line command to use pk2cmd, which is the programmer for PIC MCU.
set(PK2_COMMAND "pk2cmd")

# Tell pk2cmd which PIC device is to be programmed.
set(PK2_PIC_DEVICE "pic16f887")

# Set the voltage powring the PIC device.
set(PK2_VOLTAGE "4")

# This allows pk2cmd to find PK2DeviceFile.dat which is required for operation.
set(ENV{PATH} "$ENV{PATH}:/usr/share/pk2/")

endif()
