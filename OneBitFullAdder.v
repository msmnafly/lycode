// ********************************************************************************************************************
//
// PROJECT      :   one bit adder
// PRODUCT      :   
// FILE         :   one_bit_full_adder.v
// AUTHOR       :  	Mohamed Nafly
// DESCRIPTION  :   
//
// ********************************************************************************************************************

`timescale 1ns / 1ps

module OneBitFullAdder
#(
//---------------------------------------------------------------------------------------------------------------------
// parameter definitions
//---------------------------------------------------------------------------------------------------------------------
)(
//---------------------------------------------------------------------------------------------------------------------
// I/O signals
//---------------------------------------------------------------------------------------------------------------------
	
	input 				clk,  //constraint
	input 				resetn,	//active - low push button
				
	input 				a, //DIP switch
	input 				b,
	input 				cin,

	output reg [1:0] 	s  //LED
);

//---------------------------------------------------------------------------------------------------------------------
// Internal wires and registers
//---------------------------------------------------------------------------------------------------------------------
	
	reg 	[2:0] 	d;
//wire and reg

//---------------------------------------------------------------------------------------------------------------------
// Implementation
//---------------------------------------------------------------------------------------------------------------------
	
	//RTL (register transfer level) code
	//sequantial block, //non-blocking :- execute in parallel
	always @ (posedge clk) begin //(nededge clk)
		if (!resetn) begin
			s 	<= {2{1'b0}};
			d 	<= {3{1'b0}};
		end 
		else begin
			s 	<= a + b + cin;
			d 	<= s + 1'b1;
		end 
	end
endmodule
