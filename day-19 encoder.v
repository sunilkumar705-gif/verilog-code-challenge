module encoder (
  input  [3:0] i,
  input        en,
  output reg [1:0] y
);
  always @(en,i) begin
    if (en == 1) begin
      case (i)
        4'b0001: y = 2'b00;
        4'b0010: y = 2'b01;
        4'b0100: y = 2'b10;
        4'b1000: y = 2'b11;
        default: y = 2'bxx;
      endcase
    end else begin
      y = 2'bzz;
    end
  end
endmodule


testbench code

module tb_encoder;
  reg  [3:0] i;
  reg        en;
  wire [1:0] y;

 
  encoder dut (
    .i(i),
    .en(en),
    .y(y)
  );

  initial begin
    $display("Time\t en\t i\t y");
    $monitor("%0t\t %b\t %b\t %b", $time, en, i, y);

    // Case 1: Enable = 0
    en = 0; i = 4'b0001; #10;
    en = 0; i = 4'b0010; #10;
    en = 0; i = 4'b0100; #10;
    en = 0; i = 4'b1000; #10;

    // Case 2: Enable = 1, valid one-hot inputs
    en = 1; i = 4'b0001; #10;
    en = 1; i = 4'b0010; #10;
    en = 1; i = 4'b0100; #10;
    en = 1; i = 4'b1000; #10;

    // Case 3: Invalid input (multiple bits high)
    en = 1; i = 4'b1010; #10;

  
    $finish;
  end

endmodule
