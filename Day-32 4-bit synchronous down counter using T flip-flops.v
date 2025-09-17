// T Flip-Flop with synchronous reset
module tflipflop (
  input  t, clk, rst,
  output reg q
);
  always @(posedge clk) begin
    if (rst)
      q <= 1'b0;
    else if (t)
      q <= ~q;      
    else
      q <= q;      
  end
endmodule

// 4-bit synchronous down counter using T flip-flops
module synup (
  input  clk, rst,
  output q,             
  output [3:0] c       
);
  wire [3:0] t;
  wire q0, q1, q2;

  tflipflop tff1 (.t(t[0]), .clk(clk), .rst(rst), .q(q0));
  tflipflop tff2 (.t(t[1]), .clk(clk), .rst(rst), .q(q1));
  tflipflop tff3 (.t(t[2]), .clk(clk), .rst(rst), .q(q2));
  tflipflop tff4 (.t(t[3]), .clk(clk), .rst(rst), .q(q));
  assign t[0] = 1'b1;
  assign t[1] = q0;
  assign t[2] = q0 & q1;
  assign t[3] = q0 & q1 & q2;

  assign c = ~{q, q2, q1, q0};
endmodule


testbench code

// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb;
    reg clk, rst;
    wire q;
  wire [3:0]c;
   synup dut (
    
        .clk(clk),
        .rst(rst),
        .q(q),
     .c(c)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
      clk=0;rst = 1;  
       #15 rst = 0;  
       repeat (20) @(posedge clk);

    $finish;
     
    end
    initial begin
      $monitor($time, " clk=%b rst=%b c=%b ", clk,rst,c);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule


