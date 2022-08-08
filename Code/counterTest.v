module counterTest
();
reg TsensFront, TsensBack, Trst;
wire Tfullflag, Temptyflag;
wire [2:0] out;
UDCfsm test(
    .sens_front(TsensFront),
    .sens_back(TsensBack),
    .rst(Trst),
    .fflag(Tfullflag),
    .eflag(Temptyflag),
    .p_count(out)
);
initial begin
    Trst = 1'b0; // Empty Flag =1 , pcount =0
    TsensBack = 1'b1;
    TsensFront = 1'b1; 
    #5
    Trst = 1'b1; 
    TsensBack = 1'b1;
    TsensFront = 1'b1; // stays at zero displaying message that system is ready
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 1
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 2
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 3
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 4
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 5
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 6
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount increments by 1 becomes => 7
    #5
    TsensFront = 1'b1;
    #5
    TsensFront = 1'b0; // pcount stays at 7 with warning message and Full Flag = 1
    #5
    TsensFront = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 6
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 5
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 4
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 3
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 2
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 1
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount decrements by 1 becomes => 0
    #5
    TsensBack = 1'b1;
    #5
    TsensBack = 1'b0; // pcount stays at 0, pops up mesaage indicates that the queue is empty, Empty flag=1 
    #5
    Trst = 1'b0; //resets the system again > Pcount=0, full flag=0, empty flag=1

end
endmodule