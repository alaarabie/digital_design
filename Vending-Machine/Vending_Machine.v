module Vending_Machine(
	input clk,
	input [2:0]  cin, //input coin Nickel(5 cents),c(10cents),Quarter(25cents
	input reset,
	output reg product,//output coin Nickel(5 cents),Dime(10cents),Quarter(25cents
	output reg [2:0] change , 
	output reg [2:0] current_state); 


//parameter of states
parameter [2:0]idel=3'b000;
parameter [2:0]five=3'b001;
parameter[2:0]ten=3'b010;
parameter[2:0]fifteen=3'b011;
parameter[2:0]twenty=3'b100;
parameter[2:0]twenty_five=3'b101;


//parameter of all posible coins for all input and output as change
parameter [2:0]zero=3'b000;//5
parameter[2:0]Nickel=3'b001;//5
parameter[2:0]Dime=3'b010;//10
parameter[2:0]nickel_Dime=3'b011;//15
parameter[2:0]Dime_Dime=3'b100;//20
parameter[2:0]Quarter=3'b101;//25


     reg [2:0] next_state;  






//sequential always of mealy FSM
		always @(posedge clk or posedge reset) begin 
			if(reset) 
				begin
					
				
				current_state <= idel;
				product<=1'b0;
				end
			 else 
				current_state<= next_state;
		end
 //combinational always of transion state of  mealy FSM 

always @(current_state or cin) begin  
	next_state=0;
product=0;
change=zero;

case (current_state)

	idel:begin

		case (cin)
			
		Nickel:begin
				next_state=five;
				end

		Dime:begin
				next_state=ten;
				end

		Quarter:begin
				next_state=twenty_five;
				end	
		 default :next_state=idel;
		
		endcase			
	end
	five:begin

		case (cin)
			
		Nickel:begin
				next_state=ten;
				end

		Dime:begin
				next_state=fifteen;
				end

		Quarter:begin
				change=Nickel;
				next_state=twenty_five;
 				end

		default :next_state=five;
		endcase		
	end
	ten:begin

		case (cin)
			
		Nickel:begin
				next_state=fifteen;
				end

		Dime:begin
				next_state=twenty;
				end

		Quarter:begin
				change=Dime;
				next_state=twenty_five;
				end	

		default :next_state=ten;

		endcase	
	end
	fifteen:begin

		case (cin)
			
		Nickel:begin
				next_state=twenty;
				end

		Dime:begin
				next_state=twenty_five;
				end

		Quarter:begin
				change=nickel_Dime;
				next_state=twenty_five;
				end	
		default :next_state=fifteen;

		endcase
	end
	twenty:begin

		case (cin)
			
		Nickel:begin
				next_state=twenty_five;
				end

		Dime:begin
				change=Nickel;
				next_state=twenty_five;
				end

		Quarter:begin
				change=Dime_Dime;
				next_state=twenty_five;
				end
		default :next_state=twenty;
		endcase
	end
	twenty_five:begin
				next_state=idel;
				product=1;
	end

	default :begin
		next_state=idel;
	end

endcase


end

	endmodule 