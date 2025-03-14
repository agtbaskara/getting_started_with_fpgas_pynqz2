`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:52:04 AM
// Design Name: 
// Module Name: demux_1_to_4
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


module demux_1_to_4 (
    input i_data,
    input i_sel0,
    input i_sel1,
    output o_data0,
    output o_data1,
    output o_data2,
    output o_data3
);

assign o_data0 = !i_sel0 & !i_sel1 ? i_data : 1'b0;
assign o_data1 = !i_sel0 & i_sel1 ? i_data : 1'b0;
assign o_data2 = i_sel0 & !i_sel1 ? i_data : 1'b0;
assign o_data3 = i_sel0 & i_sel1 ? i_data : 1'b0;

endmodule
