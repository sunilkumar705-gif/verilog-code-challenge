module carrylookheadadder(a,b,c,s,cout);
  input [3:0]a,b;
  input c;
  output[3:0]s;
  output cout;
  wire c1,c2,c3,c4;
  wire [3:0]p,g;
  assign p=a^b;
  assign g=a&b;
  assign c1=g[0]|(c&p[0]);
  assign c2=g[1]|(c&p[0]&p[1])|(g[0]&p[1]);
   assign c3=g[2]|(p[2]&g[1])|(p[1]&p[2]&g[0])|(p[0]&p[1]&p[2]&c);
  assign c4=g[3]|(p[3]&g[2])|(p[2]&p[3]&g[1])|(p[1]&p[2]&p[3]&g[0])|(p[0]&p[1]&p[2]&p[3]&c);
  assign {cout,s} = a+b+c; //fulladder
endmodule


TESTBENCH code

module tb;
  reg [3:0]a,b;
  reg c;
  wire [3:0]s;
  wire cout;
  carrylookheadadder dut(a,b,c,s,cout);
  initial begin
     a=4'b1001;b=4'b1001;c=1'b0;
 #5 a=4'b1101;b=4'b1001;c=1'b1;
     #5 a=4'b0111;b=4'b1101;c=1'b0;
 #50 $finish();
end
 initial 
 $monitor($time,"a=%b,b=%b,c=%b,s=%b,cout=%b",a,b,c,s,cout);
endmodule
