`timescale 1ns/1ns

module shift_comb(input [17:0] in, input [1:0] shift_numb, output [20:0] out);
	assign out = shift_numb == 2'b11 ? {in, 3'b000}:
				 shift_numb == 2'b10 ? {1'b0, in, 2'b00}:
				 shift_numb == 2'b01 ? {2'b00, in, 1'b0}:
				 shift_numb == 2'b00 ? {3'b000, in}:
				 21'd0;
endmodule
