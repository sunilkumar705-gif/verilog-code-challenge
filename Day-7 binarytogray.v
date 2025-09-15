module binarytogray(b,g);
  input [3:0]b;
  output [3:0]g;
  assign g[3]=b[3];
  assign g[2]=b[3]^b[2];
  assign g[1]=b[2]^b[1];
  assign g[0]=b[1]^b[0];
endmodule

TESTBENCH CODE

module tb;
  reg [3:0]b;
  wire [3:0]g;
  binarytogray dut(b,g);
  initial begin
    b=4'b0101;
    #10 b=4'b1010;
    #10 b=4'b0111;
  end
  initial 
    $monitor("gray code=%b",g);
endmodule
