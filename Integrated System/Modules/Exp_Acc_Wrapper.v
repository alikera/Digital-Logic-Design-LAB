`timescale 1ns/1ns

module Exp_Acc_Wrapper(input clk, rst, sh_en, ld, ld_ui, eng_start, wr_req, rd_req, input [15:0] vi, input [1:0] ui, input start, 
						output [20:0] q, output full, empty, output [1:0] usedw, output eng_done);
	
	wire [20:0] wr_data;
	wire [15:0] eng_x, x_frac;
	wire [1:0] x_int, ui_out;

	
	shift_reg sh1(clk, rst, sh_en, ld, vi, eng_x);
	exponential exp_eng(clk, rst, eng_start, eng_x, eng_done, x_int, x_frac);
	shift_comb sh_comb({x_int, x_frac}, ui_out, wr_data);
	
	ui_reg uireg(clk, rst, ld_ui, ui, ui_out);

	FIFO fif(clk, wr_data, rd_req, wr_req, empty, full, q, usedw);
	
endmodule