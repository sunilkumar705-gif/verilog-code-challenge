module priorityencoder(input [3:0]d,output reg [1:0]y,output reg v);
  always@(*)
    begin
      case(d)
        4'b0000:begin
          y=2'bxx;v=0;
        end
        4'b1000:begin
          y=2'b00;v=1;
        end
        4'b0100:begin
          y=2'b01;v=1;
        end
        4'b0010:begin
          y=2'b10;v=1;
        end
        4'b0001:begin
          y=2'b11;v=1;
        end
      endcase
    end
endmodule
        


testbench code

module tb;
  reg [3:0]d;
  wire [1:0]y;
  wire v;
  priorityencoder dut(d,y,v);
  initial begin
    repeat (10) begin
      d=$random;
       #10;
   end
  end
 initial begin
   $monitor($time ," d=%b,y=%b,v=%b",d,y,v);
 end
endmodule    
