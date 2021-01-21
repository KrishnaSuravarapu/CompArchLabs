module graycode(a3,a2,a1,a0,b3,b2,b1,b0,o);
	input a3,a2,a1,a0,b3,b2,b1,b0;
	output reg [1:0] o;
	always@(a3 or a2 or a1 or a0 or b3 or b2 or b1 or b0)
	begin
    if(a3>b3) o=10;
    if(a3<b3) o=01;
    if(a3==b3) begin
    if(a2>b2)  o=10;
    if(a2<b2)  o=01;
    if(a2==b2) begin
    if(a1>b1) o=10;
    if(a1<b1) o=01;
    if(a1==b1) begin
    if(a0>b0) o=10;
    if(a0<b0)  o=01;
    if(a0==b0) o=00;
    end
    end
    end
    end
	
endmodule

module testbench;
reg a3,a2,a1,a0,b3,b2,b1,b0;
wire [1:0] out;
graycode g1(a3,a2,a1,a0,b3,b2,b1,b0,out);
initial
begin
$monitor($time," a3=%b ,a2=%b ,a1=%b ,a0=%b ,b3=%b ,b2=%b ,b1=%b ,b0=%b ,out=%2b",a3,a2,a1,a0,b3,b2,b1,b0,out);
#0 a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;b3=1'b0;b2=1'b0;b1=1'b0;b0=1'b0;
#5 a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;b3=1'b1;b2=1'b0;b1=1'b0;b0=1'b0;
#10 a3=1'b0;a2=1'b1;a1=1'b1;a0=1'b1;b3=1'b0;b2=1'b1;b1=1'b1;b0=1'b1;
#15 $finish;
end
endmodule
