module Lab4(Q,UD,clock,reset,SSD);

    input UD,clock,reset;
    output [3:0]Q;
    output [10:0]SSD;
    
    reg [3:0] Q;
    reg [10:0] SSD;
    
    always @(posedge reset or posedge clock)
    begin
        if (reset==1'b1) begin
        Q<=0;
        SSD<=11'b11100000001;
        end
        else if (UD==1'b1)begin
            Q<=Q+1;
            case (Q)
            15:SSD<=11'b11100000001;
            0:SSD<=11'b11101001111;
            1:SSD<=11'b11100010010;
            2:SSD<=11'b11100000110;
            3:SSD<=11'b11101001100;
            4:SSD<=11'b11100100100;
            5:SSD<=11'b11100100000;
            6:SSD<=11'b11100001111;
            7:SSD<=11'b11100000000;
            8:SSD<=11'b11100000100;
            9:SSD<=11'b11100001000;
            10:SSD<=11'b11101100000;
            11:SSD<=11'b11100110001;
            12:SSD<=11'b11101000010;
            13:SSD<=11'b11100110000;
            14:SSD<=11'b11100111000;
            default SSD<=0;
            endcase
        end
        else if (UD==1'b0)begin
            Q<=Q-1;
            case (Q)
            1:SSD<=11'b11100000001;
            2:SSD<=11'b11101001111;
            3:SSD<=11'b11100010010;
            4:SSD<=11'b11100000110;
            5:SSD<=11'b11101001100;
            6:SSD<=11'b11100100100;
            7:SSD<=11'b11100100000;
            8:SSD<=11'b11100001111;
            9:SSD<=11'b11100000000;
            10:SSD<=11'b11100000100;
            11:SSD<=11'b11100001000;
            12:SSD<=11'b11101100000;
            13:SSD<=11'b11100110001;
            14:SSD<=11'b11101000010;
            15:SSD<=11'b11100110000;
            0:SSD<=11'b11100111000;
            default SSD<=0;
         endcase
        end
        else begin
        Q<=Q;
        case (Q)
            0:SSD<=11'b11100000001;
            1:SSD<=11'b11101001111;
            2:SSD<=11'b11100010010;
            3:SSD<=11'b11100000110;
            4:SSD<=11'b11101001100;
            5:SSD<=11'b11100100100;
            6:SSD<=11'b11100100000;
            7:SSD<=11'b11100001111;
            8:SSD<=11'b11100000000;
            9:SSD<=11'b11100000100;
            10:SSD<=11'b11100001000;
            11:SSD<=11'b11101100000;
            12:SSD<=11'b11100110001;
            13:SSD<=11'b11101000010;
            14:SSD<=11'b11100110000;
            15:SSD<=11'b11100111000;
            default SSD<=0;
         endcase
     end
    end
endmodule



























