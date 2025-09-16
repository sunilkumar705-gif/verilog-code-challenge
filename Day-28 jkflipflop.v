module jkflipflop(input j,k,clk,rst,output reg q,output qb);
  always@(posedge clk)
    begin
      if(rst)
        q=0;
      else
        begin
          case({j,k})
            2'b00:q<=q;
            2'b01:q<=1'b0;
            2'b10:q<=1'b1;
            2'b11:q<=~q;
          endcase
        end
    end
  assign qb=~q;
endmodule

testbench code

`timescale 1ns/1ps

module tb;
    reg j, k, clk, rst;
    wire q, qb;

    // Instantiate DUT
    jkflipflop dut (
      .j(j),
      .k(k),
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

        j = 0; k = 0; #10;  // Hold
        j = 0; k = 1; #10;  // Reset
        j = 1; k = 0; #10;  // Set
        j = 1; k = 1; #10;  // Invalid condition

        $stop;
    end
    initial begin
      $monitor($time, " j=%b k=%b q=%b qb=%b", j, k, q, qb);
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
    
endmodule
