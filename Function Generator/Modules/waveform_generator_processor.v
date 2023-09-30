`timescale 1ns/1ns
module waveform_generator(input clk, rst, input[2:0] func, output reg [7:0] wave_out);
	wire [7:0] square_w, triangle_w, rhomboid_w, reciprocal_w,
		full_wave_w, half_wave_w, sinusoidally_w;
	square sq(clk, rst, square_w);
	triangle tr(clk, rst, triangle_w);
	rhomboid rh(clk, rst, rhomboid_w);
	reciprocal re(clk, rst, reciprocal_w);
	
	full_wave fw(clk, rst, full_wave_w);
	half_wave hw(clk, rst, half_wave_w);
	sinusoidally si(clk, rst, sinusoidally_w);
	
	
	always @(clk, func) begin
		case (func)
            3'b000: wave_out = rhomboid_w;
            3'b001: wave_out = square_w;
            3'b010: wave_out = reciprocal_w;
            3'b011: wave_out = triangle_w;
            3'b100: wave_out = full_wave_w;
            3'b101: wave_out = half_wave_w;
            3'b110: wave_out = sinusoidally_w;
            3'b111: wave_out = 8'b0;
        endcase
	end
endmodule