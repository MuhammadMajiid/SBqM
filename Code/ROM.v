module ROM(
    input [1:0] TellerCount,
    input [2:0] PeopleCount,
    output reg [4:0] WaitTime
);
reg [4:0] waitrom [31:8];
wire [4:0] addrs;
assign addrs = {TellerCount, PeopleCount};
integer intaddrs=0;


always @(*) begin

    intaddrs = addrs;
    //LUT for Tcount=1 
    waitrom[8]  <= 'd0;  waitrom[9] <= 'd3;    waitrom[10] <= 'd6;
    waitrom[11] <= 'd9;  waitrom[12] <= 'd12;  waitrom[13] <= 'd15;
    waitrom[14] <= 'd18; waitrom[15] <= 'd21;

    //LUT for Tcount=2
    waitrom[16] <= 'd0;  waitrom[17] <= 'd3;   waitrom[18] <= 'd4;
    waitrom[19] <= 'd6;  waitrom[20] <= 'd7;   waitrom[21] <= 'd5;
    waitrom[22] <= 'd10; waitrom[23] <= 'd12;

    //LUT for Tcount=3
    waitrom[24] <= 'd0;  waitrom[25] <= 'd3;   waitrom[26] <= 'd4;
    waitrom[27] <= 'd5;  waitrom[28] <= 'd6;   waitrom[29] <= 'd7;
    waitrom[30] <= 'd8;  waitrom[31] <= 'd9;

    assign WaitTime = waitrom[addrs];

end
endmodule