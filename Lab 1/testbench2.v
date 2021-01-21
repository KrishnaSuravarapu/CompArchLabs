module testbench;
	reg a3,a2,a1,a0;
	wire b3,b2,b1,b0;
	graycode mux_gate (a3,a2,a1,a0,b3,b2,b1,b0);
	initial
	begin
	$monitor($time,"a3=%b,a2=%b,a1=%b,a0=%b,b3=%b,b2=%b,b1=%b,b0=%b",a3,a2,a1,a0,b3,b2,b1,b0);
	#0 a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b0;
	#10 a3=1'b1;a2=1'b1;a1=1'b1;a0=1'b0;
	#100 $finish;
	end
endmodule
