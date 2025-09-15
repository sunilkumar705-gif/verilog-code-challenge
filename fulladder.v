model-1
module fulladder(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
  wire s,cout;
  assign {cout,s}=a+b+c;
endmodule

fulladder using halfadder code

module halfadder(a,b,s,c);
    input a, b;
    output s, c;

    assign s  = a ^ b;   // XOR for sum
    assign c = a & b;   // AND for carry
endmodule

module fulladder(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
   wire s,c1,c2;
  halfadder ha1(.a(a),.b(b),.s(s1),.c(c1));
  halfadder ha2(.a(s1),.b(c),.s(s),.c(c2));
  or o1(cout,c1,c2);
endmodule




TESTBENCH code



module tb;
  reg a,b,c;
  wire s,cout;
  fulladder dut(.a(a),.b(b),.c(c),.s(s),.cout(cout));
   initial begin
  a=1'b0;b=1'b0;c=1'b0;
  #5 a=1'b0;b=1'b0;c=1'b1;
  #5 a=1'b0;b=1'b1;c=1'b0;
  #5 a=1'b0;b=1'b1;c=1'b1;
  #5 a=1'b1;b=1'b0;c=1'b0;
  #5 a=1'b1;b=1'b0;c=1'b1;
  #5 a=1'b1;b=1'b1;c=1'b0;
  #5 a=1'b1;b=1'b1;c=1'b1;
  #100 $finish();
  end
  initial begin 
    $monitor($time,"a=%b,b=%b,c=%b.,s=%b,cout=%b",a,b,c,s,cout);end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
   endmodule
