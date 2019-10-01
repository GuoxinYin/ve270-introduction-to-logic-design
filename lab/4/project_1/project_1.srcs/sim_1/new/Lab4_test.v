`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 01:13:20 PM
// Design Name: 
// Module Name: Lab4_test
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


module Lab4_test;
parameter half_period=50;
parameter counter_size=4;

wire[counter_size-1:0] Q;
wire [10:0] SSD;
reg clock,reset,UD;

Lab4 #(counter_size) UUT(Q,UD,clock,reset,SSD);

initial begin
#0 clock=0;reset=1;UD=1;
#50 reset=0;
end

always #half_period clock=~clock;
endmodule
