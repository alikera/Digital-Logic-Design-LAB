`timescale 1ns/1ns
module ring_osc #(parameter N_I = 5, DELAY = 2)(input rst, output out);
	wire [N_I:0] w;
	genvar k;
	generate 
		for (k = 0; k < N_I; k = k + 1) begin: gates
			not #(DELAY) nott(w[k + 1], w[k]);
		end
	endgenerate
	
	assign w[0] = w[N_I] | rst;
	
	assign out = w[N_I];
endmodule
