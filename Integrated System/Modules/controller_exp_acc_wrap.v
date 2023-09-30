`timescale 1ns/1ns

module controller_exp_acc_wrap(input clk, rst, start, eng_done,
				output reg sh_en, ld, ld_ui, eng_start, wr_req, done);
				
	parameter [2:0] waitfor = 0, beg = 1, exp = 2, write = 3, process = 4;
	reg [2:0] nstate, pstate;
	reg [1:0] counter;
	
	always @(pstate, start, eng_done) begin
		nstate <= waitfor;
		case (pstate)
			waitfor:
				nstate <= start ? beg : waitfor;
				
			beg:
				nstate <= start ? beg : exp;

			exp:
				nstate <= ~eng_done ? write : exp;

			write:
				nstate <= eng_done ? process : write;
			
			process:
				nstate <= counter == 2'b11 ? waitfor : exp;
				
		endcase
	end
	
	always @(pstate, start, eng_done) begin
		sh_en = 1'b0;
		ld = 1'b0;
		ld_ui = 1'b0;
		eng_start = 1'b0;
		wr_req = 1'b0;
		done = 1'b0;
		
		if(pstate == beg) begin
			ld = 1'b1;
			ld_ui = 1'b1;
		end
		else if(pstate == exp)
			eng_start = 1'b1;
		else if(pstate == write) begin
			done = 1'b1;
		end
		
		else if(pstate == process) begin
			wr_req = 1'b1;
			sh_en = 1'b1;
			counter <= counter + 1;
		end
	end
	
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			pstate <= waitfor;
			counter <= 2'b00;
		end
			
		else begin
			pstate <= nstate;
		end
	end
endmodule