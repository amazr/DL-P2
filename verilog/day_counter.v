module day_counter (ADC_CLK_10, reset, LED0, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
    input ADC_CLK_10;
    input reset;
    output wire LED0;
    output [7:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
    wire [3:0] off = 4'b1111;
    reg [7:0] BCD = 8'b0000_0001;
    wire clk;

    seg7_decoder seg7_decoder_inst_5(.in(BCD[7:4]), .out(HEX5));
    seg7_decoder seg7_decoder_inst_4(.in(BCD[3:0]), .out(HEX4));
    seg7_decoder seg7_decoder_inst_3(.in(off), .out(HEX3));
    seg7_decoder seg7_decoder_inst_2(.in(off), .out(HEX2));
    seg7_decoder seg7_decoder_inst_1(.in(off), .out(HEX1));
    seg7_decoder seg7_decoder_inst_0(.in(off), .out(HEX0));
    
    //Clock division
    clk_div clk_div_inst (.clk_in(ADC_CLK_10), .clk_out(clk), .led(LED0));

    always @ (posedge clk or negedge reset)
    begin
        if (reset == 0)
        begin
            BCD[3:0] <= 1;
            BCD[7:4] <= 0;
        end
        else if (BCD[3:0] < 9)
            BCD[3:0] <= BCD[3:0] + 1;
        else if (BCD[7:4] == 9 && BCD[3:0] == 9)
        begin
            BCD[3:0] <= 1;
            BCD[7:4] <= 0;
        end
        else
        begin
            BCD[3:0] <= 0;
            BCD[7:4] <= BCD[7:4] + 1;
        end
    end

endmodule