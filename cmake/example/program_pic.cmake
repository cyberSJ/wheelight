################################
# Program PIC MCU using pk2cmd
################################
set(EXAMPLE_NAME "blink")

# Command-line command to use pk2cmd, which is the programmer for PIC MCU.
set(PK2_COMMAND "pk2cmd")

# Tell pk2cmd which PIC device is to be programmed.
set(PK2_PIC_DEVICE "pic16f887")

# Set the voltage powring the PIC device.
set(PK2_VOLTAGE "4")

# For unknown reason, the argument must follow the option letter without any
# space. For example, "-p pic16f887" does not work, but "-ppic16f887" works.
set(PK2_COMMAND_OPTIONS "-p${PK2_PIC_DEVICE}" 
                        "-f${EXAMPLE_NAME}.hex"
                        "-m"
                        "-A${PK2_VOLTAGE}"
                        "-T")

# This allows pk2cmd to find PK2DeviceFile.dat.
set(ENV{PATH} "$ENV{PATH}:/usr/share/pk2/")

# Actually program the PIC MCU.
execute_process(COMMAND ${PK2_COMMAND} ${PK2_COMMAND_OPTIONS}
                RESULT_VARIABLE return_variable
                OUTPUT_VARIABLE output_variable)

message(STATUS "Return variable:")
message(STATUS ${return_variable})
message(STATUS "Output variable:")
message(STATUS ${output_variable})
