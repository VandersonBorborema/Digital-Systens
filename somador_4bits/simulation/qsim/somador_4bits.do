onerror {quit -f}
vlib work
vlog -work work somador_4bits.vo
vlog -work work somador_4bits.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.somador_4bits_vlg_vec_tst
vcd file -direction somador_4bits.msim.vcd
vcd add -internal somador_4bits_vlg_vec_tst/*
vcd add -internal somador_4bits_vlg_vec_tst/i1/*
add wave /*
run -all
