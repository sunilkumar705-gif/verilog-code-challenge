module graytobinary(g,b);
  input [3:0]g;
  output [3:0]b;
  assign b[3]=g[3];
  assign b[2]=g[3]^g[2];
  assign b[1]=g[1]^b[2];
  assign b[0]=g[0]^b[1];
endmodule

TESTBENCH CODE  

module tb;
  reg [3:0]g;
  wire [3:0]b;
  graytobinary dut(g,b);
  initial begin
    g=4'b1111;
    #10 g=4'b1010;
    #10 g=4'b0111;
  end
  initial 
    $monitor("binary code=%b",b);
endmodule
