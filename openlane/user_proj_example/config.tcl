set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj_example

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_proj_example.v \
	$script_dir/../../verilog/rtl/user_proj_cells.v"



set verilog_root $script_dir/../../verilog/
set lef_root $script_dir/../../cells/lef/
set gds_root $script_dir/../../cells/gds/

# Adding the standard cells into OpenLane:
set ::env(EXTRA_LEFS) [glob $script_dir/../../cells/lef/*.lef]
#set lefs [glob $script_dir/../../cells/lef/*.lef]
#add_lefs -src $lefs

set ::env(EXTRA_LIBS) [glob $script_dir/../../cells/lib/libres*.lib]

set ::env(EXTRA_GDS_FILES)  [glob $script_dir/../../cells/gds/*.gds]

set ::env(VERILOG_FILES_BLACKBOX) "$verilog_root/rtl/user_proj_cells.v"
	
set ::env(SYNTH_READ_BLACKBOX_LIB) 1

#set ::env(CLOCK_NET) "counter.clk"
#set ::env(CLOCK_PERIOD) "10"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 250 250"
set ::env(PL_BASIC_PLACEMENT) 1
#set ::env(PL_TARGET_DENSITY) 0.15
set ::env(FP_CORE_UTIL) 5
set ::env(PL_TARGET_DENSITY) 0.5

set ::env(FP_PDN_VOFFSET) 4
set ::env(FP_PDN_VPITCH) 15
set ::env(FP_PDN_HOFFSET) 4
set ::env(FP_PDN_HPITCH) 15

set ::env(CLOCK_PERIOD) 0
set ::env(CLOCK_TREE_SYNTH) 0
