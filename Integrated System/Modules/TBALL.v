`timescale 1ns/1ns

module TBALL();

	reg clk = 1'b0, rst = 1'b1, adj, start, infreq;
	reg [15:0] vi;
	reg [1:0] ui;
	reg [2:0] n;

	wire [20:0] exp_out;

	integrated integ(clk, rst, adj, infreq, start, vi, ui, n, exp_out);

	always #5 clk = ~clk;

	initial begin
		#100 ui = 2'b10;
		#100 vi = 16'b1100000000000000;
		#100 start = 1'b1;
		#100 start = 1'b0;
		
		#5000 ui = 2'b01;
		#100 vi = 16'b1101000000000000;
		#100 start = 1'b1;
		#100 start = 1'b0;
	
		#100 n = 3'b010;
		#100 rst = 1'b1;
		#100 rst = 1'b0;
	
		#100 adj = 1'b0;
		#100 adj = 1'b1;
		#100 adj = 1'b0;
		
		#5000 n = 3'b011;
	
		#100 adj = 1'b0;
		#100 adj = 1'b1;
		#100 adj = 1'b0;
		
		#5000 n = 3'b100;
	
		#100 adj = 1'b0;
		#100 adj = 1'b1;
		#100 adj = 1'b0;
		
		
	end

endmodule