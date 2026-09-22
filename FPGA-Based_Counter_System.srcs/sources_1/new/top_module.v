module top_module #(parameter MUX_SPEED = 2) ( 
    input clk,
    input rst,
    input en,
    input dir,
    output [6:0] seg,  
    output [3:0] an    
);
    wire [3:0] count_wire;
    wire [3:0] bcd_tens;
    wire [3:0] bcd_ones;
    wire [3:0] current_digit;

    // 1. The Counter
    up_down_counter #(.N(4)) my_counter (
        .clk(clk), .rst(rst), .en(en), .dir(dir), .q(count_wire)
    );

    // 2. Binary to BCD Converter
    bin_to_bcd b2bcd (
        .bin(count_wire), .tens(bcd_tens), .ones(bcd_ones)
    );

    // 3. Display Multiplexer
    display_mux #(.DIVISOR(MUX_SPEED)) mux (
        .clk(clk), .bcd_tens(bcd_tens), .bcd_ones(bcd_ones),
        .current_digit(current_digit), .an(an)
    );

    // 4. 7-Segment Decoder
    hex_to_7seg decoder (
        .bin_in(current_digit), .seg_out(seg)
    );
endmodule