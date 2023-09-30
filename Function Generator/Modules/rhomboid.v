`timescale 1ns/1ns
`define on 1
`define off 0
module rhomboid(input clk, rst, output reg [7:0] wave);
	reg[7:0] count1, count2;
	reg up, down;
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			wave <= 8'd127;
			count1 <= 8'b0;
			count2 <= 8'b0;
			up = `on;
			down = `off;
		end
		
		else begin
			if(up && count1 % 2 == 0) begin
				wave <= count1 + 8'd127;
				count1 <= count1 + 1;
				count2 <= count2 - 1;
			end
			if(up && count1 % 2 == 1) begin
				wave <= count2 + 8'd127;
				count2 <= count2 - 1;
				count1 <= count1 + 1;
			end
			else if(down && count1 % 2 == 0) begin
				wave <= count1 + 8'd127;
				count1 <= count1 - 1;
				count2 <= count2 + 1;
			end
			else if(down && count1 % 2 == 1) begin
				wave <= count2 + 8'd127;
				count2 <= count2 + 1;
				count1 <= count1 - 1;
			end
			
			if(count1 == 8'd127 || count2 == 8'b0) begin
				up = `off;
				down = `on;
			end
			
			if(count1 == 8'b0 || count2 == 8'd127) begin
				up = `on;
				down = `off;
			end
		end
	end
endmodule
	
