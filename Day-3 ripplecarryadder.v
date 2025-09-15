module ripplecarryadder(a,b,c,s,cout);
  input [3:0]a,b;
  input c;
  output[3:0]s;
  output cout;
  wire c1,c2,c3;
  fulladder f1(a[0],b[0],c,s[0],c1);
  fulladder f2(a[1],b[1],c1,s[1],c2);
  fulladder f3(a[2],b[2],c2,s[2],c3);
  fulladder f4(a[3],b[3],c3,s[3],cout);
endmodule

module fulladder(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
  wire s,cout;
  assign {cout,s}=a+b+c;
endmodule


TESTBENCH CODE

module tb;
  reg [3:0]a,b;
  reg c;
  wire [3:0]s;
  wire cout;
  ripplecarryadder dut(a,b,c,s,cout);
  initial begin
     a=4'b1001;b=4'b1001;c=1'b0;
 #5 a=4'b1101;b=4'b1001;c=1'b1;
     #5 a=4'b0111;b=4'b1101;c=1'b0;
 #50 $finish();
end
 initial 
 $monitor($time,"a=%b,b=%b,c=%b,s=%b,cout=%b",a,b,c,s,cout);
endmodule
