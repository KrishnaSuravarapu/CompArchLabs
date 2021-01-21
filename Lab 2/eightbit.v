module DECODER(d0,d1,d2,d3,d4,d5,d6,d7,x,y,z);
input x,y,z;
output d0,d1,d2,d3,d4,d5,d6,d7;
wire x0,y0,z0;
not n1(x0,x);
not n2(y0,y);
not n3(z0,z);
and a0(d0,x0,y0,z0);
and a1(d1,x0,y0,z);
and a2(d2,x0,y,z0);
and a3(d3,x0,y,z);
and a4(d4,x,y0,z0);
and a5(d5,x,y0,z);
and a6(d6,x,y,z0);
and a7(d7,x,y,z);
endmodule
module FADDER(s,c,x,y,z);
input x,y,z;
wire d0,d1,d2,d3,d4,d5,d6,d7;
output s,c;
DECODER dec(d0,d1,d2,d3,d4,d5,d6,d7,x,y,z);
assign s = d1 | d2 | d4 | d7,
 c = d3 | d5 | d6 | d7;
endmodule
module EIGHTADDER(x,y,cin,sum,c);
input [0:7] x;
input [0:7] y;
input cin;
output [0:7] sum;
output c;
wire [0:8] z;
or n1(z[0],cin,0);
FADDER f1(sum[7],z[1],x[7],y[7],z[0]);
FADDER f2(sum[6],z[2],x[6],y[6],z[1]);
FADDER f3(sum[5],z[3],x[5],y[5],z[2]);
FADDER f4(sum[4],z[4],x[4],y[4],z[3]);
FADDER f5(sum[3],z[5],x[3],y[3],z[4]);
FADDER f6(sum[2],z[6],x[2],y[2],z[5]);
FADDER f7(sum[1],z[7],x[1],y[1],z[6]);
FADDER f8(sum[0],z[8],x[0],y[0],z[7]);
or o1(c,z[8],0);
endmodule
module THIRTYTWO(x,y,sum,c,cin);
input [0:31] x;
input [0:31] y;
input cin;
output [0:31] sum;
output c;
wire [0:4] z;
or n1(z[0],cin,0);
EIGHTADDER f1(x[24:31],y[24:31],z[0],sum[24:31],z[1]);
EIGHTADDER f2(x[16:23],y[16:23],z[1],sum[16:23],z[2]);
EIGHTADDER f3(x[8:15],y[8:15],z[2],sum[8:15],z[3]);
EIGHTADDER f4(x[0:7],y[0:7],z[3],sum[0:7],z[4]);
or o1(c,z[4],0);
endmodule