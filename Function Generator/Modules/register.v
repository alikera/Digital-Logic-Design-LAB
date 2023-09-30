`timescale 1ns/1ns

module register(input clk, rst, en, input [7:0] in, output reg out);
	always @(posedge clk, posedge rst) begin
		if(rst)
			out <= 8'b00000000;
		else begin
			if(en)
				out <= in;
		end
	end
endmodule
				
		