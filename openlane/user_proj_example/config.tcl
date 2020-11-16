set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj_example

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_proj_example.v"


# Adding the standard cells into OpenLane:
set ::env(EXTRA_LEFS) [glob $script_dir/../../cells/lef/*.lef]
set lefs [glob $script_dir/../../cells/lef/*.lef]
add_lefs -src $lefs


set ::env(CLOCK_NET) "counter.clk"
set ::env(CLOCK_PERIOD) "10"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 250 250"
set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.15
