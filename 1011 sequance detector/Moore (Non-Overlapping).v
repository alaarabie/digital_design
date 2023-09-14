//Moore  1011 SEQUANCE DETECTOR (Non-Overlapping)
module sd1011_moore_No (
	input   clk,
	input   reset,
	input   din,
	output reg  dout);
	
	
	
parameter 
			idle=5'b00001,
			s1=5'b00010,
			s10=5'b00100,
			s101=5'b01000,
			s1011=5'b10000;
			
			
			

reg [4:0] next_state ,current_state;

//sequential memory of FSM
always @(posedge clk or posedge reset) begin
	if(reset) 
		current_state <= idle;
	 
		else 
		current_state <= next_state;
end
//combinational of FSM
always @(din or current_state) begin 

		case (current_state)
		idle:begin
	
			if (din)  
				next_state=s1;
			 
		end


		s1: begin
		
			if (din==1'b0)  
				next_state=s10;
			 
		end
		s10: begin
		
			
				if (din)  
					next_state=s101;
					else
					next_state=idle;
				
			 

		end
		s101 : begin 
	
			if (din)  
				next_state=s1011;
				else
				next_state=s10;
			 
		end
		s1011: begin

		if (din)  
		next_state=s1;
		 else
		next_state=idle;
		 

		end
		default : 		
		next_state=idle;

		endcase

 end



always @(current_state) begin 

	case (current_state)
	idle: dout=0;
	s1: dout=0;
	s10: dout=0;
	s101: dout=0;
	s1011: dout=1;
		default :dout=0;
	endcase
end


endmodule