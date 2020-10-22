module Project2 (SW, KEY, ADC_CLK_10, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    input [9:0] SW;
    input [1:0] KEY;
    input ADC_CLK_10;
    output [9:0] LEDR;
    output [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

    //1-99 Day Counter 
    day_counter day_counter_inst
    (
        .ADC_CLK_10(ADC_CLK_10),
        .reset(KEY[0]),
        .rate(KEY[1]),
        .LED0(LEDR[0]),
        .HEX0(HEX0), 
        .HEX1(HEX1), 
        .HEX2(HEX2), 
        .HEX3(HEX3), 
        .HEX4(HEX4), 
        .HEX5(HEX5)
    );

endmodule