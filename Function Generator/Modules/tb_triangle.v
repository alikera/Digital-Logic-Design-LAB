`timescale 1ns/1ns

module tb_triangle();
  
  reg clk, rst;
  wire [7:0] wave;

  triangle t1(clk, rst, wave);

  initial begin
    clk = 1'b0;
    rst = 1'b1;
  end

  always #2 clk = ~clk;

  initial begin
    #3 rst = 1'b0;
    #20000 $stop;    
  end

endmodule
