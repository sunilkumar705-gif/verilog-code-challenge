module comparator(input [1:0]a,b,output gr,ls,eq);
  
  assign gr=(a>b)?1:0;
  assign ls=(a<b)?1:0;
  assign eq=(a==b)?1:0;
endmodule


testbench code

module tb;
  reg [1:0]a,b;
  wire gr,ls,eq;
  comparator dut(a,b,gr,ls,eq);
  initial begin
    repeat (10) begin
      a=$random;b=$random;
      #10;
    end
  end
  initial begin
    $monitor($time,"a=%b,b=%b,gr=%b,ls=%b,eq=%b",a,b,gr,ls,eq);
  end
endmodule
