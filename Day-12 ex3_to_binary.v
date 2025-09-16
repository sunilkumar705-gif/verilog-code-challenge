module ex3_to_binary (
    input  [3:0] ex3,   
    output [3:0] bin    
);
    assign bin = ex3 - 4'b0011;  
endmodule


TESTBENCH CODE

`timescale 1ns/1ps
module tb_ex3_to_binary;
    reg  [3:0] ex3;   
    wire [3:0] bin;  
    ex3_to_binary dut (.ex3(ex3), .bin(bin));
    initial begin
        $display("Time | Ex-3  | Binary");
        $display("----------------------");
        // Apply valid Ex-3 values (3 to 12)
        ex3 = 4'b0011; #10;  
        ex3 = 4'b0100; #10; 
        ex3 = 4'b0101; #10;  
        ex3 = 4'b0110; #10;  
        ex3 = 4'b0111; #10;  
        ex3 = 4'b1000; #10;  
        ex3 = 4'b1001; #10;  
        ex3 = 4'b1010; #10;  
        ex3 = 4'b1011; #10;  
        ex3 = 4'b1100; #10;  
        $stop;
    end
    initial begin
        $monitor("%4t |  %b  |  %b", $time, ex3, bin);
    end
endmodule
