basic logic gates implimentation using 2X1mux

module andgate(a,b,c);
  input a,b;
  output c;
  assign c=a?b:0;
endmodule

module orgate(a,b,c);
  input a,b;
  output c;
  assign c=a?1:b;
endmodule

module nandgate(a,b,c);
  input a,b;
  output c;
  assign c=a?(~b):1;
endmodule

module norgate(a,b,c);
  input a,b;
  output c;
  assign c=a?0:(~b);
endmodule

module exorgate(a,b,c);
  input a,b;
  output c;
  assign c=a?(~b):b;
endmodule

module exnorgate(a,b,c);
  input a,b;
  output c;
  assign c=a?b:(~b);
endmodule


testbench code

module tb ;
 reg a,b;
  wire c;
  exnorgate dut(a,b,c);
  initial begin
    a=0;b=0;
    #10 a=0;b=1;
    #10 a=1;b=0;
    #10 a=1;b=1;
    #25 $finish();
  end
  initial 
    $monitor("t=%0d,a=%b,b=%b,c=%b",$time,a,b,c);
endmodule
