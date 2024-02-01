`ifndef IBEX_CORE_PKG
`define IBEX_CORE_PKG
`include "ibex_pkg.sv"

//package ibex_core_pkg;
	//`ifdef RISCV_FORMAL
//  `define RVFI
//`endif
//import ibex_pkg::*;
`include "ibex_alu.sv"
`include "ibex_compressed_decoder.sv"
`include "ibex_controller.sv"
`include "ibex_counter.sv"
`include "ibex_cs_registers.sv"
`include "ibex_decoder.sv"
`include "ibex_ex_block.sv"
`include "ibex_id_stage.sv"
`include "ibex_if_stage.sv"
`include "ibex_load_store_unit.sv"
`include "ibex_multdiv_slow.sv"
`include "ibex_multdiv_fast.sv"
`include "ibex_fetch_fifo.sv"
`include "ibex_register_file_ff.sv"
`include "ibex_register_file_ff.sv"
`include "ibex_register_file_ff.sv"
`include "ibex_register_file_ff.sv"
`include "ibex_register_file_ff.sv"
`include "ibex_wb_stage.sv"
`include "prim_ram_1p_pkg.sv"
`include "prim_clock_gating.v"
`include "prim_generic_buf.sv"
`include "prim_buf.sv"
`include "core_ibex_fcov_if.sv"
`include "ibex_core.sv"
`include "ibex_tracer_pkg.sv"
`include "ibex_tracer.sv"
`include "ibex_top_tracing.sv"

//endpackage
`endif
