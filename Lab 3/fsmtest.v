module mealy_test;
reg clk, rst, inp;
wire outp;
reg[15:0] sequence;
integer i;
fsm duty( clk, rst, inp, outp);
initial
begin
clk = 0;
rst = 1;
sequence = 16'b0011_0110_1111_0010;
#5 rst = 0;
for( i = 0; i <= 15; i = i + 1)
begin
inp = sequence[i];
#2 clk = 1;
#2 clk = 0;
$display("State = ", duty.state, " Input = ", inp, ", Output = ",outp);
end
end
endmodule
