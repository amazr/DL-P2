`timescale 1 ns / 1 ps
module tb_day();

    reg [1:0] KEY = 2'b01;
    reg ADC_CLK_10 = 0;
    wire LED0 = 0;
    wire [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;

    day_counter U0
    (
        .ADC_CLK_10(ADC_CLK_10),
        .reset(KEY[0]),
        .LED0(LED0),
        .HEX0(HEX0), 
        .HEX1(HEX1), 
        .HEX2(HEX2), 
        .HEX3(HEX3), 
        .HEX4(HEX4), 
        .HEX5(HEX5)
    );

initial
    begin
        $dumpfile("output_day.vcd");
    $dumpvars;
            ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10;
        #10 ADC_CLK_10 = ~ADC_CLK_10; KEY[0] = 0; 
    end

initial
    begin
        $monitor($time, " 1-99: %b%b, clock_in: %d, clock_out: %d, reset: %d", HEX5, HEX4, ADC_CLK_10, LED0, KEY[0]);
    end
endmodule