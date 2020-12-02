`default_nettype none

/*
 *-------------------------------------------------------------
 *
 * user_proj_ls130tw1  (LibreSilicon Testwafer #1)
 *
 */

module user_proj_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,        // User area 1 3.3V supply
    inout vdda2,        // User area 2 3.3V supply
    inout vssa1,        // User area 1 analog ground
    inout vssa2,        // User area 2 analog ground
    inout vccd1,        // User area 1 1.8V supply
    inout vccd2,        // User area 2 1.8v supply
    inout vssd1,        // User area 1 digital ground
    inout vssd2,        // User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oen,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb
);

AND2X1 AND2X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(io_in[0]),
  .A(io_in[1]),
  .Y(io_out[2]),
);
AND2X2 AND2X2(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(io_in[3]),
  .A(io_in[4]),
  .Y(io_out[5]),
);
AOI21X1 AOI21X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .C(io_in[6]),
  .B(io_in[7]),
  .A(io_in[8]),
  .Y(io_out[9]),
);
AOI22X1 AOI22X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .D(io_in[10]),
  .C(io_in[11]),
  .B(io_in[12]),
  .A(io_in[13]),
  .Y(io_out[14]),
);
BUFX2 BUFX2(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[15]),
  .Y(io_out[16]),
);
BUFX4 BUFX4(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[17]),
  .Y(io_out[18]),
);
CLKBUF1 CLKBUF1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[19]),
  .Y(io_out[20]),
);
HAX1 HAX1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(io_in[21]),
  .A(io_in[22]),
  .YS(io_out[23]),
  .YC(io_out[24]),
);
INV INV(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[25]),
  .Y(io_out[26]),
);
INVX1 INVX1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[27]),
  .Y(io_out[28]),
);
INVX2 INVX2(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[29]),
  .Y(io_out[30]),
);
INVX4 INVX4(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[31]),
  .Y(io_out[32]),
);
INVX8 INVX8(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .A(io_in[33]),
  .Y(io_out[34]),
);
LATCH LATCH(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .D(io_in[35]),
  .CLK(io_in[36]),
  .Q(io_out[37]),
);
MUX2X1 MUX2X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .S(la_data_in[0]),
  .B(la_data_in[1]),
  .A(la_data_in[2]),
  .Y(la_data_out[3]),
);
NAND2X1 NAND2X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(la_data_in[4]),
  .A(la_data_in[5]),
  .Y(la_data_out[6]),
);
NAND3X1 NAND3X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .C(la_data_in[7]),
  .B(la_data_in[8]),
  .A(la_data_in[9]),
  .Y(la_data_out[10]),
);
NOR2X1 NOR2X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(la_data_in[11]),
  .A(la_data_in[12]),
  .Y(la_data_out[13]),
);
NOR3X1 NOR3X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .C(la_data_in[14]),
  .B(la_data_in[15]),
  .A(la_data_in[16]),
  .Y(la_data_out[17]),
);
OAI21X1 OAI21X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .C(la_data_in[18]),
  .B(la_data_in[19]),
  .A(la_data_in[20]),
  .Y(la_data_out[21]),
);
OAI22X1 OAI22X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .D(la_data_in[22]),
  .C(la_data_in[23]),
  .B(la_data_in[24]),
  .A(la_data_in[25]),
  .Y(la_data_out[26]),
);
OR2X1 OR2X1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(la_data_in[27]),
  .A(la_data_in[28]),
  .Y(la_data_out[29]),
);
OR2X2 OR2X2(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .B(la_data_in[30]),
  .A(la_data_in[31]),
  .Y(la_data_out[32]),
);
TBUFX1 TBUFX1(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .EN(la_data_in[33]),
  .A(la_data_in[34]),
  .Y(la_data_out[35]),
);
TBUFX2 TBUFX2(
 `ifdef USE_POWER_PINS
  .vdd(vccd1),
  .gnd(vssd1),
 `endif
  .EN(la_data_in[36]),
  .A(la_data_in[37]),
  .Y(la_data_out[38]),
);
assign io_oeb[0] = 1'b1;
assign io_oeb[1] = 1'b1;
assign io_oeb[2] = 1'b0;
assign io_oeb[3] = 1'b1;
assign io_oeb[4] = 1'b1;
assign io_oeb[5] = 1'b0;
assign io_oeb[6] = 1'b1;
assign io_oeb[7] = 1'b1;
assign io_oeb[8] = 1'b1;
assign io_oeb[9] = 1'b0;
assign io_oeb[10] = 1'b1;
assign io_oeb[11] = 1'b1;
assign io_oeb[12] = 1'b1;
assign io_oeb[13] = 1'b1;
assign io_oeb[14] = 1'b0;
assign io_oeb[15] = 1'b1;
assign io_oeb[16] = 1'b0;
assign io_oeb[17] = 1'b1;
assign io_oeb[18] = 1'b0;
assign io_oeb[19] = 1'b1;
assign io_oeb[20] = 1'b0;
assign io_oeb[21] = 1'b1;
assign io_oeb[22] = 1'b1;
assign io_oeb[23] = 1'b0;
assign io_oeb[24] = 1'b0;
assign io_oeb[25] = 1'b1;
assign io_oeb[26] = 1'b0;
assign io_oeb[27] = 1'b1;
assign io_oeb[28] = 1'b0;
assign io_oeb[29] = 1'b1;
assign io_oeb[30] = 1'b0;
assign io_oeb[31] = 1'b1;
assign io_oeb[32] = 1'b0;
assign io_oeb[33] = 1'b1;
assign io_oeb[34] = 1'b0;
assign io_oeb[35] = 1'b1;
assign io_oeb[36] = 1'b1;
assign io_oeb[37] = 1'b0;
endmodule
