module mux2to1(out,sel,in1,in2);
	input in1,in2,sel;
	output out;
	wire inv_sel,wo1,wo2;
	not n1(inv_sel,sel);
	and a1(wo1,sel,in2);
	and a2(wo2,inv_sel,in1);
	or o1(out,wo1,wo2);
endmodule
module bit8_2to1mux(out,sel,in1,in2);
	input [7:0] in1,in2;
	output [7:0] out;
	input sel;
	genvar j;
	generate for (j=0; j<8;j=j+1) begin: mux_loop
//mux_loop is the name of the loop
		mux2to1 m1(out[j],sel,in1[j],in2[j]);
//mux2to1 is instantiated every time it is called
	end
	endgenerate
endmodule
module bit32_2to1mux(out,sel,in1,in2);
	input [31:0] in1,in2;
	output [31:0] out;
	input sel;
	genvar j;
	generate for (j=0;j<4;j=j+1) begin:new_loop
	bit8_2to1mux mux1(out[8*(j+1)-1:8*j],sel,in1[8*(j+1)-1:8*j],in2[8*(j+1)-1:8*j]);
	end
	endgenerate
endmodule

	

