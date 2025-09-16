module binary_to_ex3 (
    input  [3:0] bin,
    output reg [3:0] ex3
);
    always @(*) begin
        ex3 = bin + 4'd3;  
    end
endmodule


TESTBENCH CODE 

`timescale 1ns/1ps

module tb_binary_to_ex3;
    reg  [3:0] bin;   
    wire [3:0] ex3;   

   
    binary_to_ex3 dut (.bin(bin), .ex3(ex3));

    initial begin
        $display("Time | Binary | Excess-3");
        $display("-------------------------");

       
        bin = 4'b0000; #10;  
        bin = 4'b0001; #10;  
        bin = 4'b0010; #10;  
        bin = 4'b0011; #10;  
        bin = 4'b0100; #10;  
        bin = 4'b0101; #10;  
        bin = 4'b0110; #10;  
        bin = 4'b0111; #10;  
        bin = 4'b1000; #10;  
        bin = 4'b1001; #10;  

        $stop;
    end

   
    initial begin
      $monitor("%4t |   %b   |   %b", $time, bin, ex3);
    end
endmodule
