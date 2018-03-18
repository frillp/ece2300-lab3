module tcounter(CLK, CLR, ENP, ENT, Q);
	input CLK;
	input CLR;
	input ENP;
	input ENT;
	
	output [3:0] Q;	

	wire [3:0] holder;
	
	assign holder[0] = (ENP & ENT) ? 1'b1 : 1'b0; 
	assign holder[1] = (ENP & ENT & Q[0]) ? 1'b1 : 1'b0;
	assign holder[2] = (ENP & ENT & Q[0] & Q[1]) ? 1'b1 : 1'b0;
	assign holder[3] = (ENP & ENT & Q[0] & Q[1] & Q[2]) ? 1'b1 : 1'b0;
	
	
	treg4bit register (
		.CLK(CLK),
		.RESET(~CLR),
		.IN(holder),
		.OUT(Q)
	);
	
endmodule