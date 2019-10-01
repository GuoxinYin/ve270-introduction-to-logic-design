`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 07:47:01 PM
// Design Name: 
// Module Name: hw5
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


module hw5(
clk,reset,upper,Q
    );
    input clk,reset;
    output [3:0] Q;
    output upper;
    reg [3:0] Q;
    reg upper;
    
    always @(posedge reset or posedge clk)
    begin
        if (reset==1'b1) Q<=0;
        else Q<=Q+1;
        if ((Q>6)&(Q<15)) upper=1;
        else upper=0;
    end
endmodule
