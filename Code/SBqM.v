`timescale 1s/1s
module SBqM
(
    input SenseIn, SenseOut, ResetN,
    input [1:0] TellerCount,
    output FullFlag, EmptyFlag,
    output [2:0] PeopleCount,
    output [4:0] WaitTime
);

UDCounter CounterGate(.Up(SenseIn), .Down(SenseOut), .ResetN(ResetN),                //inputs
                    .FullFlag(FullFlag), .EmptyFlag(EmptyFlag), .Count(PeopleCount)   //outputs
);

ROM LUT(.TellerCount(TellerCount), .PeopleCount(PeopleCount),                               //inputs
        .WaitTime(WaitTime)                                                                 //output
);

endmodule