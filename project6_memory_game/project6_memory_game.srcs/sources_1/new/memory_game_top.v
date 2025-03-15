`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:50:05 PM
// Design Name: 
// Module Name: memory_game_top
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


module state_machine_project_top(
    input i_clk,
    // input switch for entering pattern
    input i_switch_1,
    input i_switch_2,
    input i_switch_3,
    input i_switch_4,
    // output leds for displaying pattern
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4,
    // scoreboard, 7-segment display
    output o_segment2_a,
    output o_segment2_b,
    output o_segment2_c,
    output o_segment2_d,
    output o_segment2_e,
    output o_segment2_f,
    output o_segment2_g,
	output o_segment2_digit
    );

    localparam GAME_LIMIT = 7; // Increase this to make the game harder
    localparam CLKS_PER_SEC = 125000000; // 25 MHz
    localparam DEBOUNCE_LIMIT = 1250000; // 10 ms debounce filter

    wire w_switch_1, w_switch_2, w_switch_3, w_switch_4;
    wire w_segment2_a, w_segment2_b, w_segment2_c, w_segment2_d, w_segment2_e, w_segment2_f, w_segment2_g;
    wire[3:0] w_score;

    // Debounce all switch inputs
    debounce_filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) debounce_sw1(
        .i_clk(i_clk),
        .i_bouncy(i_switch_1),
        .o_debounced(w_switch_1)
    );

    debounce_filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) debounce_sw2(
        .i_clk(i_clk),
        .i_bouncy(i_switch_2),
        .o_debounced(w_switch_2)
    );

    debounce_filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) debounce_sw3(
        .i_clk(i_clk),
        .i_bouncy(i_switch_3),
        .o_debounced(w_switch_3)
    );

    debounce_filter #(.DEBOUNCE_LIMIT(DEBOUNCE_LIMIT)) debounce_sw4(
        .i_clk(i_clk),
        .i_bouncy(i_switch_4),
        .o_debounced(w_switch_4)
    );

    state_machine_game #(.CLKS_PER_SEC(CLKS_PER_SEC), .GAME_LIMIT(GAME_LIMIT)) game_inst(
        .i_clk(i_clk),
        .i_switch_1(w_switch_1),
        .i_switch_2(w_switch_2),
        .i_switch_3(w_switch_3),
        .i_switch_4(w_switch_4),
        .o_score(w_score),
        .o_led_1(o_led_1),
        .o_led_2(o_led_2),
        .o_led_3(o_led_3),
        .o_led_4(o_led_4)
    );

    binary_to_7segment scoreboard(
        .i_clk(i_clk),
        .i_binary_num(w_score),
        .o_segment_a(w_segment2_a),
        .o_segment_b(w_segment2_b),
        .o_segment_c(w_segment2_c),
        .o_segment_d(w_segment2_d),
        .o_segment_e(w_segment2_e),
        .o_segment_f(w_segment2_f),
        .o_segment_g(w_segment2_g)
    );

    assign o_segment2_a = w_segment2_a;
    assign o_segment2_b = w_segment2_b;
    assign o_segment2_c = w_segment2_c;
    assign o_segment2_d = w_segment2_d;
    assign o_segment2_e = w_segment2_e;
    assign o_segment2_f = w_segment2_f;
    assign o_segment2_g = w_segment2_g;
	assign o_segment2_digit = 1'b0; // Use first digit

endmodule
