`timescale 1ns/1ns

module TB_temp();
	reg clk = 1'b0, rst= 1'b1, adj, infreq = 1'b0;
	wire [7:0] out;
	reg [2:0] n;
	
	top_level tt(clk, rst, adj, infreq, n);
	
	always #10 clk = ~clk;
	always #99 infreq = ~infreq;
	initial begin
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
		
		#5000 $stop;
	end
	
endmodule