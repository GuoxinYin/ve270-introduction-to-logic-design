
module P6(Sh,L,CLK,Q,D,SI);
input Sh,L,CLK,SI;
input [3:0] D;
output [3:0] Q;

reg [3:0] Q;

always @(posedge CLK)
begin
    if(Sh==1)
    begin
    Q[2:0]<=Q[3:1];
    Q[3]<=SI;
    end
    else if ((Sh==0)&(L==1))
    Q=D;
    else Q=Q;
end
endmodule
