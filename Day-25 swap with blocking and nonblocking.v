swap with blocking statement

module swap;
  reg [3:0]a,b;
  reg [3:0]temp;
  initial begin
    a=10;b=12;
     $display("a=%b,b=%b",a,b);
    #10
    temp=a;
    a=b;
    b=temp;
     $display("a=%b,b=%b",a,b);
  end
  /*initial begin
    $monitor("a=%b,b=%b",a,b);
  end*/
endmodule

swap with nonblocking statement

module swap;
  reg [3:0]a,b;

  initial begin
    a=10;b=12;
    // $display("a=%b,b=%b",a,b);
    #10
    a<=b;
    b<=a;
     //$display("a=%b,b=%b",a,b);
  end
  initial begin
    $monitor("a=%b,b=%b",a,b);
  end
endmodule



