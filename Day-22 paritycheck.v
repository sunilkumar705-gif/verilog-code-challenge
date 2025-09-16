module paritycheck(input [7:0]d,output evenpar,oddpar);
  assign evenpar=^(d);
  assign oddpar=~^(d);
endmodule

testbench code

module tb;
  reg [7:0]d;
  wire evenpar,oddpar;
  paritycheck dut(d,evenpar,oddpar);
  initial begin
    repeat (10) begin
      d=$random;
      #10;
    end
  end
  initial begin
    $monitor($time,"d=%b,evenpar=%b,oddpar=%b",d,evenpar,oddpar);
  end
endmodule
