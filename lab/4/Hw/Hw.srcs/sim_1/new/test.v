module test;
    reg [3:0]D;
    reg CLK,Sh,L;
    
    wire [3:0]Q;
    
    shifter myshifter(Q,D,Sh,L,CLK);
    
    initial begin
        #0 D[0]=1'b1;D[1]=1'b0;D[2]=1'b0;D[3]=1'b1;Sh=0;L=1;CLK=0;
        #200 L=0;
        #500 Sh=1;
        #700 L=1;
    end
    always #50 CLK=~CLK;
endmodule
