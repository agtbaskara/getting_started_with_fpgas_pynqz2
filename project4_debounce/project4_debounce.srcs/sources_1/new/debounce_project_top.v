`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:17:11 AM
// Design Name: 
// Module Name: debounce_filter
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


module debounce_project_top(
    input i_clk,
    input i_switch_1,
    output o_led_1
);

    wire w_debounced_switch;

    debounce_filter #(.DEBOUNCE_LIMIT(250000)) debounce_inst(
        .i_clk(i_clk),
        .i_bouncy(i_switch_1),
        .o_debounced(w_debounced_switch)
    );

    led_toggle led_toggle_inst(
        .i_clk(i_clk),
        .i_switch_1(w_debounced_switch),
        .o_led_1(o_led_1)
    );

endmodule
