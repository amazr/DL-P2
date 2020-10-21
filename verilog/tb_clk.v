`timescale 1 ns /  1 ps
module tb_clk();
reg clk_in = 0;
wire clk_out;

clk_div U0 (.clk_in(clk_in), .clk_out(clk_out));

//Test a couple of runs with div as 2
initial
begin
    $dumpvars;
        clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
    #10 clk_in = ~clk_in;
end

initial
begin
    $monitor($time, " clk_in = %d, clk_out = %d", clk_in, clk_out);
end

endmodule