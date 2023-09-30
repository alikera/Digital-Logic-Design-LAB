`timescale 1ns/1ns

module top_level(input clk, rst, adj, infreq, input [2:0] n);
	wire [7:0] cnt;
	wire sh_en, ready, CO;
	dp_Freq_Mult dfm(cnt, clk, rst, sh_en, n, ready, CO);
	Controller_Freq_Mult cfm(clk, rst, adj, infreq, ready, CO, cnt, sh_en);
endmodule
