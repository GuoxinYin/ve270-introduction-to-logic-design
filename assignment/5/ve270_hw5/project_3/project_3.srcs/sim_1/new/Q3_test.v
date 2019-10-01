`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 09:30:32 PM
// Design Name: 
// Module Name: Q3_test
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


module Q3_test;
parameter half_period=50;
wire x3,x2,x1,x0;
reg Cloc;

Hw3 UUT(x3,x2,x1,x0, Cloc);

initial begin
#0 Cloc=0; 
end

   always #half_period Cloc=~Cloc;
endmodule
