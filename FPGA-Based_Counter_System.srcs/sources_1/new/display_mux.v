module display_mux #(parameter DIVISOR = 2) ( 
    input clk,
    input [3:0] bcd_tens,
    input [3:0] bcd_ones,
    output reg [3:0] current_digit,
    output reg [3:0] an
);
    reg [19:0] counter = 0;
    reg toggle = 0;

    // Clock divider to control multiplexing speed
    always @(posedge clk) begin
        if (counter == DIVISOR - 1) begin
            counter <= 0;
            toggle <= ~toggle;
        end else begin
            counter <= counter + 1;
        end
    end

    // Toggle between the Ones digit and Tens digit
    always @(*) begin
        if (toggle == 0) begin
            an = 4'b1110;          // Turn on right-most digit (Ones)
            current_digit = bcd_ones; // Send Ones data to decoder
        end else begin
            an = 4'b1101;          // Turn on second digit (Tens)
            current_digit = bcd_tens; // Send Tens data to decoder
        end
    end
endmodule