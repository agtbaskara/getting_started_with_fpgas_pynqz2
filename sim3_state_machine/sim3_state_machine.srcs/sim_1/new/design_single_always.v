`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:45:06 AM
// Design Name: 
// Module Name: turnstile_single_example
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

module turnstile_single_example(
    input i_reset,
    input i_clk,
    input i_coin,
    input i_push,
    output o_locked
    );

    localparam LOCKED = 1'b0;
    localparam UNLOCKED = 1'b1;

    reg r_curr_state;

    // Single always block approach
    always @(posedge i_clk or posedge i_reset)
    begin
        if(i_reset)
           r_curr_state <= LOCKED;
        else
        begin
            case(r_curr_state)
                LOCKED:
                    if(i_coin)
                        r_curr_state <= UNLOCKED;
                UNLOCKED:
                    if(i_push)
                        r_curr_state <= LOCKED;
            endcase
        end
    end

    assign o_locked = (r_curr_state == LOCKED);
    
endmodule