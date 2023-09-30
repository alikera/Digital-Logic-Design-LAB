`timescale 1ns/1ns

module shift(input[7:0] in, input en, input [2:0] n, output [7:0] out);
	assign out = en ? in >> n : 8'd0;
	
endmodule
