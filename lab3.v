module lab3(CLK, RESET, ENABLE, TIME, MIN, TENSEC, SEC, DECISEC, CENTISEC);
  input         CLK;
  input         RESET;
  input         ENABLE;

  output [19:0] TIME;
  output [3:0]  MIN;
  output [3:0]  TENSEC;
  output [3:0]  SEC;
  output [3:0]  DECISEC;
  output [3:0]  CENTISEC;


  // ADD YOUR CODE BELOW THIS LINE
  
  wire [3:0] centisecwire;
  wire [3:0] decisecwire;
  wire [3:0] secwire;
  wire [3:0] tensecwire;
  wire [3:0] minwire;
  
  wire centisecreset;
  wire decisecreset;
  wire secreset;
  wire tensecreset;
  wire minreset;
  
  wire decisecinc;
  wire secinc;
  wire tensecinc;
  wire mininc;
  
  assign centisecreset = ~((CENTISEC == 4'd9) | RESET);
  assign decisecreset = ~((CENTISEC == 4'd9 & DECISEC == 4'd9) | RESET);
  assign secreset = ~((CENTISEC == 4'd9 & DECISEC == 4'd9 & SEC == 4'd9) | RESET);
  assign tensecreset = ~((CENTISEC == 4'd9 & DECISEC == 4'd9 & SEC == 4'd9 & TENSEC == 3'd5) | RESET);
  assign minreset = ~((CENTISEC == 4'd9 & DECISEC == 4'd9 & SEC == 4'd9 & TENSEC == 3'd5 & MIN == 4'd9) | RESET);
	
  assign decisecinc = CENTISEC == 4'd9;
  assign secinc = CENTISEC == 4'd9 & DECISEC == 4'd9;
  assign tensecinc = CENTISEC == 4'd9 & DECISEC == 4'd9 & SEC == 4'd9;
  assign mininc = CENTISEC == 4'd9 & DECISEC == 4'd9 & SEC == 4'd9 & TENSEC == 3'd5;
  
  
  tcounter centicounter (
	 .CLR(centisecreset),
	 .ENP(ENABLE),
	 .ENT(1'b1),
	 .CLK(CLK),
	 .Q(CENTISEC)
  );
  
  tcounter decicounter (
	 .CLR(decisecreset),
	 .ENP(ENABLE),
	 .ENT(decisecinc),
	 .CLK(CLK),
	 .Q(DECISEC)
  );
  
  tcounter seccounter (
	 .CLR(secreset),
	 .ENP(ENABLE),
	 .ENT(secinc),
	 .CLK(CLK),
	 .Q(SEC)
  );
  
  tcounter tencounter (
	 .CLR(tensecreset),
	 .ENP(ENABLE),
	 .ENT(tensecinc),
	 .CLK(CLK),
	 .Q(TENSEC)
  );
  
  tcounter mincounter (
	 .CLR(minreset),
	 .ENP(ENABLE),
	 .ENT(mininc),
	 .CLK(CLK),
	 .Q(MIN)
  );

  // ADD YOUR CODE ABOVE THIS LINE

  assign TIME = {MIN, TENSEC, SEC, DECISEC, CENTISEC};

endmodule
