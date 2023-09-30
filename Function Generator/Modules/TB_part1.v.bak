`timescale 1ns/1ns

module TB_waveform_DDS();
  reg rst, en, cc;
  wire clk;
  wire [7:0] wave;
  reg [12:0] func;
  reg [7:0] phase_control;
  ring_osc ro(rst, clk);
  waveform_DDS wd1(wave, func, cc, rst, cc, en, phase_control);

  initial begin
    rst = 1'b1;
	cc= 1'b0;
  end
  
  always #10 cc = ~cc;
  
  initial begin
    #3 rst = 1'b0;
	phase_control = 8'd1;
	en = 1'b1;
	func = 13'b0000000000000;
	#10000 func = 13'b0000100000000;
	#10000 func = 13'b0001000000000;
	#10000 func = 13'b0001100000000;
	#10000 func = 13'b0010000000000;
	#10000 func = 13'b0010100000000;
	en = 1'b0;
	#10000 func = 13'b0011000000000;
	#10000 func = 13'b0011100000000;
	en = 1'b1;
	
	
    #20000 $stop;    
  end

endmodule




