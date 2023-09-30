`timescale 1ns/1ns

module Controller_Freq_Mult(input clk, rst, adj, InFreq, ready, CO, output reg [7:0] counter, output reg sh_en);
				
	parameter [2:0] waitfor = 0, beg = 1, empty_one = 2, count = 3, process = 4, finall = 5;
	reg [2:0] nstate, pstate;
	
	always @(pstate, adj, InFreq) begin
		nstate <= waitfor;
		case (pstate)
			waitfor:
				nstate <= adj ? beg : waitfor;
				
			beg:
				nstate <= adj ? beg : empty_one;

			empty_one:
				nstate <= InFreq ? empty_one : count;

			count:
				nstate <= InFreq ? process : count;
			
			process:
				nstate <= ready ? waitfor : process;
				
			finall:
				nstate <= CO ? waitfor : finall;
				
		endcase
	end
	
	always @(pstate,adj, InFreq, counter) begin
		sh_en <= 1'b0;
		if(pstate == waitfor) begin
			counter <= 8'b00000000;
		end
		if(pstate == process) begin
			sh_en <= 1'b1;
		end
	end
	always @(clk) begin
		if(nstate == count) begin
			counter <= counter + 1;
		end
	end
	always @(posedge clk, rst) begin
		if(rst) begin
			pstate <= waitfor;
			counter <= 8'b00000000;
		end
			
		else begin
			pstate <= nstate;
		end
	end
endmodule