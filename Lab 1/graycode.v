module graycode(a3,a2,a1,a0,b3,b2,b1,b0);
	input a3,a2,a1,a0;
	output b3,b2,b1,b0;
	wire w1,w2,w3;
	
	or o1(b3,a3,a3);
	xor x1(b2,a3,a2);
	xor x2(b1,a2,a1);
	xor x3(b0,a1,a0);
	
endmodule
	