module FA_dataflow (Cout, Sum,In1,In2,Cin);
 input [31:0] In1,In2;
 input Cin;
 output Cout;
 output [31:0] Sum;
 assign {Cout,Sum}=In1+In2+Cin;
endmodule
/*
module tb32bitor;
 reg [31:0] In1,In2;
 reg Cin;
 wire [31:0] out;
 wire Cout;
 FA_dataflow f1(Cout,out,In1,In2,Cin);
 initial
 $monitor($time," Cout=%b In1=%b In2=%b Cin=%b out=%b",Cout,In1,In2,Cin,out);
 initial
 begin
 In1=32'hffff;
 In2=32'h8000;
 Cin=1'b1;
 #100 Cin=1'b0;;
 #400 $finish;
 end
endmodule
*/