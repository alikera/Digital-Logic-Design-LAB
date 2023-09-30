`timescale 1ns/1ns
module RingOsc #(parameter N_I, DELAY)(input en, output out);
	wire [0:N_I] w;
	
	genvar k;
	generate 
		for (k = 0; k < N_I; k = k + 1) begin: gates
			not #(DELAY) nott(w[k + 1], w[k]);
		end
	endgenerate

	and andd(w[0], en, out);
	assign out = w[N_I];
endmodule