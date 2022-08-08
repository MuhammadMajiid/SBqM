`timescale 1s/1s
module sbqmTest
();
reg Tsensor_start, Tsensor_end, TRESET;
reg [1:0] TTellers_count;
wire TFull_flag, TEmpty_flag;
wire [2:0] TPeople_count;
wire [4:0] TWaitTime;

SBqM test(
    .sensor_start(Tsensor_start),
    .sensor_end(Tsensor_end),
    .RESET(TRESET),
    .Tellers_count(TTellers_count),
    .Full_flag(TFull_flag),
    .Empty_flag(TEmpty_flag),
    .People_count(TPeople_count),
    .WaitTime(TWaitTime)
);
initial begin
    TRESET = 1'b0; // Empty Flag =1 , pcount =0
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1; 
    TTellers_count =2'b00;

    //all possible values in case of Tcount= 01 (1)

    #5
    TRESET = 1'b1;
    TTellers_count = 2'b01;
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1; // stays at zero displaying message that system is ready
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 2
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 3
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 4
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 5
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 6
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 7
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount stays at 7 with warning message and Full Flag = 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 6
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 5
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 4
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 3
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 2
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 1
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 0
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount stays at 0, pops up mesaage indicates that the queue is empty, Empty flag=1 
    #5
    TRESET = 1'b0; //resets the system again > Pcount=0, full flag=0, empty flag=1
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1;
    #5

    //all possible values in case of Tcount= 10 (2)

    TRESET = 1'b1;
    TTellers_count = 2'b10;
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1; // stays at zero displaying message that system is ready
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 2
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 3
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 4
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 5
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 6
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 7
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount stays at 7 with warning message and Full Flag = 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 6
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 5
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 4
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 3
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 2
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 1
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 0
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount stays at 0, pops up mesaage indicates that the queue is empty, Empty flag=1 
    #5
    TRESET = 1'b0; //resets the system again > Pcount=0, full flag=0, empty flag=1
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1;
    #5

    //all possible values in case of Tcount= 11 (3)

    TRESET = 1'b1;
    TTellers_count = 2'b11;
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1; // stays at zero displaying message that system is ready
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 2
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 3
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 4
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 5
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 6
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount increments by 1 becomes => 7
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_start = 1'b0; // pcount stays at 7 with warning message and Full Flag = 1
    #5
    Tsensor_start = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 6
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 5
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 4
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 3
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 2
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 1
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount decrements by 1 becomes => 0
    #5
    Tsensor_end = 1'b1;
    #5
    Tsensor_end = 1'b0; // pcount stays at 0, pops up mesaage indicates that the queue is empty, Empty flag=1 
    #5
    TRESET = 1'b0; //resets the system again > Pcount=0, full flag=0, empty flag=1

end
    

endmodule