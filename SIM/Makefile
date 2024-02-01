verb = UVM_HIGH

allc: clean init compile runc

all: clean init compile run

clean:
	rm -rf transcript vsim.wlf work compile.log 

init:
	vlib work;

compile: clean init
	vlog -l compile.log -work work +incdir+/cadtools/questa/questa_sim/verilog_src/uvm-1.1b/src +incdir+../lib +define+RVFI ../DV/ibex_dv_pkg.sv  ../rtl/ibex_core_pkg.sv  ../rtl/ibex_top.sv ../DV/core_ibex_tb_top.sv
	

#	vlog \
#	-l compile.log \
#	-work work \
#	+incdir+/cadtools/questa/questa_sim/verilog_src/uvm-1.1b/src \
#	+incdir+../lib \
#	+incdir+../rtl \
#	../rtl/ibex_top.sv ; 

runc: clean init compile
	vsim -lic_noqueue -c -l $t.log  -do "coverage save -onexit vsim.ucdb;run 1ms;exit" \
	+UVM_VERBOSITY=$(verb) \
	-voptargs="+acc" core_ibex_tb_top;

run: clean init compile
	vsim -do wave.do -l  $t.log \
	+UVM_VERBOSITY=$(verb) \
	-voptargs="+acc" core_ibex_tb_top;

runnew: compile
	vsim -lic_noqueue -c -l $t.log -t 1ps -suppress 3601 -suppress 8186 -do "coverage save -onexit vsim.ucdb;run 1ms;exit" \
	+UVM_VERBOSITY=$(verb) \
	+UVM_TESTNAME=core_ibex_base_test \
	+bin="../DV/bin.txt" \
	-voptargs="+acc" core_ibex_tb_top;

runtest: compile
	vsim -lic_noqueue -c -l $t.log -t 1ps -voptargs="+acc" -suppress 3601 -suppress 8186 \
	+UVM_VERBOSITY=$(verb) \
	+UVM_TESTNAME=core_ibex_base_test \
	+bin="../DV/bin.txt" \
        -do "coverage save -onexit vsim.ucdb; -wlf vsim.wlf;add wave sim:/core_ibex_tb_top/ibex_top_tracing/*;run -all" \
	core_ibex_tb_top;
        
runtestnew: compile
	vsim -cvgperinstance -debugDB -c -l $t.log -t 1ps -voptargs="+acc" -coverage -voptargs="+cover=all" -suppress 3601 -suppress 8186 \
	-do wave.do \
	+UVM_VERBOSITY=$(verb) \
	+UVM_TESTNAME=core_ibex_base_test \
	+bin="../DV/bin.txt" \
        -do "coverage save -onexit vsim.ucdb; -wlf vsim.wlf;add wave sim:/core_ibex_tb_top/ibex_top_tracing/*;run -all" \
	core_ibex_tb_top;
        
runtestnew1: compile
	vsim -l $t.log -suppress 3601 -suppress 8186 \
	+UVM_VERBOSITY=$(verb) \
	+UVM_TESTNAME=core_ibex_base_test \
	+bin="../DV/bin.txt" \
	-voptargs="+acc" core_ibex_tb_top -do coverage save -onexit vsim.ucdb;
        
newruntest: compile
	vsim -wlf vsim.wlf -lic_noqueue -l vsim.log -t 1ps -suppress 3601 -suppress 8186 -do "coverage save -onexit vsim.ucdb;add wave -position insertpoint sim:/core_ibex_tb_top/dut/*;run -all;exit" \
	+UVM_VERBOSITY=UVM_FULL \
	+UVM_TESTNAME=core_ibex_base_test \
	+bin="../DV/bin.bin" \
	-voptargs="+acc" core_ibex_tb_top;

