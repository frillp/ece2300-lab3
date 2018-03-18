module treg4bit(CLK, RESET, IN, OUT);
	input				CLK;
	input				RESET;
	input	 [3:0]	IN;
	
	output [3:0]	OUT;
	
	tffp tffp0 (
		.CLK(CLK),
		.RESET(RESET),
		.T(IN[0]),
		.Q(OUT[0])
	);
	
	tffp tffp1 (
		.CLK(CLK),
		.RESET(RESET),
		.T(IN[1]),
		.Q(OUT[1])
	);
	
	tffp tffp2 (
		.CLK(CLK),
		.RESET(RESET),
		.T(IN[2]),
		.Q(OUT[2])
	);
	
	tffp tffp3 (
		.CLK(CLK),
		.RESET(RESET),
		.T(IN[3]),
		.Q(OUT[3])
	);
	
endmodule