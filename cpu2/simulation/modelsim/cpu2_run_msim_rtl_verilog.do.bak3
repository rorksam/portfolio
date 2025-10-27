transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/csc178/projects/cpu2/src {/home/csc178/projects/cpu2/src/RAM.v}
vlog -vlog01compat -work work +incdir+/home/csc178/projects/cpu2/src {/home/csc178/projects/cpu2/src/Ctrl.v}
vlog -vlog01compat -work work +incdir+/home/csc178/projects/cpu2/src {/home/csc178/projects/cpu2/src/CPU.v}
vlog -vlog01compat -work work +incdir+/home/csc178/projects/cpu2/src {/home/csc178/projects/cpu2/src/ALU.v}

vlog -vlog01compat -work work +incdir+/home/csc178/projects/cpu2/src {/home/csc178/projects/cpu2/src/CPU_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  CPU_tb

add wave *
view structure
view signals
run -all
