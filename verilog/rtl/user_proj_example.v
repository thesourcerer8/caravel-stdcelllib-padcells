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
    inout vdda1,        // User area 1 3.3V supply
    inout vdda2,        // User area 2 3.3V supply
    inout vssa1,        // User area 1 analog ground
    inout vssa2,        // User area 2 analog ground
    inout vccd1,        // User area 1 1.8V supply
    inout vccd2,        // User area 2 1.8v supply
    inout vssd1,        // User area 1 digital ground
    inout vssd2,        // User area 2 digital ground

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
  .vdd(vccd1),
  .gnd(vssd1),
  .B(io_in[0]),
  .A(io_in[1]),
  .Y(io_out[2]),
);
AND2X2 AND2X2(
  .vdd(vccd1),
  .gnd(vssd1),
  .B(io_in[3]),
  .A(io_in[4]),
  .Y(io_out[5]),
);
AOI21X1 AOI21X1(
  .vdd(vccd1),
  .gnd(vssd1),
  .C(io_in[6]),
  .B(io_in[7]),
  .A(io_in[8]),
  .Y(io_out[9]),
);
BUFX2 BUFX2(
  .vdd(vccd1),
  .gnd(vssd1),
  .A(io_in[10]),
  .Y(io_out[11]),
);
INV INV(
  .vdd(vccd1),
  .gnd(vssd1),
  .A(io_in[12]),
  .Y(io_out[13]),
);
INVX1 INVX1(
  .vdd(vccd1),
  .gnd(vssd1),
  .A(io_in[14]),
  .Y(io_out[15]),
);
INVX2 INVX2(
  .vdd(vccd1),
  .gnd(vssd1),
  .A(io_in[16]),
  .Y(io_out[17]),
);
INVX4 INVX4(
  .vdd(vccd1),
  .gnd(vssd1),
  .A(io_in[18]),
  .Y(io_out[19]),
);
NOR2X1 NOR2X1(
  .vdd(vccd1),
  .gnd(vssd1),
  .B(io_in[20]),
  .A(io_in[21]),
  .Y(io_out[22]),
);
OR2X1 OR2X1(
  .vdd(vccd1),
  .gnd(vssd1),
  .B(io_in[23]),
  .A(io_in[24]),
  .Y(io_out[25]),
);
OR2X2 OR2X2(
  .vdd(vccd1),
  .gnd(vssd1),
  .B(io_in[26]),
  .A(io_in[27]),
  .Y(io_out[28]),
);
endmodule
