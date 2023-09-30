`timescale 1ns/1ns
`define on 1
`define off 0
module sinusoidally(clk, rst, wave);
	input clk, rst;
	output reg [7:0] wave;
	reg up, down;
	reg signed [15:0] sin,sin_t,cos,cos_t;
	always @(sin_t or cos_t)
		sin = sin_t + (cos_t>>>6);

		always @(sin or cos_t)
			cos = cos_t - (sin>>>6);

		always @(posedge clk, posedge rst) begin
			if (rst) begin
				sin_t <= 16'b0000000000000000;
				cos_t <= 16'b0111010100110000;
			end
			else begin
				sin_t <= sin;
				cos_t <= cos;
			end
		end
		

		always @(up,down,sin_t, posedge rst) begin 
			wave = 8'b00000000;
			if (up) begin
				wave = (sin_t[15:8]);
				down = `on;
				up = `off;
			end
			else if(down) begin
				wave = (-sin_t[15:8]);
				down = `off;
				up = `on;
			end
			if(rst) begin
				down = `off;
				up = `on;
			end
		end

endmodule
