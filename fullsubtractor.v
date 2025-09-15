module fullsubtractor(a,b,barrow1,d,barrow);
  input a,b,barrow1;
  output d,barrow;
  wire s,barrow;
  assign {barrow,d}=a-b-barrow1;
endmodule

TESTBENCH CODE


module tb;
  reg a,b,barrow1;
  wire d,barrow;
 fullsubtractor dut(.a(a),.b(b),.barrow1(barrow1),.d(d),.barrow(barrow));
   initial begin
  a=1'b0;b=1'b0;barrow1=1'b0;
  #5 a=1'b0;b=1'b0;barrow1=1'b1;
  #5 a=1'b0;b=1'b1;barrow1=1'b0;
  #5 a=1'b0;b=1'b1;barrow1=1'b1;
  #5 a=1'b1;b=1'b0;barrow1=1'b0;
  #5 a=1'b1;b=1'b0;barrow1=1'b1;
  #5 a=1'b1;b=1'b1;barrow1=1'b0;
  #5 a=1'b1;b=1'b1;barrow1=1'b1;
  #100 $finish();
  end
  initial begin 
    $monitor($time,"a=%b,b=%b,barrow1=%b.,d=%b,barrow=%b",a,b,barrow1,d,barrow);end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
   endmodule
