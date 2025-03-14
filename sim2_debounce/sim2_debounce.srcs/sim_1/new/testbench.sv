`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:36:50 AM
// Design Name: 
// Module Name: debounce_filter_TB
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


module debounce_filter_TB();
    // create clock signal
    reg r_clk = 1'b0, r_bouncy = 1'b0;
    always #2 r_clk <= !r_clk;

    debounce_filter #(.DEBOUNCE_LIMIT(4)) UUT(
        .i_clk(r_clk),
      	.i_bouncy(r_bouncy),
        .o_debounced(w_debounced)
    );

    initial begin
        $dumpfile("dump.vcd"); $dumpvars;

        repeat(3) @(posedge r_clk);
        r_bouncy <= 1'b1; // toggle state of input pin

        @(posedge r_clk);
        r_bouncy <= 1'b0; // simulate bouncing

        @(posedge r_clk);
        r_bouncy <= 1'b1; // bounce go away

        repeat(6) @(posedge r_clk);
        $display("Test Complete");

        $finish();
    end
endmodule
