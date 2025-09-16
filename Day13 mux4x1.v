module mux4x1(i0,i1,i2,i3,s0,s1,y);
  input i0,i1,i2,i3,s0,s1;
  output reg y;
  always@(*)
    begin
      case({s0,s1})
        2'b00:y=i0;
        2'b01:y=i1;
        2'b10:y=i2;
        2'b11:y=i3;
      endcase
    end
      endmodule

testbench code

module tb;
  reg i0,i1,i2,i3,s0,s1;
  wire y;
   mux4x1 dut(i0,i1,i2,i3,s0,s1,y);
  initial begin
    i0=1;i1=0;i2=0;i3=0;s1=0;s0=0;
    #10 i0=1;i1=1;i2=0;i3=0;s1=0;s0=1;
    #10 i0=1;i1=0;i2=1;i3=0;s1=1;s0=0;
    #10 i0=1;i1=0;i2=0;i3=1;s1=1;s0=1;
    #25 $finish();
  end
  
  initial 
    $monitor("%t,i0=%b,i1=%b,i2=%b,i3=%b,s1=%b,s0=%b",$time,i0,i1,i2,i3,s1,s0);
endmodule
