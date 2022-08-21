//  Created by Mohamed Maged
//  ECE student, Alexandria University
//  RTL design for a 3-bit Up-Down counter 

module UDCounter(
    input   Up, Down, ResetN,
    output  FullFlag, EmptyFlag,
    output  [2:0] Count
);
//internals
reg [2:0] NextValue, SystemCases;

localparam Idle        = 3'b000,
           FirstCase   = 3'b001,
           SecondCase  = 3'b010,
           ThirdCase   = 3'b011,
           FourthCase  = 3'b100,
           FifthCase   = 3'b101,
           SixthCase   = 3'b110,
           SeventhCase = 3'b111;

//Cases
always @(*) begin
  case (SystemCases)
    Idle : begin
      NextValue     <= 3'd0;
    end

    FirstCase : begin
      NextValue     <= 3'd1;
    end

    SecondCase : begin
      NextValue     <= 3'd2;
    end

    ThirdCase : begin
      NextValue     <= 3'd3;
    end

    FourthCase : begin
      NextValue     <= 3'd4;
    end

    FifthCase : begin
      NextValue     <= 3'd5;
    end

    SixthCase : begin
      NextValue     <= 3'd6;
    end

    SeventhCase : begin
      NextValue     <= 3'd7;
    end

    default: begin
      NextValue     <= 3'd0;
    end
  endcase
end

//Counter FSM
always @(negedge ResetN, negedge Up, negedge Down) begin
  if(~ResetN) begin
    SystemCases     <= Idle;
  end
  else begin
    if ((~Up) && (~Down)) begin
      SystemCases <= SystemCases;
    end
    else if (~Up) begin
      if (FullFlag) begin
        SystemCases <= SeventhCase;
      end 
      else begin
        case (SystemCases)
          Idle : begin
            SystemCases <= FirstCase;
          end

          FirstCase : begin
            SystemCases <= SecondCase;
          end

          SecondCase : begin
            SystemCases <= ThirdCase;
          end

          ThirdCase : begin
            SystemCases <= FourthCase;
          end

          FourthCase : begin
            SystemCases <= FifthCase;
          end

          FifthCase : begin
            SystemCases <= SixthCase;
          end

          SixthCase : begin
            SystemCases <= SeventhCase;
          end

          SeventhCase : begin
            SystemCases <= SeventhCase;
          end
       endcase
      end
    end
    else if(~Down) begin
      if (EmptyFlag) begin
        SystemCases <= Idle;
      end
      else begin
        case (SystemCases)
          SeventhCase : begin
            SystemCases <= SixthCase;
          end

          SixthCase : begin
            SystemCases <= FifthCase;
          end

          FifthCase : begin
            SystemCases <= FourthCase;
          end

          FourthCase : begin
            SystemCases <= ThirdCase;
          end

          ThirdCase : begin
            SystemCases <= SecondCase;
          end

          SecondCase : begin
            SystemCases <= FirstCase;
          end

          FirstCase : begin
            SystemCases <= Idle;
          end

          Idle : begin
            SystemCases <= Idle;
          end
        endcase
      end
    end
    else begin
      SystemCases <= SystemCases;
    end
  end
end

//Assignning the flags
assign FullFlag   = (&NextValue)? 1'b1 : 1'b0;
assign EmptyFlag  = (|NextValue)? 1'b0 : 1'b1;

//Assignning the output
assign Count      = NextValue;

endmodule