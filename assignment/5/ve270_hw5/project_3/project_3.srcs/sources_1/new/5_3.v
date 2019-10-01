`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2018 05:31:09 PM
// Design Name: 
// Module Name: 5_3
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

module Hw3 (x3,x2,x1,x0, Cloc);
    input Cloc;
    output x3,x2,x1,x0;
    
    reg x3,x2,x1,x0,f,a,b,c,d;
 
    always @ (posedge Cloc) begin
    f=(~a)&d|a&(-d);
    a<=f;
    b<=a;
    c<=b;
    d<=c;
    x3=f;
    x2=a;
    x1=b;
    x0=c;
    end
    
endmodule
