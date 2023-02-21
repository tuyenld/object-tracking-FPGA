# Legal Notice: (C)2015 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_internal_jtag|tckutap}
#set_clock_groups -asynchronous -group {altera_internal_jtag|tckutap}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	t_vga_v1_cpu_v1 	t_vga_v1_cpu_v1:*
set 	t_vga_v1_cpu_v1_oci 	t_vga_v1_cpu_v1_nios2_oci:the_t_vga_v1_cpu_v1_nios2_oci
set 	t_vga_v1_cpu_v1_oci_break 	t_vga_v1_cpu_v1_nios2_oci_break:the_t_vga_v1_cpu_v1_nios2_oci_break
set 	t_vga_v1_cpu_v1_ocimem 	t_vga_v1_cpu_v1_nios2_ocimem:the_t_vga_v1_cpu_v1_nios2_ocimem
set 	t_vga_v1_cpu_v1_oci_debug 	t_vga_v1_cpu_v1_nios2_oci_debug:the_t_vga_v1_cpu_v1_nios2_oci_debug
set 	t_vga_v1_cpu_v1_wrapper 	t_vga_v1_cpu_v1_jtag_debug_module_wrapper:the_t_vga_v1_cpu_v1_jtag_debug_module_wrapper
set 	t_vga_v1_cpu_v1_jtag_tck 	t_vga_v1_cpu_v1_jtag_debug_module_tck:the_t_vga_v1_cpu_v1_jtag_debug_module_tck
set 	t_vga_v1_cpu_v1_jtag_sysclk 	t_vga_v1_cpu_v1_jtag_debug_module_sysclk:the_t_vga_v1_cpu_v1_jtag_debug_module_sysclk
set 	t_vga_v1_cpu_v1_oci_path 	 [format "%s|%s" $t_vga_v1_cpu_v1 $t_vga_v1_cpu_v1_oci]
set 	t_vga_v1_cpu_v1_oci_break_path 	 [format "%s|%s" $t_vga_v1_cpu_v1_oci_path $t_vga_v1_cpu_v1_oci_break]
set 	t_vga_v1_cpu_v1_ocimem_path 	 [format "%s|%s" $t_vga_v1_cpu_v1_oci_path $t_vga_v1_cpu_v1_ocimem]
set 	t_vga_v1_cpu_v1_oci_debug_path 	 [format "%s|%s" $t_vga_v1_cpu_v1_oci_path $t_vga_v1_cpu_v1_oci_debug]
set 	t_vga_v1_cpu_v1_jtag_tck_path 	 [format "%s|%s|%s" $t_vga_v1_cpu_v1_oci_path $t_vga_v1_cpu_v1_wrapper $t_vga_v1_cpu_v1_jtag_tck]
set 	t_vga_v1_cpu_v1_jtag_sysclk_path 	 [format "%s|%s|%s" $t_vga_v1_cpu_v1_oci_path $t_vga_v1_cpu_v1_wrapper $t_vga_v1_cpu_v1_jtag_sysclk]
set 	t_vga_v1_cpu_v1_jtag_sr 	 [format "%s|*sr" $t_vga_v1_cpu_v1_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$t_vga_v1_cpu_v1_oci_break_path|break_readreg*] -to [get_keepers *$t_vga_v1_cpu_v1_jtag_sr*]
set_false_path -from [get_keepers *$t_vga_v1_cpu_v1_oci_debug_path|*resetlatch]     -to [get_keepers *$t_vga_v1_cpu_v1_jtag_sr[33]]
set_false_path -from [get_keepers *$t_vga_v1_cpu_v1_oci_debug_path|monitor_ready]  -to [get_keepers *$t_vga_v1_cpu_v1_jtag_sr[0]]
set_false_path -from [get_keepers *$t_vga_v1_cpu_v1_oci_debug_path|monitor_error]  -to [get_keepers *$t_vga_v1_cpu_v1_jtag_sr[34]]
set_false_path -from [get_keepers *$t_vga_v1_cpu_v1_ocimem_path|*MonDReg*] -to [get_keepers *$t_vga_v1_cpu_v1_jtag_sr*]
set_false_path -from *$t_vga_v1_cpu_v1_jtag_sr*    -to *$t_vga_v1_cpu_v1_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$t_vga_v1_cpu_v1_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$t_vga_v1_cpu_v1_oci_debug_path|monitor_go
