`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:52:04 AM
// Design Name: 
// Module Name: demux_lfsr_top
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


module demux_lfsr_top (
    input i_clk,
    input i_switch_1,
    input i_switch_2,
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4
);

reg r_lfsr_toggle = 1'b0;
wire w_lfsr_done;

lfsr_22 lfsr_inst(
    .i_clk(i_clk),
    .o_lfsr_data(), // not connected
    .o_lfsr_done(w_lfsr_done)
);

always @(posedge i_clk) begin
    if (w_lfsr_done)
        r_lfsr_toggle <= !r_lfsr_toggle;
end

demux_1_to_4 demux_inst(
    .i_data(r_lfsr_toggle),
    .i_sel0(i_switch_1),
    .i_sel1(i_switch_2),
    .o_data0(o_led_1),
    .o_data1(o_led_2),
    .o_data2(o_led_3),
    .o_data3(o_led_4)
);
    
endmodule
