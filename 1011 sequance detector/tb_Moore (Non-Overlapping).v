`timescale 1ns/1ps

/*
module tb_Moore_NonOverlapping;
	//input
	 reg clk;    // Clock
	 reg  reset;  // Asynchronous reset 
	 reg   din;  // input sequance
	//output
	 wire  dout;

 // Instantiate the Sequence Detector using Moore FSM

sd1011_moore_No uut (
.clk(clk),
.reset(reset),
.din(din),
.dout(dout)
	);

initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	//initialization inputs
		din=0;
reset =0;

#12.5;

 din=1;
 #10;
 //first hit sequance 1011
 din=1;
 #10;
 din=0;
  #10;
 din=1;
  #10;
 din=1;


  #10;
 din=0;
  #10;
 din=0;
  #10;

  //second hhit seq 1011
 din=1;
  #10;
 din=0;
  #10;
 din=1;
  #10;
 din=1;


end

endmodule 

*/


module tb_Moore_NonOverlapping;
	//input
	 reg clk;    // Clock
	 reg  reset;  // Asynchronous reset 
	 reg   din;  // input sequance
	//output
	 wire  dout;

 // Instantiate the Sequence Detector using Moore FSM

sd1011_moore_No uut (
.clk(clk),
.reset(reset),
.din(din),
.dout(dout)
	);

initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	//initialization inputs
		din<=0;
		reset <=0;
@(posedge clk) din<=1;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=1;  //1011 complete
@(posedge clk) din<=0;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=0;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=1;
@(posedge clk) din<=0;
@(posedge clk) din<=1;
@(posedge clk) din<=1; //1011 complete


#100 $finish;
end

endmodule 