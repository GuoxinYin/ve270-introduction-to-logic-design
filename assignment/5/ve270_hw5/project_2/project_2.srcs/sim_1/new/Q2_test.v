`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 08:55:04 PM
// Design Name: 
// Module Name: Q2_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Q2_test;
    parameter half_period=50;
    parameter counter_size=4;
    
    wire [counter_size-1:0] Data_out;
    reg [counter_size-1:0] Data_in;
    reg clock,reset;
    
    hw2 #(counter_size) UUT (Data_in, clock, reset, Data_out);
    
    initial begin
    #0 clock=0;Data_in=0;reset=1;
    #100 reset=0;
    #100 Data_in=4'b0001;
    #100 Data_in=4'b0011;
    #100 Data_in=4'b0101;
    #100 Data_in=4'b0111;
    #100 Data_in=4'b1001;
    #100 Data_in=4'b1111;
    #100 reset=1;
    #100 Data_in=4'b0101;
    end
    
    always #half_period clock=~clock;
    

endmodule
