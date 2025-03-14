`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2025 01:18:57 AM
// Design Name: 
// Module Name: led_toggle
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