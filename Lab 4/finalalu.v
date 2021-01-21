module ALU(a,b,Binvert,Carryin,Operation,Result,CarryOut);
	input [31:0] a,b;
	input Binvert,Carryin;
	input [1:0] Operation;
	output CarryOut;
	output [31:0] Result;
	wire [31:0] w0,w1,w2,w3,w4,w5,w6;
	bit32NOT g1(w0,b);
	bit32_2to1mux g2(w1,Binvert,b,w0);
	bit32AND g3(w4,a,w1);
	bit32OR g4(w5,a,w1);
	FA_dataflow g5(CarryOutout,w6,a,w1,Carryin);
	bit32_2to1mux_3inp g6(Result,Operation,w4,w5,w6);
endmodule
module tbALU();
reg Binvert, Carryin;
reg [1:0] Operation;
reg [31:0] a,b;
wire [31:0] Result;
wire CarryOut;
ALU a1(a,b,Binvert,Carryin,Operation,Result,CarryOut);
initial
$monitor($time," a=%b b=%b Binvert=%b Carryin=%b Operation=%b CarryOut=%b Result=%b",a,b,Binvert,Carryin,Operation,CarryOut,Result);
initial
begin
a=32'ha5a5a5a5;
b=32'h5a5a5a5a;
Operation=2'b00;
Binvert=1'b0;
Carryin=1'b0; //must perform AND resulting in zero
#100 Operation=2'b01; //OR
#100 Operation=2'b10; //ADD
#100 Binvert=1'b1;//SUB
#200 $finish;
end
endmodule