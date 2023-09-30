`timescale 1ns/1ns

module TB_waveform();
  reg clk, rst;
  wire [7:0] wave;
  reg [2:0] func;
  waveform_generator g1(clk, rst, func, wave);

  initial begin
    clk = 1'b0;
    rst = 1'b1;
  end

  always #2 clk = ~clk;

  initial begin
    #3 rst = 1'b0;
	func = 3'b000;
	#10000 func = 3'b000;
	#10000 func = 3'b001;
	#10000 func = 3'b010;
	#10000 func = 3'b011;
	#10000 func = 3'b100;
	#10000 func = 3'b101;
	#10000 func = 3'b110;
	#10000 func = 3'b111;
	
    #20000 $stop;    
  end

endmodule




