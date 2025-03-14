`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:45:06 AM
// Design Name: 
// Module Name: turnstile_double_example
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


module turnstile_double_example(
    input i_reset,
    input i_clk,
    input i_coin,
    input i_push,
    output o_locked
    );

    localparam LOCKED = 1'b0;
    localparam UNLOCKED = 1'b1;

    reg r_curr_state, r_next_state;

    // Current state register
  	always @(posedge i_clk or posedge i_reset)
    begin
        if(i_reset)
           r_curr_state <= LOCKED;
        else
           r_curr_state <= r_next_state;
    end

    // Next state determination
    always @(r_curr_state or i_coin or i_push)
    begin
        r_next_state <= r_curr_state;
        case(r_curr_state)
            LOCKED:
                if(i_coin)
                    r_curr_state <= UNLOCKED;
            UNLOCKED:
                if(i_push)
                    r_next_state <= LOCKED;
        endcase
    end

    assign o_locked = (r_curr_state == LOCKED);

endmodule