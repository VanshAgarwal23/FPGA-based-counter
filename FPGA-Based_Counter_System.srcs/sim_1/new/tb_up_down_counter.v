module tb_up_down_counter;
    reg clk;
    reg rst;
    reg en;
    reg dir;
    wire [6:0] seg;
    wire [3:0] an;

    top_module uut (
        .clk(clk), .rst(rst), .en(en), .dir(dir),
        .seg(seg), .an(an)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst = 1; en = 0; dir = 1;
        #20; 
        rst = 0; 
        en = 1;

        // Count up to 15
        #160; 
        
        // Count down
        dir = 0; 
        #100;
        
        $finish;
    end
    
    // Generates a highly detailed verification log for your report
    initial begin
        $display("---------------------------------------------------------");
        $display("Time(ns) | Rst | Dir | Int_Count | Anode(an) | Seg_Out(A-G)");
        $display("---------------------------------------------------------");
        $monitor("%8t |  %b  |  %b  |    %0d     |   %b   |  %b", 
                 $time, rst, dir, uut.count_wire, an, seg);
    end
endmodule