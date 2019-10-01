
module sim_1;
    //inputs
    reg [31:0] A;
    reg [31:0] B;
    reg sel;
    
    //output
    wire [31:0] F;
    
    //Instantiate the Unit Under Test(UUT)
    MUX_2_1_32 uut(F,A,B,sel);
        initial begin
        #0
        A=0;
        B=0;
        sel=0;
        
     
        #100
        A=32'b00000000000000000000000000000000;
        B=32'b00000000000111110000000000000000;
        sel=1;
        #100
        A=32'b00000001111100000000000000000000;
        B=32'b00000000000000000001111111111110;
        sel=0;
    end
endmodule
