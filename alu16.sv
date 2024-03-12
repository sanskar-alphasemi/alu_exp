//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: Shaikh Asad
//
// Create Date:    00:48:12 02/21/2024 
// Design Name:   alu16.sv
// Module Name:    ALU16
// Project Name:    MIPSCORE16
// Target Devices:  
// Tool versions:     
// Description:  16-bit ALU RTL Design for MIPS Processor
// 
// Dependencies:
//
// Revision:
// Revision 0.01 
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu16(a,b,op,y);
input[15:0]a,b;
input[2:0]op;
//input e;
output reg[15:0]y;
//output reg ack;
always@ (*)
begin
//ack=0;
//if(e==1)
//begin
case(op)
3'b000:y=a+b;
3'b001:y=a-b;
3'b010:y=a+1;
3'b011:y=a-1;
3'b100:y=a&b;
3'b101:y=a|b;
3'b110:y=a^b;
3'b111:y=a*b;
default:y=0;
endcase 
//ack=1;
end
//else
//y=16'bz;
//end
endmodule