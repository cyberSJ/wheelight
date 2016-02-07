cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

########################
# This file makes and loads 44-pin LED board populated with PIC16F887 with
# blinking LED example.
########################

message(STATUS "To build the example, \"make -j4 blink\", then \"make pic_example\".")

# Let CMake be able to find the .cmake module related to PIC.
list(APPEND CMAKE_MODULE_PATH ${TOP_DIR}/cmake/pic)

# Load PIC CMake module that contains general options for programming PIC.
# When include()ing a .cmake module, .cmake extension must not be used.
# For example, include(pic_general.cmake) does not work as cmak module.
include(pic_general)

set(EXAMPLE_NAME "blink")

add_executable(${EXAMPLE_NAME} ${TOP_DIR}/example/sdcc/${EXAMPLE_NAME}.c)

# Program MCU.
# With this, you can do "make pic_example" to program PIC MCU (This is only 
# after you explicitly "make -j blink"). Use .cmake module because we need 
# environment variable during target (pic_example) build time.
add_custom_target(pic_example
                  COMMAND ${CMAKE_COMMAND} 
                    -D CMAKE_MODULE_PATH=${CMAKE_MODULE_PATH}
                    -D SOURCE_NAME=${EXAMPLE_NAME}
                    -P ${TOP_DIR}/cmake/pic/program_pic.cmake
                  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/${EXAMPLE_NAME}.hex
                  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
                  COMMENT "CMake loading the exmaple program \"${EXAMPLE_NAME}\" to PIC MCU...")
