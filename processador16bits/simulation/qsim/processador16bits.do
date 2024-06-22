onerror {quit -f}
vlib work
vlog -work work processador16bits.vo
vlog -work work processador16bits.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.processador16bits_vlg_vec_tst
vcd file -direction processador16bits.msim.vcd
vcd add -internal processador16bits_vlg_vec_tst/*
vcd add -internal processador16bits_vlg_vec_tst/i1/*
add wave /*
run -all
