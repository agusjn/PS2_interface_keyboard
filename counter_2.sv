module counter_33bit(
	input logic PS2Clk,
	input logic FPGAClk,
	input logic rst,
	output logic midout,
	output logic [5:0] count
	);
	
	logic clr;
	logic comp20;
	logic [5:0]cout;
	logic Q1;
	logic Q2;
	
	counter c(.clk(PS2Clk),.clr(Q2),.rst(rst),.count(cout));
	assign comp20 = (cout == 32) ? 1 : 0;
	assign count = cout;

	
	
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Q1 <= comp20;
		else 
			Q1 <= Q1;
	end
	
	assign midout = Q1;
	
	
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Q2 <= Q1;
		else
			Q2 <= Q2;
	end
	
	
endmodule

		
