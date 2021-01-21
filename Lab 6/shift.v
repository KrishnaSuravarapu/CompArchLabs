module shift(out,in);
input [27:0] in;
output [27:0] out;
genvar i;
or o3(out[0],0,0);
or o4(out[1],0,0);
generate for (i=0; i<26;i=i+1) begin: some_loop
or o1(out[i+2],in[i],0);
end
endgenerate
endmodule
/*
module muximonitor;
reg [27:0] in;
wire [27:0] out;
shift S1(out,in);
initial
$monitor($time," out=%b in=%b ",out,in);
initial
begin
#20 in=28'h000AFAF;
#40 in=28'h1111111;
#60 $finish;
end
endmodule
*/
