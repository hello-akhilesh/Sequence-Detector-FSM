module sequence_detector (
    input clk,
    input reset,
    input in_bit,
    output reg detected
);

    // State encoding
    localparam S0 = 3'b000;
    localparam S1 = 3'b001;
    localparam S2 = 3'b010;
    localparam S3 = 3'b011;

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case(state)
            S0: next_state = (in_bit) ? S1 : S0;
            S1: next_state = (in_bit) ? S1 : S2;
            S2: next_state = (in_bit) ? S3 : S0;
            S3: next_state = (in_bit) ? S1 : S2; // overlapping version
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        detected = (state == S3 && in_bit); // high when pattern completed
    end

endmodule
