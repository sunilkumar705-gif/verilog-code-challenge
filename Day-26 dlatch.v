module dlatch(input d,en,output q,qbar);
  assign q=en?d:q;
  assign qbar=~q;
endmodule


testbench code

module tb;
  reg d,en;
  wire q,qbar;
  dlatch dut(d,en,q,qbar);
  initial begin
    en=1;d=0;
    #10 en=1;d=1;
    #10 en=1;d=0;
    #10 en=0;d=1;
    #10 en=0; d=0;
  end
  initial begin
    $monitor($time,"d=%b,en=%b,q=%b,qbar=%b",d,en,q,qbar);
  end
    endmodule
