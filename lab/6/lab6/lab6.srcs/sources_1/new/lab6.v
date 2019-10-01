module lab6(Reset,clk,row,cs,SSD,col_out,OR_row,row_out,col,col_o

    );
    input Reset;
    input clk;
    input [3:0]row;
    output [3:0]col_out,row_out,col;
    output [2:0]cs,col_o;
    output [10:0] SSD;
    output OR_row;
   
    
    parameter init=4'b0000;
    parameter s1=4'b0001;
    parameter s2=4'b0010;
    parameter s3=4'b0100;
    parameter s4=4'b1000;
    parameter s5=4'b1111;
    
    reg [25:0] Q;
    reg clock;
    reg [2:0]col_o;
    reg [3:0] curr_state;
    wire OR_row;
    wire [3:0]row_out;
    wire [2:0]col_oo;
    //reg out;
    
    //or (OR_row,row[3],row[2],row[1],row[0]);
    
    initial begin
    Q=0;
    clock=0;
    cs=3'b000;
    col_out=4'b1111;
    curr_state=init;
    col_o=3'b000;
    //out=0;
    end
    
    always @ (posedge clk)begin
    if (Q==26'b10111110101111000001111111)begin
    clock=~clock;
    Q<=0;
    end
    else begin
    clock<=clock;
    Q<=Q+1;
    end
    end
    
    reg [3:0]next_state,col_out,col;
    reg [4:0]code;
    reg [2:0]cs;
    
    
    assign OR_row=((row[3])||(row[2])||(row[1])||(row[0]));
    
    assign row_out=row;
    
    
    always @(posedge clock or posedge Reset)
    if (Reset==1) curr_state<=init;
    else          curr_state<=next_state;
    
    always @(curr_state or OR_row)
        case(curr_state)
            init: begin 
            //out=0;
                cs=3'b000;col_o=3'b000;
                //code=5'b11111;
                //code=init;
                col=4'b1111;
                col_out=4'b1111;
                  if(OR_row==0) next_state<=init; else 
                  if(OR_row==1) next_state<=s1;else
                                next_state<=init;
                  end
            s1:begin 
            //out=0;
            cs=3'b001;
            col_o=3'b001;
            //code=5'b11111;
            //code=s1;
            col_out=s1;
            col=s1;
               if(OR_row==0) next_state<=s2; else 
               if(OR_row==1) next_state<=s5;
               else   next_state<=init;
               end
            s2:begin 
            //out=0;
            cs=3'b010;col_o=3'b010;
           // code=5'b11111;
            //code=s2;
            col_out=s2;
            col=s2;
               if(OR_row==0) next_state<=s3; else 
               if(OR_row==1) next_state<=s5;
               else   next_state<=init;
               end
            s3:begin 
            //out=0;
            cs=3'b011;col_o=3'b011;
            //code=5'b11111;
            //code=s3;
            col_out=s3;
            col=s3;
               if(OR_row==0) next_state<=s4; else 
               if(OR_row==1) next_state<=s5;else   next_state<=init;
               end
            s4:begin 
            //out=0;
            cs=3'b100;col_o=3'b100;
            //code=5'b11111;
            //code=s4;
            col_out=s4;
            col=s4;
               if(OR_row==0) next_state<=init; else 
               if(OR_row==1) next_state<=s5;else   next_state<=init;
               end
            s5:begin
               cs=3'b101;
               col_o=col_o;
               case(col_o)
                3'b001:col=s1;
                3'b010:col=s2;
                3'b011:col=s3;
                3'b100:col=s4;
                default:col=4'b0000;
                endcase
               col_out=4'b1111;
               //row_out=row;
               
               if(OR_row==0) next_state<=init; else 
               if(OR_row==1) next_state<=s5;else   next_state<=init;
               
               end
               
            default: begin
                    next_state<=init;
                    cs=3'b000;
                    //code=5'b11111;
                    col_out=4'b1111;
                    col=4'b1111;
                    end
            endcase    
          
 always @(col)
      case(row)
 4'b0001: case (col)
                                  s1: code=5'b00000;
                                  s2: code=5'b00001;
                                  s3: code=5'b00010;
                                  s4: code=5'b00011; default: code=5'b11111;
                                endcase
                       4'b0010: case (col)
                                  s1: code=5'b00100;
                                  s2: code=5'b00101;
                                  s3: code=5'b00110;
                                  s4: code=5'b00111; default: code=5'b11111;
                                endcase
                       4'b0100: case (col)
                                  s1: code=5'b01000;
                                  s2: code=5'b01001;
                                  s3: code=5'b01010;
                                  s4: code=5'b01011; default: code=5'b11111;
                                endcase
                       4'b1000: case (col)
                                  s1: code=5'b01100;
                                  s2: code=5'b01101;
                                  s3: code=5'b01110;
                                  s4: code=5'b01111; default: code=5'b11111;
                                endcase
                                default: code=5'b11111;
            endcase    

          
reg [10:0] SSD;            
    always @(code)
            case (code)
        5'b00000:SSD<=11'b11100000001;
        5'b00001:SSD<=11'b11101001111;
        5'b00010:SSD<=11'b11100010010;
        5'b00011:SSD<=11'b11100000110;
        5'b00100:SSD<=11'b11101001100;
        5'b00101:SSD<=11'b11100100100;
        5'b00110:SSD<=11'b11100100000;
        5'b00111:SSD<=11'b11100001111;
        5'b01000:SSD<=11'b11100000000;
        5'b01001:SSD<=11'b11100000100;
        5'b01010:SSD<=11'b11100001000;
        5'b01011:SSD<=11'b11101100000;
        5'b01100:SSD<=11'b11100110001;
        5'b01101:SSD<=11'b11101000010;
        5'b01110:SSD<=11'b11100110000;
        5'b01111:SSD<=11'b11100111000;
        default SSD<=11'b11110111000;  
        endcase        
endmodule
