`timescale 1ns/1ns
module shifter_testbench;
    reg [7:0] din;
    reg Clock, dir;
    reg [2:0] n;
    wire [7:0] dout;

    // Instantiate the module under test
    shifter dut (.din(din), .clk(Clock), .dir(dir), .n(n), .dout(dout));

    // Clock generation
    always #5 Clock = ~Clock; // Clock signal with a period of 10 ns

    // Stimulus
    initial begin
        $fsdbDumpvars();

        // Reset inputs
        Clock <= 0;
        din <= 0;
        dir <= 0;
        n <= 0;

        // Apply test cases
        #20
        din <= 8'b10101001;
        dir <= 1;
        n <= 3'b010;

        #20
        din <= 8'b10110101;
        dir <= 0;
        n <= 3'b011;

        #100 $finish;
    end
endmodule
