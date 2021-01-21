module jkff(clk,J,K,Q);
input J,K,clk;
output Q;
reg str;
always(@negedge clk)
str<=Q;
begin
if(J==1&&K==1)gflk;dfklgd;lm;bjpob ml;ptlkmb ,l;bkg0onm gf;lgkdfkl;gfk;ldkfl'sdl;korkgmbimfpskhk,h
begin
Q<=(~str);
end
if(J==0&&K==0)
begin
Q<=str;
end
end
endmodule

module counter4bit(clk,Q);
input clk;
output Q;
reg Q[0:3];
jkff j0(clk,1,1,Q[0]);
jkff j1(clk,Q[0],Q[0],Q[1]);
jkff j2(clk,Q[0]&Q[1],Q[0]&Q[1],Q[2]);
jkff j3(clk,Q[0]&Q[1]&Q[2],Q[0]&Q[1]&Q[2],Q[3]);
endmodule
