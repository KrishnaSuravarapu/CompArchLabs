module testbench;
 reg [0:31] x;
 reg [0:31] y;
 reg cin;
 wire [0:31] sum;
 wire c;
 THIRTYTWO ex(x,y,sum,c,cin);
 initial
 $monitor($time,"x=%b,y=%b,sum=%b,c=%b,cin=%b",x,y,sum,c,cin);
 initial
 begin
 #0 x=32'b00000000111111110000000011111111;y=32'b11111111000000001111111100000000;cin=1'b0;
 #32 x=32'b00000000000000000000000000000000;y=32'b11111111111111111111111111111111;cin=1'b0;
 end
endmodule
