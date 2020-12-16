# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

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
#set ::env(CLOCK_PERIOD) 10
#set ::env(CLOCK_PORT) "io_in\[10\]"
set ::env(CLOCK_PERIOD) 0
set ::env(CLOCK_TREE_SYNTH) 0

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 300 300"
set ::env(DESIGN_IS_CORE) 0

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 1
#set ::env(PL_TARGET_DENSITY) 0.15
set ::env(FP_CORE_UTIL) 5
#set ::env(PL_TARGET_DENSITY) 0.55

#set ::env(FP_PDN_VOFFSET) 4
#set ::env(FP_PDN_VPITCH) 15
#set ::env(FP_PDN_HOFFSET) 4
#set ::env(FP_PDN_HPITCH) 15

set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(PL_TARGET_DENSITY) 8.55
set ::env(PL_RANDOM_GLB_PLACEMENT) 0
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_SKIP_INITIAL_PLACEMENT) 0

set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg

source $script_dir/variant.tcl

# If you're going to use multiple power domains, then keep this disabled.
set ::env(RUN_CVC) 0
