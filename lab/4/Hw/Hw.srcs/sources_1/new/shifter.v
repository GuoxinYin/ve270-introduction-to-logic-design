module shifter(Q,D,Sh,L,CLK);
    input [3:0]D;
    input Sh,L,CLK;
    output [3:0]Q;
    
    reg [3:0]Q;
    
    always @(posedge CLK) begin
        if(Sh==1'b1) begin
            Q[0]<=Q[1];
            Q[1]<=Q[2];
            Q[2]<=Q[3];
            Q[3]<=Q[0];
        end
        else if(L==1'b1) begin
            Q[0]<=D[0];
            Q[1]<=D[1];
            Q[2]<=D[2];
            Q[3]<=D[3];
        end
        else begin
            Q[0]<=Q[0];
            Q[1]<=Q[1];
            Q[2]<=Q[2];
            Q[3]<=Q[3];
        end               
    end
endmodule
