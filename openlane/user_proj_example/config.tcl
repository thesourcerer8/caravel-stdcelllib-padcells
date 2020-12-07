set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj_example

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_proj_example.v"
#	$script_dir/../../verilog/rtl/user_proj_cells.v"

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

set ::env(CLOCK_PORT) ""
#set ::env(CLOCK_NET) "counter.clk"
#set ::env(CLOCK_PERIOD) "10"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 300 300"
set ::env(DESIGN_IS_CORE) 0

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
# set ::env(FP_CONTEXT_DEF) $script_dir/../user_project_wrapper/runs/user_project_wrapper/tmp/floorplan/ioPlacer.def.macro_placement.def
# set ::env(FP_CONTEXT_LEF) $script_dir/../user_project_wrapper/runs/user_project_wrapper/tmp/merged_unpadded.lef

set ::env(PL_BASIC_PLACEMENT) 1
#set ::env(PL_TARGET_DENSITY) 0.15
set ::env(FP_CORE_UTIL) 5
#set ::env(PL_TARGET_DENSITY) 0.55

#set ::env(FP_PDN_VOFFSET) 4
#set ::env(FP_PDN_VPITCH) 15
#set ::env(FP_PDN_HOFFSET) 4
#set ::env(FP_PDN_HPITCH) 15

set ::env(CLOCK_PORT) "io_in\[10\]"
set ::env(CLOCK_PERIOD) 0
set ::env(CLOCK_TREE_SYNTH) 0

set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_TARGET_DENSITY) 8.55
set ::env(PL_RANDOM_GLB_PLACEMENT) 0
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_SKIP_INITIAL_PLACEMENT) 0

set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg

source $script_dir/variant.tcl
