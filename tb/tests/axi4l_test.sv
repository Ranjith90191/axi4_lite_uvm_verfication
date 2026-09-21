`include "uvm_macros.svh"
import uvm_pkg::*;

class axi4l_base_test extends uvm_test;
  `uvm_component_utils(axi4l_base_test)
  axi4l_env env;
  function new(string name = "axi4l_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = axi4l_env::type_id::create("env", this);
  endfunction
endclass

class wr_rw_access_test extends axi4l_base_test;
  `uvm_component_utils(wr_rw_access_test)
  function new(string name = "wr_rw_access_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    wr_rw_access_seq seq;
    phase.raise_objection(this);
    seq = wr_rw_access_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class wr_wo_access_test extends axi4l_base_test;
  `uvm_component_utils(wr_wo_access_test)
  function new(string name = "wr_wo_access_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    wr_wo_access_seq seq;
    phase.raise_objection(this);
    seq = wr_wo_access_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class wr_special_addr_test extends axi4l_base_test;
  `uvm_component_utils(wr_special_addr_test)
  function new(string name = "wr_special_addr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    wr_special_addr_seq seq;
    phase.raise_objection(this);
    seq = wr_special_addr_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class write_read_only_test extends axi4l_base_test;
  `uvm_component_utils(write_read_only_test)
  function new(string name = "write_read_only_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    write_read_only_seq seq;
    phase.raise_objection(this);
    seq = write_read_only_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class invalid_write_test extends axi4l_base_test;
  `uvm_component_utils(invalid_write_test)
  function new(string name = "invalid_write_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    invalid_write_seq seq;
    phase.raise_objection(this);
    seq = invalid_write_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class unaligned_write_test extends axi4l_base_test;
  `uvm_component_utils(unaligned_write_test)
  function new(string name = "unaligned_write_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    unaligned_write_seq seq;
    phase.raise_objection(this);
    seq = unaligned_write_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class rd_sequence_test extends axi4l_base_test;
  `uvm_component_utils(rd_sequence_test)
  function new(string name = "rd_sequence_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rd_sequence seq;
    phase.raise_objection(this);
    seq = rd_sequence::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class rd_ro_access_test extends axi4l_base_test;
  `uvm_component_utils(rd_ro_access_test)
  function new(string name = "rd_ro_access_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rd_ro_access_seq seq;
    phase.raise_objection(this);
    seq = rd_ro_access_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class rd_special_addr_test extends axi4l_base_test;
  `uvm_component_utils(rd_special_addr_test)
  function new(string name = "rd_special_addr_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rd_special_addr_seq seq;
    phase.raise_objection(this);
    seq = rd_special_addr_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class read_write_only_test extends axi4l_base_test;
  `uvm_component_utils(read_write_only_test)
  function new(string name = "read_write_only_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    read_write_only_seq seq;
    phase.raise_objection(this);
    seq = read_write_only_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class invalid_read_test extends axi4l_base_test;
  `uvm_component_utils(invalid_read_test)
  function new(string name = "invalid_read_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    invalid_read_seq seq;
    phase.raise_objection(this);
    seq = invalid_read_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class unaligned_read_test extends axi4l_base_test;
  `uvm_component_utils(unaligned_read_test)
  function new(string name = "unaligned_read_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    unaligned_read_seq seq;
    phase.raise_objection(this);
    seq = unaligned_read_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class aw_before_w_test extends axi4l_base_test;
  `uvm_component_utils(aw_before_w_test)
  function new(string name = "aw_before_w_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    aw_before_w_seq seq;
    phase.raise_objection(this);
    seq = aw_before_w_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class aw_addr_retain_test extends axi4l_base_test;
  `uvm_component_utils(aw_addr_retain_test)
  function new(string name = "aw_addr_retain_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    aw_addr_retain_seq seq;
    phase.raise_objection(this);
    seq = aw_addr_retain_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class w_before_aw_test extends axi4l_base_test;
  `uvm_component_utils(w_before_aw_test)
  function new(string name = "w_before_aw_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    w_before_aw_seq seq;
    phase.raise_objection(this);
    seq = w_before_aw_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class w_data_retain_test extends axi4l_base_test;
  `uvm_component_utils(w_data_retain_test)
  function new(string name = "w_data_retain_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    w_data_retain_seq seq;
    phase.raise_objection(this);
    seq = w_data_retain_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class aw_w_same_cycle_test extends axi4l_base_test;
  `uvm_component_utils(aw_w_same_cycle_test)
  function new(string name = "aw_w_same_cycle_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    aw_w_same_cycle_seq seq;
    phase.raise_objection(this);
    seq = aw_w_same_cycle_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class backpressure_sequence_test extends axi4l_base_test;
  `uvm_component_utils(backpressure_sequence_test)
  function new(string name = "backpressure_sequence_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    backpressure_sequence seq;
    phase.raise_objection(this);
    seq = backpressure_sequence::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class bp_r_test extends axi4l_base_test;
  `uvm_component_utils(bp_r_test)
  function new(string name = "bp_r_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    bp_r_seq seq;
    phase.raise_objection(this);
    seq = bp_r_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class simultaneous_read_write_test extends axi4l_base_test;
  `uvm_component_utils(simultaneous_read_write_test)
  function new(string name = "simultaneous_read_write_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    simultaneous_read_write_seq seq;
    phase.raise_objection(this);
    seq = simultaneous_read_write_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class con_br_independent_test extends axi4l_base_test;
  `uvm_component_utils(con_br_independent_test)
  function new(string name = "con_br_independent_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    con_br_independent_seq seq;
    phase.raise_objection(this);
    seq = con_br_independent_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass

class axi_random_test extends axi4l_base_test;
  `uvm_component_utils(axi_random_test)
  function new(string name = "axi_random_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    axi_random_seq seq;
    phase.raise_objection(this);
    seq = axi_random_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #20000;
    phase.drop_objection(this);
  endtask
endclass

class rand_awprot_test extends axi4l_base_test;
  `uvm_component_utils(rand_awprot_test)
  function new(string name = "rand_awprot_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rand_awprot_seq seq;
    phase.raise_objection(this);
    seq = rand_awprot_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #5000;
    phase.drop_objection(this);
  endtask
endclass

class rand_arprot_test extends axi4l_base_test;
  `uvm_component_utils(rand_arprot_test)
  function new(string name = "rand_arprot_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rand_arprot_seq seq;
    phase.raise_objection(this);
    seq = rand_arprot_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #5000;
    phase.drop_objection(this);
  endtask
endclass

class rand_wdata_wstrb_test extends axi4l_base_test;
  `uvm_component_utils(rand_wdata_wstrb_test)
  function new(string name = "rand_wdata_wstrb_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    rand_wdata_wstrb_seq seq;
    phase.raise_objection(this);
    seq = rand_wdata_wstrb_seq::type_id::create("seq");
    seq.start(env.agt.sqr);
    #5000;
    phase.drop_objection(this);
  endtask
endclass

class bug_03_reproduce extends axi4l_base_test;
  `uvm_component_utils(bug_03_reproduce)
  function new(string name = "bug_03_reproduce",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    dec_err seq1;
    read_all_after_dec_err seq2;
    seq1 = dec_err::type_id::create("seq1");
    seq2 = read_all_after_dec_err::type_id::create("seq2");
    phase.raise_objection(this);
      seq1.start(env.agt.sqr);
      #5000;
      seq2.start(env.agt.sqr);
      #5000;
    phase.drop_objection(this);
  endtask
endclass

class decode_err extends axi4l_base_test;
  `uvm_component_utils(decode_err)
  function new(string name = "decode_err",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  virtual task run_phase(uvm_phase phase);
    dec_err seq1;
    seq1 = dec_err::type_id::create("seq1");
    phase.raise_objection(this);
      seq1.start(env.agt.sqr);
    phase.drop_objection(this);
  endtask
endclass
