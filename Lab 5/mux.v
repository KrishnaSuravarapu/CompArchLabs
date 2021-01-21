module mux2to1_3inp(out,sel,in1,in2,in3,in4);
	input in1,in2,in3,in4;
	input [1:0] sel;
	output out;
	wire inv_sel1,inv_sel0,wo0,wo1,wo2;
	not n1(inv_sel1,sel[1]);
	not n2(inv_sel0,sel[0]);
	and a0(wo0,in1,inv_sel0,inv_sel1);
	and a1(wo1,in2,sel[0],inv_sel1);
	and a2(wo2,in3,inv_sel0,sel[1]);
	and a3(wo3,in4,sel[0],sel[1])
	or o1(out,wo1,wo2,wo0,wo3);
endmodule
module bit8_2to1mux_3inp(out,sel,in1,in2,in3,in4);
	input [7:0] in1,in2,in3,in4;
	output [7:0] out;
	input [1:0] sel;
	genvar j;
	generate for (j=0; j<8;j=j+1) begin: mux_loop
//mux_loop is the name of the loop
		mux2to1_3inp m1(out[j],sel,in1[j],in2[j],in3[j],in4[j]);
//mux2to1 is instantiated every time it is called
	end
	endgenerate
endmodule
module mux4_1(regData,q1,q2,q3,q4,reg_no);
	input [31:0] q1,q2,q3,q4;
	output [31:0] regData;
	input [1:0] reg_no;
	genvar j;
	generate for (j=0;j<4;j=j+1) begin:new_loop
	bit8_2to1mux_3inp m2(regData[8*(j+1)-1:8*j],reg_no,q1[8*(j+1)-1:8*j],q2[8*(j+1)-1:8*j],q3[8*(j+1)-1:8*j],q4[8*(j+1)-1:8*j]);
	end
	endgenerate
endmodule
module decoder2_4(register,reg_no);
input [1:0] reg_no;
output [3:0] register;
module decoder2_4 (register,reg_no);

