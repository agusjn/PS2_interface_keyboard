module shif_treg_SIPO (
	input 	logic	clk,
	input 	logic	rst,
	input 	logic	shren,
	input 	logic	din,
	output logic [10:0] dout
	);

	logic [10:0] ShiftRegister;
	
	always @ (posedge clk or posedge rst) begin
		if (rst)	
			ShiftRegister <= 0;
		else if (shren)     
			ShiftRegister[10:0] <= {din,ShiftRegister[10:1]};
	end
	
	
	assign dout = ShiftRegister[10:0];
	
endmodule
