transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3 {C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3/treg4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3 {C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3/tffp.v}

vlog -vlog01compat -work work +incdir+C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3 {C:/Users/frill/Documents/misc_sem2/ece2300_labs/lab3/lab3/treg4bit_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  treg4bit_test

add wave *
view structure
view signals
run -all
