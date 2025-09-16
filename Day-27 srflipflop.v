module srflipflop(input s,r,clk,rst,output reg q,output qb);
  always@(posedge clk)
    begin
      if(rst)
        q=0;
      else
        begin
          case({s,r})
            2'b00:q<=q;
            2'b01:q<=1'b0;
            2'b10:q<=1'b1;
            2'b11:q<=1'bx;
          endcase
        end
    end
  assign qb=~q;
endmodule

testbench code

`timescale 1ns/1ps

module tb;
    reg s, r, clk, rst;
    wire q, qb;
    srflipflop dut (
        .s(s),
        .r(r),
        .clk(clk),
        .rst(rst),
        .q(q),
        .qb(qb)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end
    initial begin
        rst = 1; #10;   // Apply reset
        rst = 0;

        s = 0; r = 0; #10;  // Hold
        s = 0; r = 1; #10;  // Reset
        s = 1; r = 0; #10;  // Set
        s = 1; r = 1; #10;  // Invalid condition

        $stop;
    end
    initial begin
        $monitor($time, " s=%b r=%b q=%b qb=%b", s, r, q, qb);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
