module calculator(num,equal,anode,cathode,overflow,clk

    );
    input [3:0]num;
    input equal,clk;
    output [3:0]anode;
    output [6:0]cathode;
    output overflow;
    
    parameter s0=7'b0000001;
    parameter s1=7'b1001111;
    parameter s2=7'b0010010;
    parameter s3=7'b0000110;
    parameter s4=7'b1001100;
    parameter s5=7'b0100100;
    parameter s6=7'b0100000;
    parameter s7=7'b0001111;
    parameter s8=7'b0000000;
    parameter sn=7'b1111110;
    parameter sp=7'b1111111;
    
    
    reg indi=0;
    reg clock;
    reg overflow=0;
    reg c_out,c_out1;
    reg [2:0]summ,numm,SSDD;
    reg [3:0]next_state,anode;
    reg [3:0]SSD;
    reg [15:0]Q;
    reg [3:0] sum;
    reg [6:0]cathode=7'b1111111;
                 
    always @ (posedge equal)begin
    if(indi==0)begin
    SSD=num;
    indi=1;end
    else begin
    sum=SSD;
    summ[2:0]=sum[2:0];
    numm[2:0]=num[2:0];
    {c_out,SSD}=sum+num;
    {c_out1,SSDD}=summ+numm;
    if(c_out==c_out1)overflow=0;
    else overflow=1;
    end
    end
     
    
    
    always @ (posedge clk)begin
        if (Q==16'b1100001101001111) begin
        clock<=~clock;
        Q<=0;
        end 
        else begin
        Q<=Q+1;
        end
        end
        
        always @(posedge clock)
        anode<=next_state;
    
       always @(anode)
                 case(anode)
                     4'b1110: begin
                         next_state=4'b1101;
                         case(SSD)
                         4'b0000:cathode=s0;
                         4'b0001:cathode=s1;
                         4'b0010:cathode=s2;
                         4'b0011:cathode=s3;
                         4'b0100:cathode=s4;
                         4'b0101:cathode=s5;
                         4'b0110:cathode=s6;
                         4'b0111:cathode=s7;
                         4'b1000:cathode=s8;
                         4'b1001:cathode=s7;
                         4'b1010:cathode=s6;
                         4'b1011:cathode=s5;
                         4'b1100:cathode=s4;
                         4'b1101:cathode=s3;
                         4'b1110:cathode=s2;
                         4'b1111:cathode=s1;
                         default:cathode=7'b1111111;
                         endcase
                         end
                     4'b1101:begin
                     next_state=4'b1110;
                     case(SSD)
                                         4'b0000:cathode=sp;
                                         4'b0001:cathode=sp;
                                         4'b0010:cathode=sp;
                                         4'b0011:cathode=sp;
                                         4'b0100:cathode=sp;
                                         4'b0101:cathode=sp;
                                         4'b0110:cathode=sp;
                                         4'b0111:cathode=sp;
                                         4'b1000:cathode=sn;
                                         4'b1001:cathode=sn;
                                         4'b1010:cathode=sn;
                                         4'b1011:cathode=sn;
                                         4'b1100:cathode=sn;
                                         4'b1101:cathode=sn;
                                         4'b1110:cathode=sn;
                                         4'b1111:cathode=sn;
                                         default:cathode=7'b1111111;
                                         endcase
                     end
                default:next_state=4'b1101;
                endcase
        
    
endmodule
