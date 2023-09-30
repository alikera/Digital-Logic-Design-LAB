`timescale 1ns/1ns

module DDS(input clk, rst, update, input [7:0] phase_control, output [7:0] dds_out);
	wire [7:0] adr;
	wire [7:0] out_reg;
	
	register r1(clk, rst, update, adr, out_reg);
	
	assign adr = out_reg + phase_control;
	assign dds_out = out_reg;
	
endmodule
