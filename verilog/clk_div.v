module clk_div (clk_in, clk_out, led);
    input clk_in;
    output reg clk_out;
    output reg led;
    //parameter div = 5000000;
    parameter div = 2;
    reg [22:0] counter = 23'd1;

    always @ (posedge clk_in)
    begin
        counter <= counter + 23'd1;
        if (counter >= div)
            counter <= 23'd1;
        clk_out <= (counter <= div/2) ? 1'b0 : 1'b1;
        led <= clk_out;
    end
endmodule