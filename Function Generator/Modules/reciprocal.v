`timescale 1ns/1ns
`define on 1
`define off 0
module reciprocal(input clk, rst, output reg[7:0] wave);
	
	reg[7:0] count1;
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			wave <= 8'b00000000;
			count1 <= 8'b00000000;
		end
		
		else begin
			wave <= 8'd255/(8'd255-count1);
			count1 <= count1 + 1;
			
			if(count1 == 8'b11111110)
				count1 <= 8'b00000000;
		end
	end
endmodule

















