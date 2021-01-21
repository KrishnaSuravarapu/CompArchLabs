module 16to1mux(out,sel);
input [3:0] sel;
output [8:0] out;
// wire [3:0] sel;
// wire [8:0] out;
assign out =5'd25*(sel[3:0]);
endmodule
module testbench();
reg [3:0] sel;
wire [8:0] out;
16to1mux n1(out,sel);
initial
begin
$monitor($time,"out=%d in=%d sel=%b \n",out,sel,sel);
#5 sel=4'b0000;
#5 sel=4'b0001;
#5 sel=4'b0010;
#5 sel=4'b0011;
#5 sel=4'b0100;
end
endmodule



