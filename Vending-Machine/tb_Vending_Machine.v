`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:40 09/14/2023
// Design Name:   Vending_Machine
// Module Name:   C:/Users/Alaa/Vending_Machine/tb_Vending_Machine.v
// Project Name:  Vending_Machine
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Vending_Machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Vending_Machine;

	// Inputs
	reg clk;
	reg [2:0] cin;
	reg reset;

	// Outputs
	wire [2:0] change;
	wire [2:0] current_state;
	wire product;

	// Instantiate the Unit Under Test (UUT)
	Vending_Machine uut (
		.clk(clk), 
		.cin(cin), 
		.reset(reset), 
		.change(change), 
		.current_state(current_state), 
		.product(product)
	);

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

initial begin
	clk=0;
	forever #10 clk=~clk;
end
	initial begin
	//initialization inputs
		cin<=0;
	@(posedge clk)	reset <=1;
	@(posedge clk)	reset <=0;

	
@(posedge clk) cin<=zero;
@(posedge clk) cin<=Quarter;//product =1, change=0 
@(posedge clk) cin<=zero;// 
@(posedge clk) cin<=zero;//20
@(posedge clk) cin<=Nickel;//25+5
@(posedge clk) cin<=Quarter;//product =1, change=5
@(posedge clk) cin<=zero;//10

@(posedge clk) cin<=zero;
/*@(posedge clk) din<=Dime;
@(posedge clk) din<=1;
@(posedge clk) din<=0;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=1;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=1; //1011 complete*/
		// Wait 100 ns for global reset to finish
#100 $finish;
        
		// Add stimulus here

	end
      
endmodule

