`timescale 1ns/1ns

module Freq_Mult(input clk, rst, start, input [15:0] vi, input [1:0] ui, output done);

	wire wr_req, rd_req, sh_en, ld, ld_ui, eng_start, full, empty, eng_done;
	wire [1:0] usedw;
	wire [20:0] q;
	Exp_Acc_Wrapper EAW(clk, rst, sh_en, ld, ld_ui, eng_start, wr_req, rd_req, vi, ui, start, q, full, empty, usedw, eng_done);
	controller_exp_acc_wrap ceaw(clk, rst, start, eng_done, sh_en, ld, ld_ui, eng_start, wr_req, done);
	
endmodule