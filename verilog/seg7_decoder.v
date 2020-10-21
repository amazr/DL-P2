module seg7_decoder (in, out);
input [3:0] in;
output reg [7:0] out;

    always @(*)
    begin
        case(in[3:0])
            4'b0000 : out = 8'b1100_0000; // 0
            4'b0001 : out = 8'b1111_1001; // 1
            4'b0010 : out = 8'b1010_0100; // 2
            4'b0011 : out = 8'b1011_0000; // 3
            4'b0100 : out = 8'b1001_1001; // 4
            4'b0101 : out = 8'b1001_0010; // 5
            4'b0110 : out = 8'b1000_0010; // 6
            4'b0111 : out = 8'b1111_1000; // 7
            4'b1000 : out = 8'b1000_0000; // 8
            4'b1001 : out = 8'b1001_1000; // 9
            4'b1111 : out = 8'b1111_1111; // turn off
            default : out = 8'b1111_1111; // turn off
        endcase
    end

endmodule
