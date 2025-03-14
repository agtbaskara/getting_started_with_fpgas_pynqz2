`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 05:36:50 AM
// Design Name: 
// Module Name: design
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

module debounce_filter #(parameter
    DEBOUNCE_LIMIT = 20
    ) (
    input i_clk,
    input i_bouncy,
    output o_debounced
);

reg[$clog2(DEBOUNCE_LIMIT)-1:0] r_count = 0;
reg r_state = 1'b0;
always @(posedge i_clk)
begin
  if(i_bouncy !== r_state && r_count < DEBOUNCE_LIMIT-1)
    begin
        r_count <= r_count +1;
    end
    else if(r_count == DEBOUNCE_LIMIT-1)
    begin
        r_state <= i_bouncy;
        r_count <= 0;
    end
    else
    begin
        r_count <= 0;
    end
end

assign o_debounced = r_state;
    
endmodule

module led_toggle(
    input i_clk,
    input i_switch_1,
    output o_led_1
);

reg r_led_1 = 1'b0;
reg r_switch_1 = 1'b0;

always @(posedge i_clk)
begin
    r_switch_1 <= i_switch_1;

    if(i_switch_1 == 1'b0 && r_switch_1 == 1'b1)
    begin
        r_led_1 <= ~ r_led_1;
    end
end

assign o_led_1 = r_led_1;

endmodule
