`timescale 1ns/1ns
`define on 1
`define off 0
module square(input clk, rst, output reg[7:0] wave);
	
	reg[7:0] count1;
	reg up, down;
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			wave <= 8'd255;
			count1 <= 8'b00000001;
			up = `on;
			down = `off;
		end
		
		else begin
			if(up) begin
				wave <= 8'd255;
				count1 <= count1 + 1;
			end
			else if(down) begin
				wave <= 8'b0;
				count1 <= count1 - 1;
			end
			
			if(count1 == 8'b11111110) begin
				up = `off;
				down = `on;
			end
			
			if(count1 == 8'b00000001) begin
				up = `on;
				down = `off;
			end
		end
	end
endmodule

















