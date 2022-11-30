//--------------------------------------------------------
//ALU Design Version 1.0
//--------------------------------------------------------


/* 
ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
*/



//--------------------------------------------------------
// NOTE TO A VERIFICATION ENGINEER:
//
// AS A VERIFICATION ENGINEER, ONE SHOULD NEVER PEEK INTO
// DESIGN AND TRY TO REVERSE ENGINEER WHAT'S HAPPENING.
// JUST FOCUS ON GIVEN SPEC AND BUILD YOUR TESTBENCH ACCORDINGLY.
//--------------------------------------------------------








module alu(
  input clock,
  input reset,
  input [7:0] A,B,  // ALU 8-bit Inputs                 
  input [3:0] ALU_Sel,// ALU Selection
  output reg [7:0] ALU_Out, // ALU 8-bit Output
  output bit CarryOut // Carry Out Flag
);

  reg [7:0] ALU_Result;
  wire [8:0] tmp;

  assign tmp = {1'b0,A} + {1'b0,B};

  
  always @(posedge clock or posedge reset) begin
    if(reset) begin
      ALU_Out  <= 8'd0;
      CarryOut <= 1'd0;
    end
    else begin
      ALU_Out <= ALU_Result;
      CarryOut <= tmp[8];
    end
  end


  always @(*) //introduce a bug here, A B sensitivity only, change ALU_Sel during
    begin
      case(ALU_Sel)
        4'b0000: // Addition
          ALU_Result = A + B ; 
        4'b0001: // Subtraction
          ALU_Result = A - B ;
        4'b0010: // Multiplication
          ALU_Result = A * B;
        4'b0011: // Division
          ALU_Result = A/B;
        default: ALU_Result = 8'hAC ; // Give out random BAD value
      endcase
    end

endmodule