

interface alu_interface(input logic clock);

  logic reset;

  logic [7:0] a, b;
  logic [3:0] op_code;
  logic [7:0] result;
  bit carry_out;

endinterface: alu_interface