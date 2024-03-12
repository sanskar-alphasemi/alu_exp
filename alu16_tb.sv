//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: Shaikh Asad
//
// Create Date:    00:55:13 02/21/2024 
// Design Name:   alu16_tb.sv
// Module Name:    ALU16
// Project Name:    MIPSCORE16
// Target Devices:  
// Tool versions:     
// Description: Basic Testbench for 16-bit ALU Design of MIPS Processor
// 
// Dependencies:
//
// Revision:
// Revision 0.01 
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu16_tb;
reg[15:0] a;
reg[15:0] b;
reg[2:0] op;
//reg e;
wire [15:0] y;
//wire ack;

alu16 dut(.*);

initial begin
#5;a=16'h0;b=16'h0;op=3'b0; //RESET VALUES
#10;a=16'h4;b=16'h8;op=3'b000; //ADD
#10;a=16'h5;b=16'h3;op=3'b001; //SUB
#10;a=16'h4;b=16'h3;op=3'b111; //MUL
#10;a=16'h3;b=16'h3;op=3'b010; //INC
#10;a=16'h10;b=16'h3;op=3'b011; //DEC
#10;a=16'b1010;b=16'b0100;op=3'b100; //AND
#10;a=16'b1010;b=16'b0100;op=3'b101;//OR
#10;a=16'b1010;b=16'b0100;op=3'b110;//XOR
#10;a=16'b1111;b=16'b0101;op=3'b100;//AND
#10;a=16'b1111;b=16'b0101;op=3'b101;//OR
#10;a=16'b1111;b=16'b0101;op=3'b110;//XOR


end
  
initial begin
 $monitor("a=%0h b=%0h op=%0h y=%0h",a,b,op,y);
 $dumpfile("dump.vcd"); 
  //wait(100);
 $dumpvars;
end
  
endmodule