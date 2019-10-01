`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 02:52:42 PM
// Design Name: 
// Module Name: hw2
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


module hw2(Data_in, clock, reset, Data_out);
    input [3:0] Data_in;
    input       clock, reset;
    output [3:0] Data_out;
    reg [3:0] Data_out;
    
    always @ (posedge reset or posedge clock)
        if (reset==1'b1) Data_out <=4'b0;
        else Data_out<=Data_in;
endmodule
