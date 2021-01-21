module d_ff(q,d,clk,reset);
input d, reset,clk;
output q;
reg q;
always @ (posedge clk)
begin
if (!reset) q <= 1'b0;
else q <= d;
end
endmodule

module reg_32bit(q,d,clk,reset);
input [31:0] d;
input clk,reset;
output [31:0] q;
genvar i;
generate for (i=0; i<32;i=i+1) begin: some_loop
d_ff dl(q[i],d[i],clk,reset);
end
endgenerate
endmodule
/*
module tb32reg;
reg [31:0] d;
reg clk,reset;
wire [31:0] q;
reg_32bit R(q,d,clk,reset);
always @(clk)
#10 clk<=~clk;
initial
$monitor($time," q=%b d=%b clk=%b reset=%b",q,d,clk,reset);
initial
begin
clk= 1'b1;
reset=1'b0;//reset the register
#20 reset=1'b1;
#20 d=32'hAFAFAFAF;
#80 reset=1'b0;
#100 $finish;
end
endmodule
*/