`timescale 1ns/1ns

module TB_Freq_Mult();
	reg clk = 1'b0, rst, start = 1'b0;
	reg [1:0] ui;
	reg [15:0] vi;
	
	wire done;
	Freq_Mult FM(clk, rst, start, vi, ui, done);
	
	always #10 clk = ~clk;
	
	initial begin
		#100 rst = 1'b1;
		#100 rst = 1'b0;
		
		#100 ui = 2'b10;
		#100 vi = 16'b1100000000000000;
		#100 start = 1'b1;
		#100 start = 1'b0;
		
		#5000 ui = 2'b01;
		#100 vi = 16'b1101000000000000;
		#100 start = 1'b1;
		#100 start = 1'b0;
		
		#5000 $stop;
	end
endmodule