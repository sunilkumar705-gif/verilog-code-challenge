// EX-3 to Gray Code Converter
module ex3_to_gray (
    input  [3:0] ex3,    // Excess-3 input
    output [3:0] gray    // Gray code output
);
    wire [3:0] bin;      

    // Convert Excess-3 to Binary (subtract 3)
    assign bin = ex3 - 4'b0011;

    //  Convert Binary to Gray
    assign gray[3] = bin[3];               
    assign gray[2] = bin[3] ^ bin[2];
    assign gray[1] = bin[2] ^ bin[1];
    assign gray[0] = bin[1] ^ bin[0];

endmodule


TESTBENCH CODE 

module tb_ex3_to_gray;
    reg  [3:0] ex3;
    wire [3:0] gray;

    
    ex3_to_gray dut (.ex3(ex3), .gray(gray));

    initial begin
        $display("Excess-3 | Gray Code");
        $display("--------------------");

        for (integer i = 0; i < 10; i = i + 1) begin
            ex3 = i + 3;    // decimal digit i in Ex-3
            #5;
            $display("   %b    |   %b", ex3, gray);
        end

        $stop;
    end
endmodule
