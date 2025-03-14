`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:24:38 AM
// Design Name: 
// Module Name: demux_count_top
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


module demux_count_top (
    input i_clk,
    input i_switch_1,
    input i_switch_2,
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4
);

localparam COUNT_LIMIT = 4194303;

wire w_counter_toggle;

count_and_toggle #(.COUNT_LIMIT(COUNT_LIMIT)) toggle_counter(
    .i_clk(i_clk),
    .i_enable(1'b1),
    .o_toggle(w_counter_toggle)
);

demux_1_to_4 demux_inst(
    .i_data(w_counter_toggle),
    .i_sel0(i_switch_1),
    .i_sel1(i_switch_2),
    .o_data0(o_led_1),
    .o_data1(o_led_2),
    .o_data2(o_led_3),
    .o_data3(o_led_4)
);
    
endmodule
