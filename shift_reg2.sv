module shift_reg_PIPO( input 	logic	clk,
						input logic [7:0] data,
						input logic		 shren,
						input	logic		rst,
						input logic		del,
						output logic [3:0]c,
						output logic [7:0]dout0,
						output logic [7:0]dout1,
						output logic [7:0]dout2,
						output logic [7:0]dout3,
						output logic [7:0]dout4,
						output logic [7:0]dout5);
	
logic [7:0] sreg [7:0];
logic [3:0] count = 0;

always @ (posedge shren or posedge rst or posedge del)
		if (rst || del)
		begin
			count <= 0;
			sreg[5]<= 8'd0;
			sreg[4]<= 8'd0;
			sreg[3]<= 8'd0;
			sreg[2]<= 8'd0;
			sreg[1]<= 8'd0;
			sreg[0]<= 8'd0;
		end
		else if (shren)
		 begin
			count <= count +1;
			sreg[5]<= sreg[4];
			sreg[4]<= sreg[3];
			sreg[3]<= sreg[2];
			sreg[2]<= sreg[1];
			sreg[1]<= sreg[0];
			sreg[0]<= data;
		end

 assign dout0 = sreg[0];
 assign dout1 = sreg[1];
 assign dout2 = sreg[2];
 assign dout3 = sreg[3];
 assign dout4 = sreg[4];
 assign dout5 = sreg[5];
 
 assign c = count;
 
endmodule
