module bit32NOT (out,in1);
 input [31:0] in1;
 output [31:0] out;
 genvar j;
 generate for (j=0; j<32;j=j+1) begin: oring_loop
//mux_loop is the name of the loop
		not a1(out[j],in1[j]);
	end
	endgenerate
endmodule