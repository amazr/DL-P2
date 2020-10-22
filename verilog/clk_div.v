module clk_div (clk_in, clk_out, led, rate);
    input clk_in;
    input rate;
    output reg clk_out;
    output reg led;
    reg [22:0] counter = 23'd1;
    parameter div1 = 5000000;
    parameter div2 = 2000000;

    always @ (posedge clk_in)
    begin
        counter <= counter + 23'd1;
        if (rate == 1'b1)
        begin
            if (counter >= div1)
                counter <= 23'd1;
            clk_out <= (counter <= div1/2) ? 1'b0 : 1'b1;  
        end
        if (rate == 1'b0)
        begin
            if (counter >= div2)
                counter <= 23'd1;
            clk_out <= (counter <= div2/2) ? 1'b0 : 1'b1;  
        end
        led <= clk_out;
    end
endmodule