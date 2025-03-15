`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:50:05 PM
// Design Name: 
// Module Name: state_machine_game
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


module state_machine_game #(parameter CLKS_PER_SEC = 25000000, parameter GAME_LIMIT = 6)(
    input i_clk,
    input i_switch_1,
    input i_switch_2,
    input i_switch_3,
    input i_switch_4,
    output reg [3:0] o_score,
    output o_led_1,
    output o_led_2,
    output o_led_3,
    output o_led_4
    );

    localparam START = 3'd0;
    localparam PATTERN_OFF = 3'd1;
    localparam PATTERN_SHOW = 3'd2;
    localparam WAIT_PLAYER = 3'd3;
    localparam INCR_SCORE = 3'd4;
    localparam LOSER = 3'd5;
    localparam WINNER = 3'd6;

    reg[2:0] r_sm_main;
    reg r_toggle, r_switch_1, r_switch_2, r_switch_3, r_switch_4, r_button_dv;
    reg[1:0] r_pattern[0:10]; // 2D array: 2 bits wide x 11 deep;
    wire [21:0] w_lfsr_data;
    reg[$clog2(GAME_LIMIT)-1:0] r_index; // Display index
    reg[1:0] r_button_id;
    wire w_count_en, w_toggle;

    always @(posedge i_clk)
    begin
        // Reset game from any state
        if(i_switch_1 & i_switch_2)
            r_sm_main <= START;
        else
        begin
            // Main state machine switch statement
            case(r_sm_main)
                // Stay in START state until user releases buttons
                START:
                begin
                    // Wait for reset condition to go away
                    if(!i_switch_1 & !i_switch_2 & r_button_dv)
                    begin
                        o_score <= 0;
                        r_index <= 0;
                        r_sm_main <= PATTERN_OFF;
                    end
                end

                PATTERN_OFF:
                begin
                    if(!w_toggle & r_toggle) // Falling edge found
                        r_sm_main <= PATTERN_SHOW;
                end

                // Show the next LED in the pattern
                PATTERN_SHOW:
                begin
                    if(!w_toggle & r_toggle) // Falling edge found
                        if(o_score == r_index)
                        begin
                            r_index <= 0;
                            r_sm_main <= WAIT_PLAYER;
                        end
                        else
                        begin
                            r_index <= r_index + 1;
                            r_sm_main <= PATTERN_OFF;
                        end
                end

                WAIT_PLAYER:
                begin
                    if(r_button_dv)
                        if(r_pattern[r_index] == r_button_id && r_index == o_score)
                        begin
                            r_index <= 0;
                            r_sm_main <= INCR_SCORE;
                        end
                        else if(r_pattern[r_index] != r_button_id)
                            r_sm_main <= LOSER;
                        else
                            r_index <= r_index + 1;
                end

                // Used to increment score counter
                INCR_SCORE:
                begin
                    o_score <= o_score + 1;
                    if(o_score == GAME_LIMIT - 1)
                        r_sm_main <= WINNER;
                    else
                        r_sm_main <= PATTERN_OFF;
                end

                // Display 0xA on 7-segment display, wait for new game
                WINNER:
                begin
                    o_score <= 4'hA; // Winner
                end

                // Display 0xF on 7-segment display, wait for new game
                LOSER:
                begin
                    o_score <= 4'hF; // Loser
                end

                default:
                    r_sm_main <= START;
            endcase
        end
    end

    // Register in the LFSR to r_pattern when game starts
    // Each 2 bits of LFSR is one value for r_patter 2D array
    always @(posedge i_clk)
    begin
        if(r_sm_main == START)
        begin
            r_pattern[0] <= w_lfsr_data[1:0];
            r_pattern[1] <= w_lfsr_data[3:2];
            r_pattern[2] <= w_lfsr_data[5:4];
            r_pattern[3] <= w_lfsr_data[7:6];
            r_pattern[4] <= w_lfsr_data[9:8];
            r_pattern[5] <= w_lfsr_data[11:10];
            r_pattern[6] <= w_lfsr_data[13:12];
            r_pattern[7] <= w_lfsr_data[15:14];
            r_pattern[8] <= w_lfsr_data[17:16];
            r_pattern[9] <= w_lfsr_data[19:18];
            r_pattern[10] <= w_lfsr_data[21:20];
        end
    end

    assign o_led_1 = (r_sm_main == PATTERN_SHOW && r_pattern[r_index] == 2'b00) ? 1'b1 : i_switch_1;
    assign o_led_2 = (r_sm_main == PATTERN_SHOW && r_pattern[r_index] == 2'b01) ? 1'b1 : i_switch_2;
    assign o_led_3 = (r_sm_main == PATTERN_SHOW && r_pattern[r_index] == 2'b10) ? 1'b1 : i_switch_3;
    assign o_led_4 = (r_sm_main == PATTERN_SHOW && r_pattern[r_index] == 2'b11) ? 1'b1 : i_switch_4;

    // Create registers to enable falling edge detection
    always @(posedge i_clk)
    begin
        r_toggle <= w_toggle;
        r_switch_1 <= i_switch_1;
        r_switch_2 <= i_switch_2;
        r_switch_3 <= i_switch_3;
        r_switch_4 <= i_switch_4;

        if(r_switch_1 & !i_switch_1)
        begin
            r_button_dv <= 1'b1;
            r_button_id <= 0;
        end
        else if(r_switch_2 & !i_switch_2)
        begin
            r_button_dv <= 1'b1;
            r_button_id <= 1;
        end
        else if(r_switch_3 & !i_switch_3)
        begin
            r_button_dv <= 1'b1;
            r_button_id <= 2;
        end
        else if(r_switch_4 & !i_switch_4)
        begin
            r_button_dv <= 1'b1;
            r_button_id <= 3;
        end
        else
        begin
            r_button_dv <= 1'b0;
            r_button_id <= 0;
        end
    end

    // w_count_en is high when state machine is in PATTERN_SHOW state or PATTERN_OFF state, else low
    assign w_count_en = (r_sm_main == PATTERN_SHOW || r_sm_main == PATTERN_OFF);

    count_and_toggle #(.COUNT_LIMIT(CLKS_PER_SEC/4)) count_inst(
        .i_clk(i_clk),
        .i_enable(w_count_en),
        .o_toggle(w_toggle)
    );

    // Generates 22-bit-wide random data
    lfsr_22 lfsr_inst(
        .i_clk(i_clk),
        .o_lfsr_data(w_lfsr_data),
        .o_lfsr_done() // leave unconnected
    );

endmodule

