module counter(
	input logic clk,
	input  logic clr,
	input logic rst,
	output logic [6:0] count
	);
	
	logic [5:0] D;
	logic [5:0] Q;
	
	always @(negedge clk or posedge rst) begin
		if(rst)
			Q <= 0;
		else if(clr)
			Q <= 0;
		else if(~clk)
			Q <= Q + 1;
	end
	
	assign count = Q;
	
endmodule
