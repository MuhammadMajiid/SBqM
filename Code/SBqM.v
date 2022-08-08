`timescale 1s/1s
module SBqM
(
    input sensor_start, sensor_end, RESET,
    input [1:0] Tellers_count,
    output Full_flag, Empty_flag,
    output [2:0] People_count=0 ,
    output [4:0] WaitTime
);

UDCfsm counter_gate(.sens_front(sensor_start), .sens_back(sensor_end), .rst(RESET), .fflag(Full_flag), .eflag(Empty_flag), .p_count(People_count));

ROM LUT(.TC(Tellers_count), .PC(People_count), .Wtime(WaitTime));

endmodule