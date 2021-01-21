module FADD(a,b,cin,control,sum,cout);
	input a,b,cin,control;
	output cout,sum;
	always@(a or b or cin or control)
		if(control==0) 
		begin 
		sum=(a^(b^control))^cin;
		cout=
		end
		