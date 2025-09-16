
module demux1X4(d,a,b,i0,i1,i2,i3);
  input d,a,b;
  output i0,i1,i2,i3;
  wire a_bar,b_bar;
  not n1(a_bar,a);
  not n2(b_bar,b);
  and a1(i0,a_bar,b_bar,d);
  and a2(i1,a_bar,b,d);
  and a3(i2,a,b_bar,d);
  and a4(i3,a,b,d);
endmodule

testbench code

module tb ;
 reg a,b,d;
  wire i0,i1,i2,i3;
  demux1X4 dut(d,a,b,i0,i1,i2,i3);
  initial begin
    a=0;b=0;d=1;
    #10 a=0;b=1;d=1;
    #10 a=1;b=0;d=1;
    #10 a=1;b=1;d=1;
   
    #25 $finish();
  end
  initial 
    $monitor("t=%0d,a=%b,b=%b,d=%b,i0=%b,i1=%b,i2=%b,i3=%b",$time,a,b,d,i0,i1,i2,i3);
endmodule
