module InstructionMem(pc,out);
	input [4:0] pc;
	reg [31:0] inp [0:31];
	output [31:0] out;
	assign out=inp[pc]
endmodule
