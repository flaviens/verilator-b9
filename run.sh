# Verilator
rm -rf obj_dir_traces && mkdir -p obj_dir_traces
verilator --cc --exe --trace --Wno-UNOPTFLAT -Wno-WIDTHTRUNC --build tb_base.cc top.sv -CFLAGS '-I.. -g' --Mdir obj_dir_traces --build-jobs 32

rm -rf obj_dir_notrace && mkdir -p obj_dir_notrace
verilator --cc --exe --Wno-UNOPTFLAT -Wno-WIDTHTRUNC --build tb_base.cc top.sv -CFLAGS '-I.. -g' --Mdir obj_dir_notrace --build-jobs 32

TRACEFILE=trace.vcd ./obj_dir_traces/Vtop
TRACEFILE=trace.vcd ./obj_dir_notrace/Vtop
