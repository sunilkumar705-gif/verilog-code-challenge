module seven(input [3:0]i,output reg a,b,c,d,e,f,g);
  always@(*)
    begin
      case(i)
        4'b0000:begin a=1;b=1;c=1;d=1;e=1;f=1;g=0; end
         4'b0001:begin a=0;b=1;c=1;d=0;e=0;f=0;g=0; end
         4'b0010:begin a=1;b=1;c=0;d=1;e=1;f=0;g=1; end
         4'b0011:begin a=1;b=1;c=1;d=1;e=0;f=0;g=1; end
         4'b0100:begin a=0;b=1;c=1;d=0;e=0;f=1;g=1; end
         4'b0101:begin a=1;b=0;c=1;d=1;e=0;f=1;g=1; end
         4'b0110:begin a=0;b=0;c=1;d=1;e=1;f=1;g=1; end
         4'b0111:begin a=1;b=1;c=1;d=0;e=0;f=0;g=0; end
         4'b1000:begin a=1;b=1;c=1;d=1;e=1;f=1;g=1; end
         4'b1001:begin a=1;b=1;c=1;d=0;e=0;f=1;g=1; end
      endcase
    end
endmodule


testbench code

`timescale 1ns/1ps

module tb_seven;
    reg  [3:0] i;       
    wire a, b, c, d, e, f, g; 
    seven dut (.i(i), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g));

    initial begin
        $display("Time |  Input | a b c d e f g");
        $display("---------------------------------");
        i = 4'b0000; #10;  // 0
        i = 4'b0001; #10;  // 1
        i = 4'b0010; #10;  // 2
        i = 4'b0011; #10;  // 3
        i = 4'b0100; #10;  // 4
        i = 4'b0101; #10;  // 5
        i = 4'b0110; #10;  // 6
        i = 4'b0111; #10;  // 7
        i = 4'b1000; #10;  // 8
        i = 4'b1001; #10;  // 9

        $stop;
    end
    initial begin
        $monitor("%4t |   %b  | %b %b %b %b %b %b %b",
                 $time, i, a, b, c, d, e, f, g);
    end
endmodule
