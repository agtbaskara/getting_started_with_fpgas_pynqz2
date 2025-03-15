# Clock signal (125 MHz)
set_property -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS33} [get_ports i_clk]
create_clock -period 8.000 -name sys_clk_pin -waveform {0.000 4.000} -add [get_ports i_clk]

# Input switches
set_property PACKAGE_PIN D19 [get_ports i_switch_1]
set_property IOSTANDARD LVCMOS33 [get_ports i_switch_1]

set_property PACKAGE_PIN D20 [get_ports i_switch_2]
set_property IOSTANDARD LVCMOS33 [get_ports i_switch_2]

set_property PACKAGE_PIN L20 [get_ports i_switch_3]
set_property IOSTANDARD LVCMOS33 [get_ports i_switch_3]

set_property PACKAGE_PIN L19 [get_ports i_switch_4]
set_property IOSTANDARD LVCMOS33 [get_ports i_switch_4]

# Output LEDs
set_property PACKAGE_PIN R14 [get_ports o_led_1]
set_property IOSTANDARD LVCMOS33 [get_ports o_led_1]

set_property PACKAGE_PIN P14 [get_ports o_led_2]
set_property IOSTANDARD LVCMOS33 [get_ports o_led_2]

set_property PACKAGE_PIN N16 [get_ports o_led_3]
set_property IOSTANDARD LVCMOS33 [get_ports o_led_3]

set_property PACKAGE_PIN M14 [get_ports o_led_4]
set_property IOSTANDARD LVCMOS33 [get_ports o_led_4]

# Output 7-segment display
set_property PACKAGE_PIN U18 [get_ports o_segment2_a]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_a]

set_property PACKAGE_PIN U19 [get_ports o_segment2_b]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_b]

set_property PACKAGE_PIN W18 [get_ports o_segment2_c]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_c]

set_property PACKAGE_PIN W19 [get_ports o_segment2_d]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_d]

set_property PACKAGE_PIN V16 [get_ports o_segment2_e]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_e]

set_property PACKAGE_PIN W16 [get_ports o_segment2_f]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_f]

set_property PACKAGE_PIN V12 [get_ports o_segment2_g]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_g]

set_property PACKAGE_PIN W13 [get_ports o_segment2_digit]
set_property IOSTANDARD LVCMOS33 [get_ports o_segment2_digit]
