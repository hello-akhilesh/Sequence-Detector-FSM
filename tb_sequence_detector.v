module tb_sequence_detector;

    reg clk;
    reg reset;
    reg in_bit;
    wire detected;

    sequence_detector dut (
        .clk(clk),
        .reset(reset),
        .in_bit(in_bit),
        .detected(detected)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns period

    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, tb_sequence_detector);

        reset = 1;
        in_bit = 0;
        #10 reset = 0;

        // Test input sequence
        in_bit = 1; #10; // start pattern
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 1; #10; // pattern complete -> detected = 1
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 0; #10;
        in_bit = 1; #10;
        in_bit = 1; #10; // overlapping pattern again

        #50;
        $finish;
    end

endmodule
