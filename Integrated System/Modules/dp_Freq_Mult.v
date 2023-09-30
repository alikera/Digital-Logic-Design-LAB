`timescale 1ns/1ns

module dp_Freq_Mult(input [7:0] cnt, input clk, rst, sh_en, input [2:0] n, output ready, output CO);
	wire [7:0] k, W;
	shift shh(cnt, sh_en, n, k);
	//freq_div fdiv(CO, W, k, clk, 1'b1, 1'b1, out_clk);
endmodule