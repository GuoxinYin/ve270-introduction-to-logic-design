module lab777(num,equal,anode,cathode,overflow,clk

    );
    input [3:0]num;
        input equal,clk;
        output [3:0]anode;
        output [6:0]cathode;
        output overflow;
        
  wire control;
  
  wire [3:0] anode1,anode2;
  wire [6:0] cathode1,cathode2;
  
  reg [3:0] anode;
  reg clock=1'b0;
  reg[6:0] cathode;
  //reg control1=1'b0;
  
  rolling M1(clk,anode1,cathode1,control);
  calculator M2(num,equal,anode2,cathode2,overflow,clk);
      
  always @* begin
  if(clock==0)  begin  
   anode=anode1;
   cathode=cathode1;
   if(control==1) clock=1;
   end
   else begin
   anode=anode2;
   cathode=cathode2;
   end       
  end          
endmodule
