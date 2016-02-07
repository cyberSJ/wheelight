###################################
# Program PIC MCU using pk2cmd.
# Required definitions that needs to be defined before running this cmake
# module:
# CMAKE_MODULE_PATH - should be defined when add_custom_target() is issued.
# SOURCE_NAME - should be defined when add_custom_target() is issued.
# PK2_COMMAND - is defined in pic_general.cmake
# PK2_PIC_DEVICE - is defined in pic_general.cmake
# PK2_VOLTAGE - is defined in pic_general.cmake
###################################

include(pic_general)

# For unknown reason, the argument must follow the option letter without any
# space. For example, "-p pic16f887" does not work, but "-ppic16f887" works.
set(PK2_COMMAND_OPTIONS "-p${PK2_PIC_DEVICE}" 
                        "-f${SOURCE_NAME}.hex"
                        "-m"
                        "-A${PK2_VOLTAGE}"
                        "-T")

# Actually program the PIC MCU.
message(STATUS "Programming PIC MCU...")
execute_process(COMMAND ${PK2_COMMAND} ${PK2_COMMAND_OPTIONS}
                RESULT_VARIABLE return_variable
                OUTPUT_VARIABLE output_variable)

message(STATUS "Return variable:")
message(STATUS ${return_variable})
message(STATUS "Output variable:")
message(STATUS ${output_variable})
