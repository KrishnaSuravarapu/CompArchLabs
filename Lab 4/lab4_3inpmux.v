module mux2to1_3inp(out,sel,in1,in2,in3);
	input in1,in2,in3;
	input [1:0] sel;
	output out;
	wire inv_sel1,inv_sel0,wo0,wo1,wo2;
	not n1(inv_sel1,sel[1]);
	not n2(inv_sel0,sel[0]);
	and a0(wo0,in1,inv_sel0,inv_sel1);
	and a1(wo1,in2,sel[0],inv_sel1);
	and a2(wo2,in3,inv_sel0,sel[1]);
	or o1(out,wo1,wo2,wo0);
endmodule
module bit8_2to1mux_3inp(out,sel,in1,in2,in3);
	input [7:0] in1,in2,in3;
	output [7:0] out;
	input [1:0] sel;
	genvar j;
	generate for (j=0; j<8;j=j+1) begin: mux_loop
//mux_loop is the name of the loop
		mux2to1_3inp m1(out[j],sel,in1[j],in2[j],in3[j]);
//mux2to1 is instantiated every time it is called
	end
	endgenerate
endmodule
module bit32_2to1mux_3inp(out,sel,in1,in2,in3);
	input [31:0] in1,in2,in3;
	output [31:0] out;
	input [1:0] sel;
	genvar j;
	generate for (j=0;j<4;j=j+1) begin:new_loop
	bit8_2to1mux_3inp m2(out[8*(j+1)-1:8*j],sel,in1[8*(j+1)-1:8*j],in2[8*(j+1)-1:8*j],in3[8*(j+1)-1:8*j]);
	end
	endgenerate
endmodule
/*
module tb_8bit2to1mux;
 reg [31:0] INP1, INP2,INP3;
 reg [1:0]SEL;
 wire [31:0] out;
bit32_2to1mux_3inp M1(out,SEL,INP1,INP2,INP3);
 initial
 $monitor($time,"  INP1=%b INP2=%b INP3=%b SEL=%b out=%b",INP1,INP2,INP3,SEL,out);
 initial
 begin
 INP1=32'b10101010101010101010101010101010;
 INP2=32'b01010101010101010101010101010101; 
 INP3=32'b11111111111111111111111111111111;
 SEL=2'b00;
 #800 SEL=2'b01;
 #1600 SEL=2'b10;
 #1600 SEL=2'b11;
 #3200 $finish;
 end
endmodule
*/

	

