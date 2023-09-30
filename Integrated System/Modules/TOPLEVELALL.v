`timescale 1ns/1ns

module integrated(input clk, rst, adj, infreq, start, input [1:0] ui,  input [15:0] vi, input [2:0] n, output [20:0] out);
	
	Freq_Mult FMM(clk, rst, start, vi, ui, done);

	top_level TLF(clk, rst, adj, infreq, n);
	
endmodule