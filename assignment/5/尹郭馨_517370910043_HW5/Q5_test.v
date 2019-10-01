`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 12:37:32 AM
// Design Name: 
// Module Name: Q5_test
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


module Q5_test;
parameter half_period=25;
parameter counter_size=4;

wire [counter_size-1:0] Q;
wire upper;

reg clk,reset;

hw5 #(counter_size) UUT(clk,reset,upper,Q);

initial begin
#0 clk=0;reset=1;
#50 reset=0;
end

always #half_period clk=~clk;



endmodule
