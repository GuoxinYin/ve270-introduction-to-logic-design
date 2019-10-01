`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 06:28:07 PM
// Design Name: 
// Module Name: P6_test
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


module P6_test;
    parameter half_period=50;
    wire [3:0] Q;
    reg [3:0] D;
    reg CLK,Sh,L,SI;
    
    P6 UUT (Sh,L,CLK,Q,D,SI);

    
    initial begin
     #0 CLK=0; D=4'b1100;Sh=0;L=0;SI=0;
     #200 L=1;
     #200 Sh=1;SI=0;
     #200 SI=1;
     #200 L=0;
     #200 Sh=0;
     #100 L=1;
     end
     
     always #half_period CLK=~CLK;
     
     initial #1500 $stop;
endmodule
