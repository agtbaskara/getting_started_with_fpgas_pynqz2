`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:27:49 AM
// Design Name: 
// Module Name: and_gate_TB
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


module and_gate_TB();
  reg r_in1, r_in2;
  wire w_out;

  and_gate UUT(
    .i_switch_1(r_in1),
    .i_switch_2(r_in2),
    .o_led_1(w_out)
  );

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    r_in1 <= 1'b0;
    r_in2 <= 1'b0;
    #10;
    r_in1 <= 1'b0;
    r_in2 <= 1'b1;
    #10;
    r_in1 <= 1'b1;
    r_in2 <= 1'b0;
    #10;
    r_in1 <= 1'b1;
    r_in2 <= 1'b1;
    #10;
    $finish();
  end
endmodule
