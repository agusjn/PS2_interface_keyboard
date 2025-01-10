module decoder(
					input logic [7:0] datain,
					output logic [6:0] Seg_r,
					output logic [7:0] detector);

always @ (*)
	begin 
		detector = 8'd0;
		case (datain)
		8'h69: begin
		Seg_r = 7'b1111001;//1
		detector = 8'd1;	//1
		end
		8'h72: begin
		Seg_r = 7'b0100100;//2
		detector = 8'd2;	//2
		end
		8'h7A: begin
		Seg_r = 7'b0110000;//3
		detector = 8'd3;	//3
		end
		8'h6B: begin
		Seg_r = 7'b0011001;//4
		detector = 8'd4;	//4
		end
		8'h73: begin
		Seg_r = 7'b0010010;//5
		detector = 8'd5;	//5
		end
		8'h74: begin
		Seg_r = 7'b0000010;//6
		detector = 8'd6;	//6
		end
		8'h6C: begin
		Seg_r = 7'b1111000;//7
		detector = 8'd7;	//7
		end
		8'h75: begin
		Seg_r = 7'b0000000;//8
		detector = 8'd8;	//8
		end
		8'h7D: begin
		Seg_r = 7'b0010000;//9
		detector = 8'd9;	//9
		end
		8'h70: begin
		Seg_r = 7'b1000000;//0
		detector = 8'd0;	//0
		end
		
		8'h79: begin
		Seg_r = 7'b0111001;//+
		detector = 8'd11;	//+
		end
		
		8'h7B: begin
		Seg_r = 7'b0111111;//-
		detector = 8'd12;	//-
		end
		
		8'h7C: begin
		Seg_r = 7'b0001001;//*
		detector = 8'd13;	//*
		end
		
		8'h4A: begin
		Seg_r = 7'b0100001;// div
		detector = 8'd14;	// div
		end
		
		8'h71: begin
		Seg_r = 7'b1111111;//delete
		detector = 8'd15;	//delete
		end
		
		8'h5A: begin
		Seg_r = 7'b0000110;//Enter
		detector = 8'd16;	//Enter
		end
		
		8'h66: begin
		Seg_r = 7'b0000111;// Delete all
		detector = 8'd17;	// Delete all
		end
		
		8'h15: Seg_r = 7'b0011000;//Q
		8'h1D: Seg_r = 7'b0111111;//W
		8'h24: Seg_r = 7'b0000110;//E
		8'h2D: Seg_r = 7'b0101111;//R
		8'h2C: Seg_r = 7'b0000111;//T
		8'h35: Seg_r = 7'b0010001;//Y
		8'h3C: Seg_r = 7'b1000001;//U
		8'h43: Seg_r = 7'b1111001;//I
		8'h44: Seg_r = 7'b0100011;//O
		8'h4D: Seg_r = 7'b0001100;//P
		8'h1C: Seg_r = 7'b0001000;//A
		8'h1B: Seg_r = 7'b0010010;//S
		8'h23: Seg_r = 7'b0100001;//D
		8'h2B: Seg_r = 7'b0001110;//F
		8'h34: Seg_r = 7'b0010000;//G
		8'h33: Seg_r = 7'b0001001;//H
		8'h3B: Seg_r = 7'b1100001;//J
		8'h42: Seg_r = 7'b0111111;//K
		8'h4B: Seg_r = 7'b1000111;//L
		8'h1A: Seg_r = 7'b0111111;//Z
		8'h22: Seg_r = 7'b0111111;//X
		8'h21: Seg_r = 7'b1000110;//C
		8'h2A: Seg_r = 7'b1100011;//V
		8'h32: Seg_r = 7'b0000011;//B
		8'h31: Seg_r = 7'b0101011;//N
		8'h3A: Seg_r = 7'b0111111;//M
		
		default: begin
		detector=8'd0;
		Seg_r = 7'b1000000;
		end
		endcase
	end
	
endmodule
