// ********************************************************************************************************************
//
// PROJECT      :   one bit adder
// PRODUCT      :   
// FILE         :   OneBitFUllAdder_tb.sv
// AUTHOR       :  	Mohamed Nafly
// DESCRIPTION  :   
//
//
// ********************************************************************************************************************

`timescale 1ns / 1ps

module OneBitFullAdder_tb;

//---------------------------------------------------------------------------------------------------------------------
// localparam definitions
//---------------------------------------------------------------------------------------------------------------------
    
    localparam      CLK                 = 4;
    localparam      HALF_CLK            = CLK/2;
    
//---------------------------------------------------------------------------------------------------------------------
// wires and registers
//---------------------------------------------------------------------------------------------------------------------
    
    reg                     clk;
    reg                     resetn;
    
//---------------------------------------------------------------------------------------------------------------------  
// internal registers and wires
//---------------------------------------------------------------------------------------------------------------------
    
    reg             a;
    reg             b;
    reg             cin;

    wire    [1:0]   s;

//---------------------------------------------------------------------------------------------------------------------
// Instantiate the Design Under Test (DUT)
//---------------------------------------------------------------------------------------------------------------------
	OneBitFullAdder 
    #(
    )
    dut
    (
        .clk        (clk),
        .resetn     (resetn),

        .a          (a),
        .b          (b),
        .cin        (1'b0),
    
        .s          (s)
    );

    initial begin
      //  $vcdpluson;
        
        clk                         = 0;
        forever begin      
            #(HALF_CLK)   clk       = ~clk;
        end
    end

	initial begin
		// Initialize Registers
		resetn	= 1'b0;

        //define the all input
        a = 1'b0;
        b = 1'b0;
        
		// Wait 100 ns for global reset to finish
		#100;
		
		@(negedge clk);
		resetn	= 1'b1;

        set_input (1'b0, 1'b0);
        set_input (1'b1, 1'b0);
        set_input (1'b1, 1'b1);
        set_input (1'b0, 1'b1);

        /*@(negedge clk);
        a = 1'b0;
        b = 1'b0;
        @(negedge clk);
        if (s != (a+b)) begin
            $display ("TEST FAILED, expected %d, result %d", (a+b), s);
            #(4*CLK);
            $finish;
        end 
        else begin
            $display ("TEST PASSED, expected %d, result %d", (a+b), s);
        end 

        #(2*CLK);
        @(negedge clk);
        a = 1'b1;
        b = 1'b0;
        @(negedge clk);
        if (s != (a+b)) begin
            $display ("TEST FAILED, expected %d, result %d", (a+b), s);
            #(4*CLK);
            $finish;
        end
        else begin
            $display ("TEST PASSED, expected %d, result %d", (a+b), s);
        end

        #(2*CLK);
        @(negedge clk);
        a = 1'b1;
        b = 1'b1;
        @(negedge clk);
        if (s != (a+b)) begin
            $display ("TEST FAILED, expected %d, result %d", (a+b), s);
            #(4*CLK);
            $finish;
        end
        else begin
            $display ("TEST PASSED, expected %d, result %d", (a+b), s);
        end

        #(2*CLK);
        @(negedge clk);
        a = 1'b0;
        b = 1'b1;
        @(negedge clk);
        if (s != (a+b)) begin
            $display ("TEST FAILED, expected %d, result %d", (a+b), s);
            #(4*CLK);
            $finish;
        end
        else begin
            $display ("TEST PASSED, expected %d, result %d", (a+b), s);
        end

        #(4*CLK);
        $finish;*/
	end

    task set_input (input bit [1:0] aa, input bit [1:0] bb);
        
        @(negedge clk);
        a = aa;
        b = bb;
        @(negedge clk);
        if (s != (aa+bb)) begin
            $display ("TEST FAILED, expected %d, result %d", (aa+bb), s);
            #(4*CLK);
            $finish;
        end 
        else begin
            $display ("TEST PASSED, expected %d, result %d", (aa+bb), s);
        end

    endtask : set_input

endmodule

