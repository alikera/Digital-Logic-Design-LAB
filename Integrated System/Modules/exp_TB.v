`timescale 1ns/1ns
module exp_TB();
	reg clk = 1'b0,rst = 1'b1,start;
	reg [15:0] x;
	wire done;
	wire [1:0] intpart;
	wire [15:0] fracpart;
	
	exponential expo(clk, rst, start, x, done, intpart, fracpart);
	
	always #10 clk = ~clk;
	
	initial begin
		#100 rst = 1'b0;
		
		#3000 start = 1'b1;
		#3000 x = 16'b1000000000000000;
		#3000 start = 1'b0;
		
		#3000 start = 1'b1;
		#3000 x = 16'b1110000000000000;
		#3000 start = 1'b0;
		
		#3000 start = 1'b1;
		#3000 x = 16'b1100000000000000;
		#3000 start = 1'b0;
		
		#10000 $stop;
	end
endmodule
		
