//////////////////////////////////////////////////////////////////////////////////
// Company: ALPHA SEMICONDUCTORS LLP
// Engineer: Shaikh Asad
//
// Create Date:    22:52:12 03/05/2024 
// Design Name:   rom64_tb.sv
// Module Name:    ROM64
// Project Name:    MIPSCORE16
// Target Devices:  
// Tool versions:     
// Description:  64kb ROM RTL Design for MIPS Processor
// 
// Dependencies:
//
// Revision:
// Revision 0.01 
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module rom64_tb;
reg clk,rst;
reg wrrd;
reg [15:0]addr;
reg [31:0]wr_data;
wire[31:0]rd_data;

//Hardcoded values
int i=0;
int addr_a=16'h200;
int addr_b=16'h500;
int data_a=32'hA000_A000;


rom64 dut(.*); //port mapping

//CLOCK GENERATION UNIT
initial begin
clk=1'b0;
forever #5 clk=~clk;
end

//TEST
initial begin
#20; rst=0;
#50;
  $display("****RESET DONE****");

//WRITE OPERATION

#10;wrrd=1;addr=16'h10;wr_data=32'hAAAA_BBBB;
#10;wrrd=1;addr=16'h20;wr_data=32'hCCCC_DDDD;
#10;wrrd=1;addr=16'h30;wr_data=32'hEEEE_FFFF;
#10;wrrd=1;addr=16'h40;wr_data=32'hC001_C0DE;
#10;wrrd=1;addr=16'h50;wr_data=32'hBAAD_C0DE;

//READ OPERATION
#50;wrrd=0;addr=16'h10;
#10;wrrd=0;addr=16'h20;
#10;wrrd=0;addr=16'h30;
#10;wrrd=0;addr=16'h40;
#10;wrrd=0;addr=16'h50;
 
//EXERCISE-1 : Write followed by read on Same Address (5)
$display("Exercise-1 writting and reading on same address");
 #10;wrrd=1;addr=16'h100;wr_data=32'h000A_000A;
 #10;wrrd=0;addr=16'h100;

 #10;wrrd=1;addr=16'h110;wr_data=32'h000B_000B;
 #10;wrrd=0;addr=16'h110;

 #10;wrrd=1;addr=16'h120;wr_data=32'h000C_000C;
 #10;wrrd=0;addr=16'h120;

 #10;wrrd=1;addr=16'h130;wr_data=32'h000D_000D;
 #10;wrrd=0;addr=16'h130;

 #10;wrrd=1;addr=16'h140;wr_data=32'h000E_000E;
 #10;wrrd=0;addr=16'h140;


//EXERCISE-2 : for loop incr+1 (5 addr) only write , only read , write+read
$display("Exercise-2 Using for loop to write 5 addr and then to read it back");
 repeat(5) begin
#10;wrrd=1;addr=addr_a+i;wr_data=data_a+i;
i=i+1;
$display("loop %0d",i);
end

i=0;
repeat(5) begin
#10;wrrd=0;addr=addr_a+i;
i=i+1;
end

// To write+read
i=0;
$display("Exercise-3 Using for loop to write and read 5 addr at a time");
repeat(5) begin
#10;wrrd=1;addr=addr_b+i;wr_data=data_a+i;
#10;wrrd=0;addr=addr_b+i;
i=i+1;
end


end

//RUN PHASE
initial begin
  $monitor("The Read Data on Address-%0h is %0h",addr,rd_data);
  #1000;
  $display("***TEST COMPLETE***");
  $stop();
end

//DUMP FOR EDA
initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
end
 

endmodule
