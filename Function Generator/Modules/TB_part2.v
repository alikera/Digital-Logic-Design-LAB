`timescale 1ns/1ns

module TB_waveform_freq();
  reg rst, en, cc, preset,DN;
  wire clk, clkk, pin;
  wire [7:0] wave,o;
  reg [12:0] func;
  reg [7:0] phase_control;
  ring_osc ro(rst, clk);
  ring_osc roo(rst, clkk);
  waveform_freq wd1(pin, cc, preset, DN, func, o, wave, rst, clk, en, phase_control);

  initial begin
    rst = 1'b1;
    cc= 1'b0;
  end
  
  always #10 cc = ~cc;
  
  initial begin
    #50 rst = 1'b0;
	phase_control = 8'd1;
	en = 1'b1;
	func = 13'b0000000000000;
	DN = 1'b1;
	preset = 1'b1;
	#10000 func = 13'b0000101111101;
	#10000 func = 13'b0001000000000;
	#10000 func = 13'b0001101101101;
	#10000 func = 13'b0010000000000;
	#10000 func = 13'b0010101001101;
	en = 1'b0;
	#10000 func = 13'b0011000000000;
	#10000 func = 13'b0011100000000;
	en = 1'b1;
	
	
    #20000 $stop;    
  end

endmodule




