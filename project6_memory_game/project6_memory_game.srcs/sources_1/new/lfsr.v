`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:50:05 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr_22(
    input i_clk,
    output[21:0] o_lfsr_data,
    output o_lfsr_done
);

reg[21:0] r_lfsr;
wire w_xnor;

always @(posedge i_clk) begin
    r_lfsr <= {r_lfsr[20:0], w_xnor};
end

assign w_xnor = r_lfsr[21] ^~ r_lfsr[20];
assign o_lfsr_done = (r_lfsr == 22'd0);
assign o_lfsr_data = r_lfsr;

endmodule
