module tflipflop(input t,clk,rst,output reg q,output qb);
  always@(posedge clk)
    begin
      if(rst)
        q<=0;
      else
        case(t)
         1'b0:q<=q;
          1'b1:q<=~q;
        endcase
    end
  assign qb=~q;
endmodule

testbench code

`timescale 1ns/1ps

module tb;
    reg t, clk, rst;
    wire q, qb;
    tflipflop dut (
      .t(t),
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

      t=0;rst=0;#10
      t=1;rst=0;#10
       t=0;rst=0;#10
      t=1;rst=0;#10
      t=0;rst=1;#10
      t=1;rst=1;#10

        $stop;
    end
    initial begin
      $monitor($time, " t=%b q=%b qb=%b", t, q, qb);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
