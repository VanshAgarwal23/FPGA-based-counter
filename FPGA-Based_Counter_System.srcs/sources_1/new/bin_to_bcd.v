module bin_to_bcd(
    input [3:0] bin,
    output reg [3:0] tens,
    output reg [3:0] ones
);
    // Simple logic since our max value is only 15 (4'b1111)
    always @(*) begin
        if (bin >= 10) begin
            tens = 4'd1;
            ones = bin - 4'd10;
        end else begin
            tens = 4'd0;
            ones = bin;
        end
    end
endmodule