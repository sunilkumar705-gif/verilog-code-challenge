module mux8x1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
  input i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
  output reg y;
  always@(*)
    begin
      case({s2,s1,s0})
        3'b000:y=i0;
        3'b001:y=i1;
        3'b010:y=i2;
        3'b011:y=i3;
         3'b100:y=i4;
         3'b101:y=i5;
         3'b110:y=i6;
         3'b111:y=i7;
        
      endcase
    end
      endmodule

testbench code

module tb;
  reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
  wire y;
   mux8x1 dut(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
  initial begin
    i0=1;i1=0;i2=0;i3=0;i4=0;i5=0;i6=0;i7=0;s2=0;s1=0;s0=0;
    #10  i0=0;i1=1;i2=0;i3=0;i4=0;i5=0;i6=0;i7=0;s2=0;s1=0;s0=1;
    #10  i0=0;i1=0;i2=1;i3=0;i4=0;i5=0;i6=0;i7=0;s2=0;s1=1;s0=0;
    #10  i0=0;i1=0;i2=0;i3=1;i4=0;i5=0;i6=0;i7=0;s2=0;s1=1;s0=1;
    #10   i0=0;i1=0;i2=0;i3=0;i4=1;i5=0;i6=0;i7=0;s2=1;s1=0;s0=0;
    #10   i0=0;i1=0;i2=0;i3=0;i4=0;i5=1;i6=0;i7=0;s2=1;s1=0;s0=1;
    #10   i0=0;i1=0;i2=0;i3=0;i4=0;i5=0;i6=1;i7=0;s2=1;s1=1;s0=0;
    #10   i0=0;i1=0;i2=0;i3=0;i4=0;i5=0;i6=0;i7=1;s2=1;s1=1;s0=1;
    #25 $finish();
  end
  
  initial 
    $monitor("%t,i0=%b,i1=%b,i2=%b,i3=%b,i4=%b,i5=%b,i6=%b,i7=%b,s2=%b,s1=%b,s0=%b",$time,i0,i1,i2,i3,i4,i5,i6,i7,s2,s1,s0);
endmodule
