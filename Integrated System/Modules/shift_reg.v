`timescale 1ns/1ns

module shift_reg(input clk, rst, sh_en, ld, input [15:0] r_in, output reg [15:0] r_out);

	always@(posedge clk, posedge rst)begin
		if(rst == 1'b1)
			r_out <= 0;
		else
			if(ld == 1'b1)
				r_out <= r_in;
			
			else if(sh_en)
				r_out <= {r_out[14:0], 1'b0};
	end
 endmodule
