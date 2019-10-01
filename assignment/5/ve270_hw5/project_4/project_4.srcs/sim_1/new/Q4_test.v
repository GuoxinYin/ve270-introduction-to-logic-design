`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 10:00:37 PM
// Design Name: 
// Module Name: Q4_test
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


module Q4_test;
 parameter half_period=50;
   parameter counter_size=4;
   
   wire [counter_size-1:0] Q;
   reg clk,clear,cnt,set;
   
   hw4 #(counter_size) UUT (clk,clear,cnt,set,Q,);
   
   initial begin
   #0 clk=0;set=1;clear=0;cnt=0;
   #100 set=0;
   #100 cnt=1;
   #200 cnt=0;
   #400 clear=1;
   end
   
   always #half_period clk=~clk;
   
endmodule
