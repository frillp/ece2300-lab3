module tffp(RESET, CLK, T, Q);
	input RESET;
	input CLK;
	input T;
	
	output Q;
	
	reg Q;
	
	always @(posedge CLK) begin
		Q <= RESET ? 1'b0 : T ? ~Q : Q;
	end
	
endmodule