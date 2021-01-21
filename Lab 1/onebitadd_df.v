module dataflow(a,b,s,c);
	input a,b;
	output s,c;
	
	assign c=a&b;
	assign s=a^b;
endmodule