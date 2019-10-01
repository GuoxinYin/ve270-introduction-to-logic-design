module rolling(clk,anode,cathode,control

    );
    input clk;
    output [3:0]anode;
    output [6:0]cathode;
    output control;
    
    parameter d1=4'b0111;
    parameter d2=4'b1011;
    parameter d3=4'b1101;
    parameter d4=4'b1110;
    parameter d0=4'b1111;
    parameter id5=7'b0100100;
    parameter id1=7'b1001111;
    parameter id7=7'b0001111;
    parameter id3=7'b0000110;
    parameter id0=7'b0000001;
    parameter id9=7'b0000100;
    parameter id4=7'b1001100;
    parameter idn=7'b1111111;
    
    
    reg [15:0]Q_digit=0;
    reg [25:0]Q_divider=0;
    reg clock;
    reg control=0;
    reg [6:0]cathode=id5;
    reg [3:0]anode=d1;
    reg [3:0]next_state=4'b1011;
    reg [4:0]ca=0;

    always @ (posedge clk)begin
    if (Q_digit==16'b1100001101001111) begin
    clock<=~clock;
    Q_digit<=0;
    end 
    else begin
    Q_digit<=Q_digit+1;
    end
    end
    
    always @(posedge clock)
    anode<=next_state;
    
    always @(anode)
        case(anode)
            d1: begin
                next_state=d2;
                case(ca)
                5'b00110:cathode=id5;
                5'b00111:cathode=id5;
                5'b01000:cathode=id1;
                5'b01001:cathode=id1;
                5'b01010:cathode=id7;
                5'b01011:cathode=id7;
                5'b01100:cathode=id3;
                5'b01101:cathode=id3;
                5'b01110:cathode=id7;
                5'b01111:cathode=id7;
                5'b10000:cathode=id0;
                5'b10001:cathode=id0;
                5'b10010:cathode=id9;
                5'b10011:cathode=id9;
                5'b10100:cathode=id1;
                5'b10101:cathode=id1;
                5'b10110:cathode=id0;
                5'b10111:cathode=id0;
                5'b11000:cathode=id0;
                5'b11001:cathode=id0;
                5'b11010:cathode=id4;
                5'b11011:cathode=id4;
                5'b11100:cathode=id3;
                5'b11101:cathode=id3;
                default:cathode=idn;
                endcase
                end
            d2:begin
            next_state=d3;   
            case(ca) 
                            5'b00100:cathode=id5;
                            5'b00101:cathode=id5;
                            5'b00110:cathode=id1;
                            5'b00111:cathode=id1;
                            5'b01000:cathode=id7;
                            5'b01001:cathode=id7;
                            5'b01010:cathode=id3;
                            5'b01011:cathode=id3;
                            5'b01100:cathode=id7;
                            5'b01101:cathode=id7;
                            5'b01110:cathode=id0;
                            5'b01111:cathode=id0;
                            5'b10000:cathode=id9;
                            5'b10001:cathode=id9;
                            5'b10010:cathode=id1;
                            5'b10011:cathode=id1;
                            5'b10100:cathode=id0;
                            5'b10101:cathode=id0;
                            5'b10110:cathode=id0;
                            5'b10111:cathode=id0;
                            5'b11000:cathode=id4;
                            5'b11001:cathode=id4;
                            5'b11010:cathode=id3;
                            5'b11011:cathode=id3;
                            default:cathode=idn;
            endcase
            end
            d3:begin
            next_state=d4;  
            case(ca) 
                            5'b00010:cathode=id5;
                            5'b00011:cathode=id5;
                            5'b00100:cathode=id1;
                            5'b00101:cathode=id1;
                            5'b00110:cathode=id7;
                            5'b00111:cathode=id7;
                            5'b01000:cathode=id3;
                            5'b01001:cathode=id3;
                            5'b01010:cathode=id7;
                            5'b01011:cathode=id7;
                            5'b01100:cathode=id0;
                            5'b01101:cathode=id0;
                            5'b01110:cathode=id9;
                            5'b01111:cathode=id9;
                            5'b10000:cathode=id1;
                            5'b10001:cathode=id1;
                            5'b10010:cathode=id0;
                            5'b10011:cathode=id0;
                            5'b10100:cathode=id0;
                            5'b10101:cathode=id0;
                            5'b10110:cathode=id4;
                            5'b10111:cathode=id4;
                            5'b11000:cathode=id3;
                            5'b11001:cathode=id3;
                            default:cathode=idn;
            endcase
            end 
            d4:begin
            next_state=d1; 
            case(ca)
                            5'b00000:cathode=id5;
                            5'b00001:cathode=id5;
                            5'b00010:cathode=id1;
                            5'b00011:cathode=id1;
                            5'b00100:cathode=id7;
                            5'b00101:cathode=id7;
                            5'b00110:cathode=id3;
                            5'b00111:cathode=id3;
                            5'b01000:cathode=id7;
                            5'b01001:cathode=id7;
                            5'b01010:cathode=id0;
                            5'b01011:cathode=id0;
                            5'b01100:cathode=id9;
                            5'b01101:cathode=id9;
                            5'b01110:cathode=id1;
                            5'b01111:cathode=id1;
                            5'b10000:cathode=id0;
                            5'b10001:cathode=id0;
                            5'b10010:cathode=id0;
                            5'b10011:cathode=id0;
                            5'b10100:cathode=id4;
                            5'b10101:cathode=id4;
                            5'b10110:cathode=id3;
                            5'b10111:cathode=id3;
                            default:cathode=idn;
            endcase
            end
            d0:next_state=d0;
        default: next_state=d1;
        endcase      
    
    always @ (posedge clk)begin
            if (Q_divider==26'b10111110101111000001111111)begin
            //clock=~clock;
            Q_divider<=0;
            if(ca>5'b11101) begin
            ca<=5'b11111;
            control=1;
            end
            else ca<=ca+1;
            end
            else begin
            //clock<=clock;
            Q_divider<=Q_divider+1;
            end
            end
    

    
endmodule
