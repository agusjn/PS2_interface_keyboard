module top(
	
	
    input logic clk,
	input logic rst,
	 
	 // PS2 - 7 Segment Ports
	 
	input logic PS2Clk,
	input logic datai,
	output logic [6:0] SEG1,
	output logic [6:0] SEG2,
	output logic [6:0] SEG3,
	output logic [6:0] SEG4,
	output logic [6:0] SEG5,
	output logic [6:0] SEG6
);

	 logic keydetect;
	 ps2_interface u2(.PS2Clk(PS2Clk),.FPGAClk(clk),.rst(~rst),.datain(datai),.key(code),.SEG1(SEG1),.SEG2(SEG2),.SEG3(SEG3),.SEG4(SEG4),.SEG5(SEG5),.SEG6(SEG6),.shift(keydetect));
	 
	 

	 
endmodule
