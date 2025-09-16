module dflipflop(input d,clk,rst,output reg q,output qb);
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        q<=d;
    end
  assign qb=~q;
endmodule

testbench code

`timescale 1ns/1ps

module tb;
    reg d, clk, rst;
    wire q, qb;
    dflipflop dut (
      .d(d),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        rst = 1; #10;   
        rst = 0;

      d=0;rst=0;#10
      d=1;rst=0;#10
      d=0;rst=1;#10
      d=1;rst=1;#10

        $stop;
    end
    initial begin
      $monitor($time, " d=%b q=%b qb=%b", d, q, qb);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
