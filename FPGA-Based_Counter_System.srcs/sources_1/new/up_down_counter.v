module up_down_counter #(parameter N = 4) (
    input wire clk,       // Clock signal
    input wire rst,       // Active-high synchronous reset
    input wire en,        // Enable signal
    input wire dir,       // Direction control: 1 for Up, 0 for Down
    output reg [N-1:0] q  // N-bit output
);

    always @(posedge clk) begin
        if (rst) begin
            q <= 0;           
        end else if (en) begin
            if (dir) begin
                q <= q + 1;   
            end else begin
                q <= q - 1;   
            end
        end
    end
endmodule