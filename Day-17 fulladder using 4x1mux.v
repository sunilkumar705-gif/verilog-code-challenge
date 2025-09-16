fulladder using 4x1mux

module top(a,b,c,s,cout);
  input a,b,c;
  output s,cout;
  
  mux4x1 m1(a,~a,~a,a,b,c,s);
  mux4x1 m2(0,a,a,1,b,c,cout);
endmodule

module mux4x1(i0,i1,i2,i3,s0,s1,y);
  input i0,i1,i2,i3,s0,s1;
  output reg y;
  always@(*)
    begin
      case({s1,s0})
        2'b00:y=i0;
        2'b01:y=i1;
        2'b10:y=i2;
        2'b11:y=i3;
      endcase
    end
      endmodule


testbench code

module tb ;
 reg a,b,c;
  wire s,cout;
  top dut(a,b,c,s,cout);
  initial begin
    a=0;b=0;c=0;
    #10 a=0;b=0;c=1;
    #10 a=0;b=1;c=0;
    #10 a=0;b=1;c=1;
    #10 a=1;b=0;c=0;
    #10 a=1;b=0;c=1;
    #10 a=1;b=1;c=0;
    #10 a=1;b=1;c=1;
    #25 $finish();
  end
  initial 
    $monitor("t=%0d,a=%b,b=%b,c=%b,s=%b,cout=%b",$time,a,b,c,s,cout);
endmodule
