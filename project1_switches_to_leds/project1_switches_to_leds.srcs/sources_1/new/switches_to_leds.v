`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2025 11:58:50 PM
// Design Name: 
// Module Name: switches_to_leds
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module switches_to_leds (
    input i_switch_1,
    input i_switch_2,
    input i_switch_3,
    input i_switch_4,
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4
);

assign o_led_1 = i_switch_1;
assign o_led_2 = i_switch_2;
assign o_led_3 = i_switch_3;
assign o_led_4 = i_switch_4;
    
endmodule
