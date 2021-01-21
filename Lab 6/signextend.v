module signextend(out,in);
input [15:0] in;
output [31:0] out;
genvar i;
generate for (i=0; i<16;i=i+1) begin: some_loop
or o1(out[i],in[i],0);
end
endgenerate
wire w1;
or oe(w1,in[15],0);
genvar j;
generate for (j=16; j<31;j=j+1) begin: new_loop
or o3(out[j],w1,0);
end
endgenerate
endmodule
/*
module muxmonitor;
reg [15:0] in;
wire [31:0] out;
signextend S1(out,in);
initial
$monitor($time," out=%b in=%b ",out,in);
initial
begin
#20 in=16'hAFAF;
#40 in=16'h1111;
#60 $finish;
end
endmodule
