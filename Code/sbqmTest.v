`timescale 1s/1s
module sbqmTest();

//Inputs drivers
reg Tsensor_start, Tsensor_end, TRESET;
reg [1:0] TTellers_count;

//Output Arguments
wire TFull_flag, TEmpty_flag;
wire [2:0] TPeople_count;
wire [4:0] TWaitTime;

//Design instatiation
SBqM test(
    .SenseIn(Tsensor_start),
    .SenseOut(Tsensor_end),
    .ResetN(TRESET),
    .TellerCount(TTellers_count),
    .FullFlag(TFull_flag),
    .EmptyFlag(TEmpty_flag),
    .PeopleCount(TPeople_count),
    .WaitTime(TWaitTime)
);

//monitoring the inputs and the outputs
initial begin
    $monitor($time, "  Outputs: PeopleCount = %d,  FullFlag = %b,  EmptyFlag = %b
                       Inputs:  TellerCount = %d,   WaitTime = %d,   SenseIn = %b,   SenseOut = %b,  ResetN = %b
                       ", TPeople_count, TFull_flag, TEmpty_flag, TTellers_count, TWaitTime, Tsensor_start, Tsensor_end, TRESET);
end

//Resetting the System
initial begin
    TRESET = 1'b0;
    Tsensor_end = 1'b1;
    Tsensor_start = 1'b1; 
    TTellers_count =2'b01;
    #5;
    TRESET = 1'b1;
end

//Test
integer i=0, j=0, k=0;
initial begin
    for (i = 1; i < 4; i = i + 1) begin           //for all the possible teller count
        TTellers_count = i;
        for (j = 0; j < 9; j = j + 1) begin      //incrementing untill the FullFlag rises
            Tsensor_start   = 1'b1;
            #5;
            Tsensor_start  = 1'b0;
            #5;
            if (TFull_flag) begin
                $display("The queue is full please wait patiently.");  
            end
        end
        Tsensor_start      = 1'b1;
        for (k = 0; k < 9; k = k + 1) begin     //decrementing untill the EmptyFlag rises
            Tsensor_end = 1'b1;
            #5;
            Tsensor_end = 1'b0;
            #5;
            if (TEmpty_flag) begin
            $display("The queue is empty you can enter now.");
            end
        end
        Tsensor_end        = 1'b1;
    end
    Tsensor_start      = 1'b1;
    Tsensor_end        = 1'b1;

    //Special Case when a customer enters at the same time another leaves
    #10;
    Tsensor_start      = 1'b0;
    Tsensor_end        = 1'b0;
    #10;

    //Special Case when a customer enters but stays at the sensor for a long time
    Tsensor_end        = 1'b1;
    Tsensor_start      = 1'b1;
    #10;
    Tsensor_start      = 1'b0;
    #20;

    //Special Case when a customer leaves but stays at the sensor for a long time
    Tsensor_start      = 1'b1;
    Tsensor_end        = 1'b1;
    #10;
    Tsensor_end        = 1'b0;
    #20;
    Tsensor_end        = 1'b1;

end

    

endmodule