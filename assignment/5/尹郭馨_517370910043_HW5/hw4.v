`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 07:26:07 PM
// Design Name: 
// Module Name: hw4
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


module hw4(
    clk,clear,cnt,set,Q,
    );
    input clk,clear,cnt,set;

    output [3:0] Q;
 
    reg [3:0] Q;
    always @(posedge clear or posedge clk or posedge set)
        if (clear==1'b1) Q<=0;
        else if (set==1'b1) Q<=15;
        else if (cnt==1'b1) Q=Q-1;
        else Q=Q;
     
endmodule
