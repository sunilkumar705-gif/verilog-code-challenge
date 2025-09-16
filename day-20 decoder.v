module decoder(input en, input [1:0]i, output reg [3:0]y);
  always@(en,i)
    begin
      if(en==1)
        begin
      case(i)
          2'b00:y=4'b0001;
           2'b01:y=4'b0010;
           2'b10:y=4'b0100;
           2'b11:y=4'b1000;   
      endcase
        end
      else
        begin
          y=4'b0000;
        end
    end
endmodule

testbench code

module tb_encoder;
  reg  [1:0] i;
  reg        en;
  wire [3:0] y;
  decoder dut (
    .i(i),
    .en(en),
    .y(y)
  );
  initial begin
    $display("Time\t en\t i\t y");
    $monitor("%0t\t %b\t %b\t %b", $time, en, i, y);
    // Case 1: Enable = 0
    en = 0; i = 2'b00; #10;
    en = 0; i = 2'b10; #10;
    en = 0; i = 2'b01; #10;
    en = 0; i = 2'b11; #10;

    // Case 2: Enable = 1, valid one-hot inputs
    en = 1; i = 2'b00; #10;
    en = 1; i = 2'b10; #10;
    en = 1; i = 2'b01; #10;
    en = 1; i = 2'b11; #10;
    $finish;
  end
endmodule
