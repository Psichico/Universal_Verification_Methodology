//Object class


class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)

  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------
  rand logic reset;
  rand logic [7:0] a, b;
  rand logic [3:0] op_code;
  
  logic [7:0] result; //output
  bit carry_out; // output

  //--------------------------------------------------------
  //Default Constraints
  //--------------------------------------------------------
  constraint input1_c {a inside {[10:20]};}
  constraint input2_c {b inside {[1:10]};}
  constraint op_code_c {op_code inside {0,1,2,3};}
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "alu_sequence_item");
    super.new(name);

  endfunction: new

endclass: alu_sequence_item