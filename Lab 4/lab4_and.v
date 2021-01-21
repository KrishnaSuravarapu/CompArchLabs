module bit32AND (out,in1,in2);
 input [31:0] in1,in2;
 output [31:0] out;
 genvar j;
 generate for (j=0; j<32;j=j+1) begin: anding_loop
//mux_loop is the name of the loop
		and a1(out[j],in1[j],in2[j]);
	end
	endgenerate
endmodule
/*
module tb32bitand;
 reg [31:0] IN1,IN2;
 wire [31:0] OUT;
 bit32AND a1 (OUT,IN1,IN2);
 initial
 $monitor($time,"  IN1=%b IN2=%b OUT=%b",IN1,IN2,OUT);
 initial
 begin
 IN1=32'hA5A5;
 IN2=32'h5A5A;
 #100 IN1=32'h5A5A;
 #400 $finish;
 end
endmodule
*/