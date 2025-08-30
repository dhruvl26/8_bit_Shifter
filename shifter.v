`timescale 1ns/1ns
module shifter (clk, din, dir, dout, n);
    input [7:0] din;
    input dir, clk;
    input [2:0] n;
    output reg [7:0] dout;

    always @ (posedge clk)
    begin
        if (dir == 0)   // left shift
            dout <= din << n;
        else if (dir == 1)
            dout <= din >> n;
    end
endmodule
