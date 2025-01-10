module ps2_interface(
	input logic PS2Clk,
	input logic FPGAClk,
	input logic rst,
	input logic datain,
	output logic [6:0] SEG1,
	output logic [6:0] SEG2,
	output logic [6:0] SEG3,
	output logic [6:0] SEG4,
	output logic [6:0] SEG5,
	output logic [6:0] SEG6,
	output logic [7:0] key,

	output logic shift
	);
	
	logic Qreg; 
	logic [10:0] Q; 
	logic [7:0] Qseg; 
	logic clrCounter; 

	
	logic comp0a; 
	logic compf0; 
	logic [5:0] count; 
	logic [10:0] D; 
	logic [7:0] D1;
	logic [7:0] data;
	
	logic comp21;
	logic midout; 
	logic [5:0] countSynch;
	logic [7:0] key_detect5;
	
	logic [7:0] key_detect20;
	
	logic [7:0]segments0;
	logic [7:0]segments1;
	logic [7:0]segments2;
	logic [7:0]segments3;
	logic [7:0]segments4;
	logic [7:0]segments5;


	
	assign key = D1;
	assign clk2 = FPGAClk;
	assign shift = midout;
	
	shif_treg_SIPO sr1(.clk(~PS2Clk),.rst(~rst),.shren(1),.din(datain),.dout(D));
	assign D1 =  Q[8:1];
	counter c(.clk(PS2Clk),.clr(clrCounter),.rst(~rst),.count(count));
	assign comp0a = (count == 10) ? 1 : 0;
	
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			Qreg <= comp0a;
		else 
			Qreg <= Qreg;
	end
	
	
	always @(posedge FPGAClk) begin
		if(FPGAClk)
			clrCounter <= Qreg;
		else
			clrCounter <= clrCounter;
	end
	
	
	counter_33bit s(.PS2Clk(PS2Clk),.FPGAClk(FPGAClk),.rst(~rst),.midout(midout),.count(countSynch));  
	
	
	
	assign comp21 = (countSynch == 33) ? 1 : 0; 
	
	always @ (negedge Qreg) begin	
		
		if(comp21)
			Q <= 0;
		else
			Q <= D;
	end
	
	assign compf0 = (D1 != 240) ? 1 : 0; 
	
	logic [8:0] keycount = 0;
	
	
	always @(posedge FPGAClk) begin
		if(compf0) begin
			Qseg <= D1;
			keycount <= keycount + 1;
			end
		else begin
			Qseg <= Qseg;
			keycount <= 0;
	end
	end
	
	
	
	shift_reg_PIPO s2(.clk(FPGAClk),.data(Qseg),.rst(~rst),.c(),.del(delete),.shren(midout),.dout0(segments0),.dout1(segments1),.dout2(segments2),.dout3(segments3),.dout4(segments4),.dout5(segments5));
	decoder d1(.datain(segments0),.Seg_r(SEG1),.detector());
	decoder d2(.datain(segments1),.Seg_r(SEG2),.detector());
	decoder d3(.datain(segments2),.Seg_r(SEG3),.detector());
	decoder d4(.datain(segments3),.Seg_r(SEG4),.detector());
	decoder d5(.datain(segments4),.Seg_r(SEG5),.detector());
	decoder d6(.datain(segments5),.Seg_r(SEG6),.detector());
	decoder d9(.datain(Qseg),.Seg_r(),.detector(key_detect5));	
	decoder d10(.datain(Qseg),.Seg_r(),.detector(key_detect20));	

	logic op, go, delete;
	assign go = (key_detect20 == 8'd16) ? 1 : 0;
	assign delete = (key_detect5 == 8'd15) ? 1 : 0;
	

	
	

	
	
endmodule
