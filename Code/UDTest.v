//  This module is created by Mohamed Maged
//  ECE student, Alexandria University
//  TestBench for an Up-Down counter for the SBQM project with queue for 7 People

module UDTest();

//input regs
reg Up, Down, ResetN;

//output wire
wire FullFlag, EmptyFlag;
wire [2:0] Count;

//Instance of the design module
UDCounter ForTest(
    .Up(Up),
    .Down(Down),
    .ResetN(ResetN),
    .FullFlag(FullFlag),
    .EmptyFlag(EmptyFlag),
    .Count(Count)
);

//monitoring the inputs and the outputs
initial begin
    $monitor($time, "  Outputs: Count = %d,  FullFlag = %b,  EmptyFlag = %b
                       Inputs:  Up = %b,   Down = %b,  ResetN = %b
                       ", Count, FullFlag, EmptyFlag, Up, Down, ResetN);
end

//Resetting the System
initial begin
    ResetN   = 1'b0;
    #10;
    ResetN   = 1'b1;
end

//initialization
initial begin
    Up      = 1'b1;
    Down    = 1'b1;
end

//Test
integer i=0, j=0;
initial begin
    for (i = 0; i < 9; i = i + 1) begin            //incrementing untill the FullFlag rises
        Up   = 1'b1;
        #5;
        Up  = 1'b0;
        #5;
        if (FullFlag) begin
            $display("The queue is full please wait patiently.");  
        end
    end
    Up      = 1'b1;

    for (j = 0; j < 9; j = j + 1) begin            //decrementing untill the EmptyFlag rises
        Down = 1'b1;
        #5;
        Down = 1'b0;
        #5;
        if (EmptyFlag) begin
            $display("The queue is empty you can enter now.");  
        end
    end
    Down    = 1'b1;

    //Special Case when a customer enters at the same time another leaves
    #10;
    Up      = 1'b0;
    Down    = 1'b0;
    #10;

    //Special Case when a customer enters but stays at the sensor for a long time
    Down    = 1'b1;
    Up      = 1'b1;
    #10;
    Up      = 1'b0;
    #20;

    //Special Case when a customer leaves but stays at the sensor for a long time
    Up      = 1'b1;
    Down    = 1'b1;
    #10;
    Down    = 1'b0;
    #20;
end

endmodule