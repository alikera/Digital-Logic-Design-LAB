module amplitude_selector(input [7:0] in, [1:0] divide, output [7:0] out);
	assign out = in >>> divide;
endmodule
