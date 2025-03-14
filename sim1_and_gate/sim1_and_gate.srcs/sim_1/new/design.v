module and_gate(
    input i_switch_1,
    input i_switch_2,
    output o_led_1
);

assign o_led_1 = i_switch_1 & i_switch_2;

endmodule
