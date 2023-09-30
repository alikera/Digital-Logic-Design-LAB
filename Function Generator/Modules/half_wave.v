`timescale 1ns/1ns
module half_wave(clk, rst, wave);
   input clk, rst;
   output reg [7:0] wave;

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
		

		always @(sin_t) begin 
			if (sin_t >= 0)
				wave = (sin_t[15:8]<<1) + 8'd128;
			else  
				wave = 8'd128;
		end

endmodule

