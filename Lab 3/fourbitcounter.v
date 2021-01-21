module counter(EN,CLK,Q);
parameter n = 4;
input EN;
input CLK;
output [n-1:0] Q;
reg [n-1:0] Q;
