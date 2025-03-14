# Clock signal (125 MHz)
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports i_clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports i_clk]

# Input switches
set_property PACKAGE_PIN D19 [get_ports i_switch_1]
set_property IOSTANDARD LVCMOS33 [get_ports i_switch_1]

# Output LEDs
set_property PACKAGE_PIN R14 [get_ports o_led_1]
set_property IOSTANDARD LVCMOS33 [get_ports o_led_1]
