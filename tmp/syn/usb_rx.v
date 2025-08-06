/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Fri May  2 02:30:30 2025
/////////////////////////////////////////////////////////////


module sync_RST_VAL1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   ff_out;

  DFFSR ff_out_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(ff_out)
         );
  DFFSR sync_out_reg ( .D(ff_out), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule


module sync_RST_VAL0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   ff_out;

  DFFSR ff_out_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ff_out)
         );
  DFFSR sync_out_reg ( .D(ff_out), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module EOP_det ( clk, n_rst, en, dp_in, dm_in, clear, eop, eop_error );
  input clk, n_rst, en, dp_in, dm_in, clear;
  output eop, eop_error;
  wire   prev_dm_in, prev_dp_in, n23, n24, n25, n26, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [1:0] eop_count;

  DFFSR prev_dp_in_reg ( .D(n26), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        prev_dp_in) );
  DFFSR prev_dm_in_reg ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_dm_in) );
  DFFSR \eop_count_reg[0]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        eop_count[0]) );
  DFFSR \eop_count_reg[1]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        eop_count[1]) );
  INVX1 U7 ( .A(n5), .Y(n26) );
  MUX2X1 U8 ( .B(dp_in), .A(prev_dp_in), .S(n6), .Y(n5) );
  INVX1 U9 ( .A(n7), .Y(n25) );
  MUX2X1 U10 ( .B(dm_in), .A(prev_dm_in), .S(n6), .Y(n7) );
  OAI21X1 U11 ( .A(n6), .B(n8), .C(n9), .Y(n24) );
  NAND3X1 U12 ( .A(n10), .B(n11), .C(eop_count[0]), .Y(n9) );
  INVX1 U13 ( .A(n12), .Y(n6) );
  MUX2X1 U14 ( .B(n13), .A(n14), .S(n15), .Y(n23) );
  NAND3X1 U15 ( .A(eop_count[0]), .B(n12), .C(n16), .Y(n14) );
  NOR2X1 U16 ( .A(n11), .B(clear), .Y(n12) );
  OAI21X1 U17 ( .A(n17), .B(n11), .C(n10), .Y(n13) );
  INVX1 U18 ( .A(clear), .Y(n10) );
  INVX1 U19 ( .A(en), .Y(n11) );
  MUX2X1 U20 ( .B(n8), .A(n18), .S(n15), .Y(eop_error) );
  NAND2X1 U21 ( .A(eop_count[0]), .B(n19), .Y(n18) );
  INVX1 U22 ( .A(n17), .Y(n8) );
  NOR2X1 U23 ( .A(n19), .B(eop_count[0]), .Y(n17) );
  INVX1 U24 ( .A(n16), .Y(n19) );
  NOR2X1 U25 ( .A(n15), .B(n20), .Y(eop) );
  OR2X1 U26 ( .A(n16), .B(eop_count[0]), .Y(n20) );
  NOR2X1 U27 ( .A(prev_dm_in), .B(prev_dp_in), .Y(n16) );
  INVX1 U28 ( .A(eop_count[1]), .Y(n15) );
endmodule


module flex_counter_SIZE4_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        rollover_flag, count_out );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n1, n2, n3, n4, n5, n6, n7, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(N11) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n4) );
  OAI21X1 U11 ( .A(n5), .B(n6), .C(n7), .Y(next_count[1]) );
  NAND3X1 U12 ( .A(n13), .B(n5), .C(n14), .Y(n7) );
  OAI21X1 U13 ( .A(n15), .B(n16), .C(n17), .Y(n6) );
  NOR2X1 U14 ( .A(n13), .B(n18), .Y(n15) );
  XNOR2X1 U15 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n3) );
  OAI21X1 U16 ( .A(n19), .B(n20), .C(n21), .Y(next_count[2]) );
  NAND3X1 U17 ( .A(n22), .B(n19), .C(n14), .Y(n21) );
  OAI21X1 U18 ( .A(n23), .B(n16), .C(n17), .Y(n20) );
  NOR2X1 U19 ( .A(n22), .B(n18), .Y(n23) );
  NAND2X1 U20 ( .A(n24), .B(n25), .Y(n1) );
  XNOR2X1 U21 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n25) );
  OAI21X1 U22 ( .A(n13), .B(n26), .C(n27), .Y(next_count[0]) );
  NAND3X1 U23 ( .A(n17), .B(n16), .C(count_out[0]), .Y(n27) );
  XNOR2X1 U24 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n24) );
  OAI21X1 U25 ( .A(n28), .B(n26), .C(n29), .Y(next_count[3]) );
  NAND3X1 U26 ( .A(n17), .B(n16), .C(count_out[3]), .Y(n29) );
  INVX1 U27 ( .A(clear), .Y(n17) );
  INVX1 U28 ( .A(n14), .Y(n26) );
  NOR2X1 U29 ( .A(n16), .B(clear), .Y(n14) );
  INVX1 U30 ( .A(count_enable), .Y(n16) );
  AOI22X1 U31 ( .A(count_out[3]), .B(n30), .C(n22), .D(count_out[2]), .Y(n28)
         );
  AND2X1 U32 ( .A(n13), .B(count_out[1]), .Y(n22) );
  NOR2X1 U33 ( .A(n31), .B(n18), .Y(n13) );
  INVX1 U34 ( .A(n30), .Y(n18) );
  OAI22X1 U35 ( .A(n32), .B(n33), .C(count_out[3]), .D(n34), .Y(n30) );
  OAI21X1 U36 ( .A(n35), .B(n19), .C(n36), .Y(n33) );
  OAI21X1 U37 ( .A(n37), .B(count_out[2]), .C(n38), .Y(n36) );
  INVX1 U38 ( .A(rollover_val[2]), .Y(n38) );
  INVX1 U39 ( .A(count_out[2]), .Y(n19) );
  INVX1 U40 ( .A(n37), .Y(n35) );
  AOI22X1 U41 ( .A(n5), .B(rollover_val[1]), .C(rollover_val[0]), .D(n39), .Y(
        n37) );
  INVX1 U42 ( .A(n40), .Y(n39) );
  OAI21X1 U43 ( .A(rollover_val[1]), .B(n5), .C(n31), .Y(n40) );
  INVX1 U44 ( .A(count_out[0]), .Y(n31) );
  INVX1 U45 ( .A(count_out[1]), .Y(n5) );
  AND2X1 U46 ( .A(n34), .B(count_out[3]), .Y(n32) );
  INVX1 U47 ( .A(rollover_val[3]), .Y(n34) );
endmodule


module flex_counter_SIZE3_0 ( clk, n_rst, clear, count_enable, rollover_val, 
        rollover_flag, count_out );
  input [2:0] rollover_val;
  output [2:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N10, n1, n2, n3, n4, n5, n6, n7, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [2:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(N10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U7 ( .A(n1), .B(n2), .Y(N10) );
  NAND2X1 U8 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U9 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n4) );
  OAI21X1 U10 ( .A(n5), .B(n6), .C(n7), .Y(next_count[2]) );
  NAND3X1 U11 ( .A(n12), .B(count_out[1]), .C(n13), .Y(n7) );
  OAI21X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n6) );
  XNOR2X1 U13 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n3) );
  OAI21X1 U14 ( .A(n17), .B(n18), .C(n19), .Y(next_count[1]) );
  NAND3X1 U15 ( .A(n12), .B(n17), .C(n13), .Y(n19) );
  NAND2X1 U16 ( .A(n20), .B(n16), .Y(n18) );
  OAI21X1 U17 ( .A(n13), .B(n21), .C(count_enable), .Y(n20) );
  XOR2X1 U18 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n1) );
  OAI21X1 U19 ( .A(n13), .B(n22), .C(n23), .Y(next_count[0]) );
  NAND3X1 U20 ( .A(n16), .B(n15), .C(count_out[0]), .Y(n23) );
  INVX1 U21 ( .A(clear), .Y(n16) );
  INVX1 U22 ( .A(n12), .Y(n22) );
  NOR2X1 U23 ( .A(n15), .B(clear), .Y(n12) );
  INVX1 U24 ( .A(count_enable), .Y(n15) );
  AND2X1 U25 ( .A(count_out[0]), .B(n14), .Y(n13) );
  INVX1 U26 ( .A(n21), .Y(n14) );
  OAI21X1 U27 ( .A(rollover_val[2]), .B(n5), .C(n24), .Y(n21) );
  OAI21X1 U28 ( .A(count_out[2]), .B(n25), .C(n26), .Y(n24) );
  AOI22X1 U29 ( .A(n27), .B(rollover_val[0]), .C(rollover_val[1]), .D(n17), 
        .Y(n26) );
  INVX1 U30 ( .A(count_out[1]), .Y(n17) );
  AOI21X1 U31 ( .A(count_out[1]), .B(n28), .C(count_out[0]), .Y(n27) );
  INVX1 U32 ( .A(rollover_val[1]), .Y(n28) );
  INVX1 U33 ( .A(rollover_val[2]), .Y(n25) );
  INVX1 U34 ( .A(count_out[2]), .Y(n5) );
endmodule


module clk_div_rx ( clk, n_rst, counter_clear, en_clk_div, readjust, 
        clk_divider );
  input clk, n_rst, counter_clear, en_clk_div, readjust;
  output clk_divider;
  wire   cnt_en, c8_rollover_flag, c3_rollover_flag, n_cnt_en, last_readjust,
         n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [3:0] zero;

  DFFSR cnt_en_reg ( .D(n_cnt_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(cnt_en)
         );
  DFFSR last_readjust_reg ( .D(readjust), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_readjust) );
  flex_counter_SIZE4_0 counter8 ( .clk(clk), .n_rst(n_rst), .clear(
        counter_clear), .count_enable(cnt_en), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(c8_rollover_flag), .count_out(zero) );
  flex_counter_SIZE3_0 counter3 ( .clk(clk), .n_rst(n_rst), .clear(
        counter_clear), .count_enable(c8_rollover_flag), .rollover_val({1'b0, 
        1'b1, 1'b1}), .rollover_flag(c3_rollover_flag) );
  INVX1 U5 ( .A(n3), .Y(clk_divider) );
  NAND3X1 U6 ( .A(en_clk_div), .B(n4), .C(n5), .Y(n3) );
  AOI21X1 U7 ( .A(n6), .B(n7), .C(last_readjust), .Y(n5) );
  NOR2X1 U8 ( .A(zero[3]), .B(zero[2]), .Y(n7) );
  NOR2X1 U9 ( .A(zero[1]), .B(zero[0]), .Y(n6) );
  OAI21X1 U10 ( .A(c3_rollover_flag), .B(n8), .C(cnt_en), .Y(n4) );
  INVX1 U11 ( .A(c8_rollover_flag), .Y(n8) );
  AOI21X1 U12 ( .A(n9), .B(c3_rollover_flag), .C(n10), .Y(n_cnt_en) );
  INVX1 U13 ( .A(en_clk_div), .Y(n10) );
  AND2X1 U14 ( .A(c8_rollover_flag), .B(cnt_en), .Y(n9) );
endmodule


module NRZI_decoder ( clk, n_rst, en, dp_in, d_orig, d_edge );
  input clk, n_rst, en, dp_in;
  output d_orig, d_edge;
  wire   dp_in_prev, n1, n2;

  DFFSR dp_in_prev_reg ( .D(n2), .CLK(clk), .R(1'b1), .S(n_rst), .Q(dp_in_prev) );
  INVX1 U2 ( .A(n1), .Y(n2) );
  MUX2X1 U3 ( .B(dp_in_prev), .A(dp_in), .S(en), .Y(n1) );
  INVX1 U4 ( .A(d_edge), .Y(d_orig) );
  XOR2X1 U5 ( .A(dp_in), .B(dp_in_prev), .Y(d_edge) );
endmodule


module data_reg ( clk, n_rst, shift_in, store_data, flush, send_packet, 
        store_packet, addr_check, packet_data, rx_packet, rx_packet_data, 
        addr_right, addr_wrong );
  input [7:0] packet_data;
  output [2:0] rx_packet;
  output [7:0] rx_packet_data;
  input clk, n_rst, shift_in, store_data, flush, send_packet, store_packet,
         addr_check;
  output addr_right, addr_wrong;
  wire   n67, n69, n71, n73, n75, n77, n79, n81, n83, n85, n87, n89, n91, n93,
         n95, n97, n99, n101, n103, n109, n111, n113, n115, n116, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54;
  wire   [15:0] data_register;
  wire   [11:8] next_data_register;

  DFFSR \data_register_reg[15]  ( .D(n115), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_register[15]) );
  DFFSR \data_register_reg[14]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_register[14]) );
  DFFSR \data_register_reg[13]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_register[13]) );
  DFFSR \data_register_reg[12]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_register[12]) );
  DFFSR \data_register_reg[11]  ( .D(n116), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_register[11]) );
  DFFSR \data_register_reg[10]  ( .D(next_data_register[10]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_register[10]) );
  DFFSR \data_register_reg[9]  ( .D(next_data_register[9]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_register[9]) );
  DFFSR \data_register_reg[8]  ( .D(next_data_register[8]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_register[8]) );
  DFFSR \rx_packet_r_reg[2]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet[2]) );
  DFFSR \rx_packet_r_reg[0]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet[0]) );
  DFFSR \rx_packet_r_reg[1]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_packet[1]) );
  DFFSR \data_register_reg[7]  ( .D(n97), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[7]) );
  DFFSR \data_register_reg[6]  ( .D(n95), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[6]) );
  DFFSR \data_register_reg[5]  ( .D(n93), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[5]) );
  DFFSR \data_register_reg[4]  ( .D(n91), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[4]) );
  DFFSR \data_register_reg[3]  ( .D(n89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[3]) );
  DFFSR \data_register_reg[2]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[2]) );
  DFFSR \data_register_reg[1]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[1]) );
  DFFSR \data_register_reg[0]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_register[0]) );
  DFFSR \rx_packet_data_r_reg[7]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[7]) );
  DFFSR \rx_packet_data_r_reg[6]  ( .D(n79), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[6]) );
  DFFSR \rx_packet_data_r_reg[5]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[5]) );
  DFFSR \rx_packet_data_r_reg[4]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[4]) );
  DFFSR \rx_packet_data_r_reg[3]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[3]) );
  DFFSR \rx_packet_data_r_reg[2]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[2]) );
  DFFSR \rx_packet_data_r_reg[1]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[1]) );
  DFFSR \rx_packet_data_r_reg[0]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(rx_packet_data[0]) );
  INVX2 U3 ( .A(shift_in), .Y(n12) );
  INVX1 U4 ( .A(n1), .Y(next_data_register[9]) );
  INVX1 U5 ( .A(n2), .Y(next_data_register[10]) );
  OAI21X1 U6 ( .A(store_packet), .B(n3), .C(n4), .Y(n99) );
  AOI21X1 U7 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  INVX1 U8 ( .A(n8), .Y(n7) );
  OAI22X1 U9 ( .A(packet_data[1]), .B(n9), .C(data_register[9]), .D(n10), .Y(
        n6) );
  INVX1 U10 ( .A(rx_packet[1]), .Y(n3) );
  INVX1 U11 ( .A(n11), .Y(n97) );
  MUX2X1 U12 ( .B(data_register[15]), .A(data_register[7]), .S(n12), .Y(n11)
         );
  INVX1 U13 ( .A(n13), .Y(n95) );
  MUX2X1 U14 ( .B(data_register[14]), .A(data_register[6]), .S(n12), .Y(n13)
         );
  INVX1 U15 ( .A(n14), .Y(n93) );
  MUX2X1 U16 ( .B(data_register[13]), .A(data_register[5]), .S(n12), .Y(n14)
         );
  INVX1 U17 ( .A(n15), .Y(n91) );
  MUX2X1 U18 ( .B(data_register[12]), .A(data_register[4]), .S(n12), .Y(n15)
         );
  MUX2X1 U19 ( .B(n16), .A(n17), .S(n12), .Y(n89) );
  INVX1 U20 ( .A(n18), .Y(n87) );
  MUX2X1 U21 ( .B(data_register[10]), .A(data_register[2]), .S(n12), .Y(n18)
         );
  MUX2X1 U22 ( .B(n19), .A(n20), .S(n12), .Y(n85) );
  INVX1 U23 ( .A(n21), .Y(n83) );
  MUX2X1 U24 ( .B(data_register[8]), .A(data_register[0]), .S(n12), .Y(n21) );
  INVX1 U25 ( .A(n22), .Y(n81) );
  MUX2X1 U26 ( .B(rx_packet_data[7]), .A(data_register[7]), .S(store_data), 
        .Y(n22) );
  INVX1 U27 ( .A(n23), .Y(n79) );
  MUX2X1 U28 ( .B(rx_packet_data[6]), .A(data_register[6]), .S(store_data), 
        .Y(n23) );
  MUX2X1 U29 ( .B(n24), .A(n25), .S(store_data), .Y(n77) );
  INVX1 U30 ( .A(rx_packet_data[5]), .Y(n24) );
  INVX1 U31 ( .A(n26), .Y(n75) );
  MUX2X1 U32 ( .B(rx_packet_data[4]), .A(data_register[4]), .S(store_data), 
        .Y(n26) );
  MUX2X1 U33 ( .B(n27), .A(n17), .S(store_data), .Y(n73) );
  INVX1 U34 ( .A(rx_packet_data[3]), .Y(n27) );
  INVX1 U35 ( .A(n28), .Y(n71) );
  MUX2X1 U36 ( .B(rx_packet_data[2]), .A(data_register[2]), .S(store_data), 
        .Y(n28) );
  MUX2X1 U37 ( .B(n29), .A(n20), .S(store_data), .Y(n69) );
  INVX1 U38 ( .A(rx_packet_data[1]), .Y(n29) );
  INVX1 U39 ( .A(n30), .Y(n67) );
  MUX2X1 U40 ( .B(rx_packet_data[0]), .A(data_register[0]), .S(store_data), 
        .Y(n30) );
  INVX1 U41 ( .A(n31), .Y(n115) );
  MUX2X1 U42 ( .B(packet_data[7]), .A(data_register[15]), .S(n12), .Y(n31) );
  INVX1 U43 ( .A(n32), .Y(n113) );
  MUX2X1 U44 ( .B(packet_data[6]), .A(data_register[14]), .S(n12), .Y(n32) );
  INVX1 U45 ( .A(n33), .Y(n111) );
  MUX2X1 U46 ( .B(packet_data[5]), .A(data_register[13]), .S(n12), .Y(n33) );
  INVX1 U47 ( .A(n34), .Y(n109) );
  MUX2X1 U48 ( .B(packet_data[4]), .A(data_register[12]), .S(n12), .Y(n34) );
  OAI21X1 U49 ( .A(n1), .B(n35), .C(n36), .Y(n103) );
  NAND2X1 U50 ( .A(rx_packet[2]), .B(n37), .Y(n36) );
  NAND3X1 U51 ( .A(n38), .B(n8), .C(n39), .Y(n101) );
  NAND2X1 U52 ( .A(rx_packet[0]), .B(n37), .Y(n39) );
  NAND3X1 U53 ( .A(n40), .B(n2), .C(n41), .Y(n8) );
  NOR2X1 U54 ( .A(n1), .B(n37), .Y(n41) );
  INVX1 U55 ( .A(store_packet), .Y(n37) );
  MUX2X1 U56 ( .B(packet_data[1]), .A(data_register[9]), .S(n12), .Y(n1) );
  NOR2X1 U57 ( .A(n116), .B(next_data_register[8]), .Y(n40) );
  NAND2X1 U58 ( .A(n9), .B(n10), .Y(n116) );
  OAI21X1 U59 ( .A(n42), .B(n43), .C(n5), .Y(n38) );
  INVX1 U60 ( .A(n35), .Y(n5) );
  NAND3X1 U61 ( .A(n2), .B(next_data_register[8]), .C(store_packet), .Y(n35)
         );
  INVX1 U62 ( .A(n44), .Y(next_data_register[8]) );
  MUX2X1 U63 ( .B(packet_data[0]), .A(data_register[8]), .S(n12), .Y(n44) );
  MUX2X1 U64 ( .B(packet_data[2]), .A(data_register[10]), .S(n12), .Y(n2) );
  MUX2X1 U65 ( .B(n45), .A(n9), .S(packet_data[1]), .Y(n43) );
  NAND2X1 U66 ( .A(packet_data[3]), .B(shift_in), .Y(n9) );
  OR2X1 U67 ( .A(n12), .B(packet_data[3]), .Y(n45) );
  MUX2X1 U68 ( .B(n10), .A(n46), .S(n19), .Y(n42) );
  NAND2X1 U69 ( .A(n16), .B(n12), .Y(n46) );
  INVX1 U70 ( .A(data_register[11]), .Y(n16) );
  NAND2X1 U71 ( .A(data_register[11]), .B(n12), .Y(n10) );
  AND2X1 U72 ( .A(n47), .B(addr_check), .Y(addr_wrong) );
  NOR2X1 U73 ( .A(n48), .B(n47), .Y(addr_right) );
  NAND2X1 U74 ( .A(n49), .B(n50), .Y(n47) );
  NOR2X1 U75 ( .A(n51), .B(n52), .Y(n50) );
  NAND3X1 U76 ( .A(data_register[8]), .B(n20), .C(data_register[10]), .Y(n52)
         );
  INVX1 U77 ( .A(data_register[1]), .Y(n20) );
  NAND3X1 U78 ( .A(n25), .B(n19), .C(n17), .Y(n51) );
  INVX1 U79 ( .A(data_register[3]), .Y(n17) );
  INVX1 U80 ( .A(data_register[9]), .Y(n19) );
  INVX1 U81 ( .A(data_register[5]), .Y(n25) );
  NOR2X1 U82 ( .A(n53), .B(n54), .Y(n49) );
  NAND2X1 U83 ( .A(data_register[0]), .B(data_register[2]), .Y(n54) );
  NAND3X1 U84 ( .A(data_register[6]), .B(data_register[7]), .C(
        data_register[4]), .Y(n53) );
  INVX1 U85 ( .A(addr_check), .Y(n48) );
endmodule


module rx_controller ( clk, n_rst, clk_div, byte_strobe, bitstuff_error, 
        d_edge, buffer_occupancy, packet_data, eop, eop_error, crc_right, 
        crc_wrong, addr_right, addr_wrong, rollover_flag_3, flush, rx_error, 
        rx_dr, rx_busy, store_rx_data, crc_check, en_clk_div, addr_check, 
        clk_4_en, store_data, shift_in, send_packet, store_packet, clear, 
        shift_en, clear_clk, count_en, EOP_en, NRZI_en, clear_4clk );
  input [6:0] buffer_occupancy;
  input [7:0] packet_data;
  input clk, n_rst, clk_div, byte_strobe, bitstuff_error, d_edge, eop,
         eop_error, crc_right, crc_wrong, addr_right, addr_wrong,
         rollover_flag_3;
  output flush, rx_error, rx_dr, rx_busy, store_rx_data, crc_check, en_clk_div,
         addr_check, clk_4_en, store_data, shift_in, send_packet, store_packet,
         clear, shift_en, clear_clk, count_en, EOP_en, NRZI_en, clear_4clk;
  wire   clk_div, N723, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n260, n261, store_rx_data;
  wire   [6:0] state;
  wire   [5:0] next_state;
  assign EOP_en = clk_div;
  assign shift_en = N723;
  assign count_en = N723;
  assign store_data = store_rx_data;

  DFFSR \state_reg[0]  ( .D(n261), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[5]  ( .D(next_state[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[5]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(n260), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  NAND2X1 U4 ( .A(n7), .B(n8), .Y(store_packet) );
  NAND3X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(shift_in) );
  NOR2X1 U11 ( .A(n12), .B(n13), .Y(n11) );
  OR2X1 U12 ( .A(n14), .B(n15), .Y(send_packet) );
  OAI21X1 U13 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  NAND2X1 U14 ( .A(n19), .B(n20), .Y(rx_error) );
  NAND2X1 U15 ( .A(n21), .B(n22), .Y(rx_busy) );
  NAND3X1 U16 ( .A(n23), .B(n24), .C(n25), .Y(next_state[5]) );
  NOR2X1 U17 ( .A(n26), .B(n27), .Y(n25) );
  OAI21X1 U18 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  OAI21X1 U19 ( .A(n31), .B(n32), .C(eop), .Y(n30) );
  OAI21X1 U20 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  NAND2X1 U21 ( .A(n36), .B(n37), .Y(n34) );
  NAND2X1 U22 ( .A(n38), .B(n39), .Y(n33) );
  NAND3X1 U23 ( .A(n8), .B(n40), .C(n41), .Y(n31) );
  INVX1 U24 ( .A(n42), .Y(n28) );
  OAI21X1 U25 ( .A(n43), .B(n44), .C(n45), .Y(n26) );
  NAND3X1 U26 ( .A(n46), .B(n47), .C(n48), .Y(n45) );
  NOR2X1 U27 ( .A(n49), .B(n50), .Y(n48) );
  INVX1 U28 ( .A(n51), .Y(n49) );
  AOI22X1 U29 ( .A(n52), .B(n53), .C(n12), .D(n54), .Y(n23) );
  NAND3X1 U30 ( .A(n55), .B(n56), .C(n57), .Y(next_state[4]) );
  NOR2X1 U31 ( .A(n58), .B(n59), .Y(n57) );
  OAI21X1 U32 ( .A(n60), .B(n61), .C(n62), .Y(n59) );
  AOI22X1 U33 ( .A(n63), .B(n42), .C(n64), .D(n65), .Y(n62) );
  OAI21X1 U34 ( .A(state[1]), .B(d_edge), .C(n66), .Y(n42) );
  OAI21X1 U35 ( .A(n54), .B(n67), .C(n68), .Y(n58) );
  AOI21X1 U36 ( .A(n69), .B(crc_right), .C(n70), .Y(n68) );
  AND2X1 U37 ( .A(n71), .B(n72), .Y(n69) );
  NOR2X1 U38 ( .A(n73), .B(n74), .Y(n56) );
  OAI22X1 U39 ( .A(n75), .B(n76), .C(n77), .D(n78), .Y(n74) );
  NOR2X1 U40 ( .A(n79), .B(n80), .Y(n55) );
  NAND3X1 U41 ( .A(n81), .B(n82), .C(n83), .Y(next_state[3]) );
  NOR2X1 U42 ( .A(n84), .B(n85), .Y(n83) );
  OAI22X1 U43 ( .A(n86), .B(n87), .C(n77), .D(n88), .Y(n85) );
  NAND3X1 U44 ( .A(n89), .B(n90), .C(n91), .Y(n84) );
  OAI21X1 U45 ( .A(n92), .B(n93), .C(n65), .Y(n91) );
  INVX1 U46 ( .A(n94), .Y(n65) );
  AOI21X1 U47 ( .A(n60), .B(store_rx_data), .C(n80), .Y(n82) );
  OR2X1 U48 ( .A(n95), .B(n96), .Y(n80) );
  OAI21X1 U49 ( .A(eop_error), .B(n97), .C(n98), .Y(n96) );
  NOR2X1 U50 ( .A(n99), .B(n100), .Y(n81) );
  NAND3X1 U51 ( .A(n101), .B(n102), .C(n103), .Y(next_state[2]) );
  NOR2X1 U52 ( .A(n104), .B(n105), .Y(n103) );
  OAI22X1 U53 ( .A(eop_error), .B(n76), .C(n106), .D(n107), .Y(n105) );
  OAI21X1 U54 ( .A(n108), .B(n89), .C(n109), .Y(n104) );
  NOR2X1 U55 ( .A(n95), .B(n73), .Y(n102) );
  OAI22X1 U56 ( .A(n9), .B(n77), .C(n94), .D(n110), .Y(n73) );
  NOR2X1 U57 ( .A(n111), .B(n112), .Y(n94) );
  OAI22X1 U58 ( .A(n113), .B(n114), .C(n115), .D(n116), .Y(n95) );
  INVX1 U59 ( .A(n117), .Y(n116) );
  NOR2X1 U60 ( .A(n118), .B(n119), .Y(n101) );
  MUX2X1 U61 ( .B(n120), .A(n90), .S(eop), .Y(n119) );
  AOI21X1 U62 ( .A(n121), .B(n52), .C(n122), .Y(n120) );
  OAI21X1 U63 ( .A(n108), .B(n123), .C(n124), .Y(n122) );
  INVX1 U64 ( .A(n41), .Y(n52) );
  INVX1 U65 ( .A(n53), .Y(n121) );
  NAND3X1 U66 ( .A(n125), .B(n126), .C(n127), .Y(n53) );
  NOR2X1 U67 ( .A(packet_data[1]), .B(n128), .Y(n127) );
  NOR2X1 U68 ( .A(packet_data[6]), .B(packet_data[4]), .Y(n125) );
  NAND3X1 U69 ( .A(n129), .B(n130), .C(n131), .Y(n260) );
  NOR2X1 U70 ( .A(n132), .B(n133), .Y(n131) );
  OAI21X1 U71 ( .A(byte_strobe), .B(n89), .C(n134), .Y(n133) );
  NAND2X1 U72 ( .A(n135), .B(n75), .Y(n134) );
  INVX1 U73 ( .A(eop_error), .Y(n75) );
  OAI21X1 U74 ( .A(n136), .B(n35), .C(n97), .Y(n135) );
  AOI22X1 U75 ( .A(n137), .B(n138), .C(n139), .D(n140), .Y(n97) );
  NAND2X1 U76 ( .A(n141), .B(n142), .Y(n89) );
  NAND3X1 U77 ( .A(n61), .B(n18), .C(n76), .Y(n132) );
  NAND2X1 U78 ( .A(n143), .B(n36), .Y(n18) );
  NOR2X1 U79 ( .A(n118), .B(n144), .Y(n130) );
  OAI21X1 U80 ( .A(n87), .B(n145), .C(n146), .Y(n144) );
  INVX1 U81 ( .A(n79), .Y(n146) );
  OAI22X1 U82 ( .A(n60), .B(n106), .C(n147), .D(n148), .Y(n79) );
  NAND3X1 U83 ( .A(n149), .B(n98), .C(n150), .Y(n118) );
  AOI21X1 U84 ( .A(n151), .B(n43), .C(n152), .Y(n150) );
  OAI22X1 U85 ( .A(n50), .B(n46), .C(n153), .D(n67), .Y(n152) );
  NAND3X1 U86 ( .A(packet_data[1]), .B(n154), .C(n155), .Y(n46) );
  INVX1 U87 ( .A(packet_data[5]), .Y(n154) );
  INVX1 U88 ( .A(n78), .Y(n151) );
  INVX1 U89 ( .A(n156), .Y(n98) );
  OAI21X1 U90 ( .A(n50), .B(n47), .C(n157), .Y(n156) );
  AOI22X1 U91 ( .A(n141), .B(n158), .C(n12), .D(n147), .Y(n157) );
  INVX1 U92 ( .A(n159), .Y(n12) );
  INVX1 U93 ( .A(n99), .Y(n149) );
  OAI21X1 U94 ( .A(n136), .B(n160), .C(n161), .Y(n99) );
  NAND3X1 U95 ( .A(n162), .B(n71), .C(n72), .Y(n161) );
  INVX1 U96 ( .A(crc_wrong), .Y(n71) );
  INVX1 U97 ( .A(crc_right), .Y(n162) );
  NAND2X1 U98 ( .A(n147), .B(n142), .Y(n160) );
  OAI21X1 U99 ( .A(n163), .B(n164), .C(n148), .Y(n142) );
  INVX1 U100 ( .A(n165), .Y(n148) );
  NOR2X1 U101 ( .A(n166), .B(n167), .Y(n129) );
  MUX2X1 U102 ( .B(n168), .A(n106), .S(eop), .Y(n167) );
  INVX1 U103 ( .A(store_rx_data), .Y(n106) );
  AOI21X1 U104 ( .A(rollover_flag_3), .B(clk_4_en), .C(n169), .Y(n168) );
  OAI21X1 U105 ( .A(n108), .B(n124), .C(n40), .Y(n169) );
  INVX1 U106 ( .A(byte_strobe), .Y(n108) );
  NAND2X1 U107 ( .A(n170), .B(n171), .Y(n261) );
  NOR2X1 U108 ( .A(n172), .B(n173), .Y(n171) );
  OAI21X1 U109 ( .A(n174), .B(n50), .C(n175), .Y(n173) );
  AOI22X1 U110 ( .A(n92), .B(n111), .C(n93), .D(n112), .Y(n175) );
  INVX1 U111 ( .A(n87), .Y(n111) );
  INVX1 U112 ( .A(n47), .Y(n174) );
  NAND3X1 U113 ( .A(packet_data[1]), .B(n176), .C(packet_data[4]), .Y(n47) );
  INVX1 U114 ( .A(n128), .Y(n176) );
  NAND3X1 U115 ( .A(packet_data[7]), .B(n177), .C(n178), .Y(n128) );
  NOR2X1 U116 ( .A(packet_data[5]), .B(packet_data[3]), .Y(n178) );
  INVX1 U117 ( .A(packet_data[0]), .Y(n177) );
  NAND3X1 U118 ( .A(n179), .B(n19), .C(n180), .Y(n172) );
  NOR2X1 U119 ( .A(rx_dr), .B(n181), .Y(n180) );
  INVX1 U120 ( .A(n109), .Y(n181) );
  NAND2X1 U121 ( .A(n112), .B(n64), .Y(n109) );
  INVX1 U122 ( .A(n86), .Y(n64) );
  NOR2X1 U123 ( .A(n77), .B(byte_strobe), .Y(n112) );
  OAI21X1 U124 ( .A(n165), .B(n158), .C(n141), .Y(n179) );
  INVX1 U125 ( .A(n153), .Y(n141) );
  NAND2X1 U126 ( .A(n147), .B(n136), .Y(n153) );
  NOR2X1 U127 ( .A(n163), .B(n113), .Y(n165) );
  NOR2X1 U128 ( .A(n182), .B(n183), .Y(n170) );
  NAND3X1 U129 ( .A(n184), .B(n185), .C(n186), .Y(n183) );
  MUX2X1 U130 ( .B(n72), .A(n187), .S(crc_right), .Y(n186) );
  INVX1 U131 ( .A(n115), .Y(n187) );
  INVX1 U132 ( .A(n166), .Y(n185) );
  OAI21X1 U133 ( .A(n110), .B(n87), .C(n188), .Y(n166) );
  AOI21X1 U134 ( .A(n189), .B(n190), .C(n70), .Y(n188) );
  NOR2X1 U135 ( .A(n51), .B(n50), .Y(n70) );
  NAND3X1 U136 ( .A(packet_data[6]), .B(n191), .C(n192), .Y(n50) );
  NOR2X1 U137 ( .A(packet_data[2]), .B(n164), .Y(n192) );
  NAND3X1 U138 ( .A(n155), .B(n193), .C(packet_data[5]), .Y(n51) );
  INVX1 U139 ( .A(packet_data[1]), .Y(n193) );
  INVX1 U140 ( .A(n194), .Y(n155) );
  NAND3X1 U141 ( .A(n195), .B(n196), .C(packet_data[0]), .Y(n194) );
  INVX1 U142 ( .A(packet_data[4]), .Y(n196) );
  XOR2X1 U143 ( .A(packet_data[7]), .B(packet_data[3]), .Y(n195) );
  INVX1 U144 ( .A(n123), .Y(n190) );
  NOR2X1 U145 ( .A(eop), .B(byte_strobe), .Y(n189) );
  NAND2X1 U146 ( .A(byte_strobe), .B(n43), .Y(n87) );
  MUX2X1 U147 ( .B(n197), .A(n198), .S(eop), .Y(n184) );
  INVX1 U148 ( .A(n199), .Y(n198) );
  OR2X1 U149 ( .A(n200), .B(n201), .Y(n197) );
  OAI22X1 U150 ( .A(n199), .B(n202), .C(rollover_flag_3), .D(n21), .Y(n201) );
  INVX1 U151 ( .A(d_edge), .Y(n202) );
  OAI21X1 U152 ( .A(byte_strobe), .B(n124), .C(n90), .Y(n200) );
  NAND2X1 U153 ( .A(n60), .B(n13), .Y(n90) );
  INVX1 U154 ( .A(n107), .Y(n60) );
  OAI21X1 U155 ( .A(n203), .B(n204), .C(n147), .Y(n107) );
  NAND2X1 U156 ( .A(n205), .B(buffer_occupancy[6]), .Y(n204) );
  NOR2X1 U157 ( .A(buffer_occupancy[1]), .B(buffer_occupancy[0]), .Y(n205) );
  NAND2X1 U158 ( .A(n206), .B(n207), .Y(n203) );
  NOR2X1 U159 ( .A(buffer_occupancy[5]), .B(buffer_occupancy[4]), .Y(n207) );
  NOR2X1 U160 ( .A(buffer_occupancy[3]), .B(buffer_occupancy[2]), .Y(n206) );
  NAND3X1 U161 ( .A(n208), .B(n24), .C(n209), .Y(n182) );
  AOI21X1 U162 ( .A(addr_right), .B(n140), .C(n210), .Y(n209) );
  INVX1 U163 ( .A(n211), .Y(n24) );
  NAND3X1 U164 ( .A(n212), .B(n213), .C(n214), .Y(n211) );
  NOR2X1 U165 ( .A(n215), .B(n216), .Y(n214) );
  OAI21X1 U166 ( .A(n217), .B(n136), .C(n218), .Y(n216) );
  OAI21X1 U167 ( .A(n219), .B(n220), .C(n221), .Y(n218) );
  OAI21X1 U168 ( .A(n147), .B(n163), .C(n222), .Y(n220) );
  OAI21X1 U169 ( .A(addr_wrong), .B(n54), .C(n223), .Y(n222) );
  OAI21X1 U170 ( .A(n224), .B(n225), .C(n226), .Y(n219) );
  INVX1 U171 ( .A(n191), .Y(n225) );
  AND2X1 U172 ( .A(n126), .B(packet_data[6]), .Y(n224) );
  INVX1 U173 ( .A(packet_data[2]), .Y(n126) );
  INVX1 U174 ( .A(eop), .Y(n136) );
  NOR2X1 U175 ( .A(clk_4_en), .B(n227), .Y(n217) );
  NAND2X1 U176 ( .A(n123), .B(n124), .Y(n227) );
  NAND2X1 U177 ( .A(n137), .B(n191), .Y(n124) );
  NAND2X1 U178 ( .A(n228), .B(n229), .Y(n123) );
  OAI21X1 U179 ( .A(n117), .B(n115), .C(n230), .Y(n215) );
  OAI21X1 U180 ( .A(addr_check), .B(n231), .C(eop_error), .Y(n230) );
  NAND2X1 U181 ( .A(n36), .B(n232), .Y(n115) );
  NOR2X1 U182 ( .A(n54), .B(crc_wrong), .Y(n117) );
  AOI22X1 U183 ( .A(crc_wrong), .B(n72), .C(n158), .D(n54), .Y(n213) );
  INVX1 U184 ( .A(n147), .Y(n54) );
  INVX1 U185 ( .A(n8), .Y(n158) );
  NAND2X1 U186 ( .A(n229), .B(n232), .Y(n8) );
  NOR2X1 U187 ( .A(n233), .B(n113), .Y(n72) );
  AOI22X1 U188 ( .A(n234), .B(n77), .C(addr_wrong), .D(n140), .Y(n212) );
  INVX1 U189 ( .A(n235), .Y(n140) );
  INVX1 U190 ( .A(n43), .Y(n77) );
  NOR2X1 U191 ( .A(bitstuff_error), .B(eop), .Y(n43) );
  INVX1 U192 ( .A(n100), .Y(n208) );
  OAI21X1 U193 ( .A(eop_error), .B(n76), .C(n236), .Y(n100) );
  NAND3X1 U194 ( .A(eop), .B(n147), .C(n237), .Y(n236) );
  INVX1 U195 ( .A(n67), .Y(n237) );
  NAND3X1 U196 ( .A(n221), .B(n139), .C(n223), .Y(n67) );
  INVX1 U197 ( .A(addr_wrong), .Y(n139) );
  NOR2X1 U198 ( .A(bitstuff_error), .B(eop_error), .Y(n147) );
  INVX1 U199 ( .A(n238), .Y(clear_clk) );
  AOI21X1 U200 ( .A(n66), .B(n17), .C(n226), .Y(rx_dr) );
  NAND2X1 U201 ( .A(n20), .B(n88), .Y(flush) );
  INVX1 U202 ( .A(n22), .Y(en_clk_div) );
  NOR3X1 U203 ( .A(n234), .B(n210), .C(n239), .Y(n22) );
  OAI21X1 U204 ( .A(clk_4_en), .B(clear), .C(n240), .Y(n239) );
  OR2X1 U205 ( .A(n241), .B(n242), .Y(clear) );
  NAND3X1 U206 ( .A(n9), .B(n41), .C(n240), .Y(n242) );
  NOR2X1 U207 ( .A(n243), .B(n244), .Y(n240) );
  OAI21X1 U208 ( .A(n226), .B(n66), .C(n245), .Y(n244) );
  AOI22X1 U209 ( .A(n191), .B(n221), .C(n137), .D(n232), .Y(n245) );
  NAND3X1 U210 ( .A(n61), .B(n20), .C(n246), .Y(n243) );
  NOR2X1 U211 ( .A(store_rx_data), .B(n231), .Y(n246) );
  INVX1 U212 ( .A(n35), .Y(n231) );
  NAND2X1 U213 ( .A(n143), .B(n221), .Y(n35) );
  NOR2X1 U214 ( .A(n17), .B(n233), .Y(store_rx_data) );
  NAND2X1 U215 ( .A(n221), .B(n63), .Y(n20) );
  INVX1 U216 ( .A(n13), .Y(n61) );
  NOR2X1 U217 ( .A(n233), .B(n66), .Y(n13) );
  INVX1 U218 ( .A(n247), .Y(n9) );
  OAI21X1 U219 ( .A(n113), .B(n226), .C(n44), .Y(n247) );
  NAND3X1 U220 ( .A(n145), .B(n238), .C(n78), .Y(n241) );
  INVX1 U221 ( .A(n21), .Y(clk_4_en) );
  NAND2X1 U222 ( .A(n228), .B(n137), .Y(n21) );
  NAND3X1 U223 ( .A(n41), .B(n159), .C(n248), .Y(n210) );
  AND2X1 U224 ( .A(n40), .B(n44), .Y(n248) );
  NAND2X1 U225 ( .A(n223), .B(n229), .Y(n44) );
  NAND2X1 U226 ( .A(n221), .B(n232), .Y(n159) );
  INVX1 U227 ( .A(n16), .Y(n232) );
  NAND3X1 U228 ( .A(state[2]), .B(n249), .C(state[4]), .Y(n16) );
  NAND2X1 U229 ( .A(n191), .B(n36), .Y(n41) );
  NAND3X1 U230 ( .A(n10), .B(n7), .C(n250), .Y(n234) );
  AND2X1 U231 ( .A(n110), .B(n86), .Y(n250) );
  NAND2X1 U232 ( .A(n137), .B(n223), .Y(n86) );
  NAND2X1 U233 ( .A(n223), .B(n36), .Y(n110) );
  NOR2X1 U234 ( .A(n251), .B(n39), .Y(n223) );
  AOI21X1 U235 ( .A(n229), .B(n63), .C(n92), .Y(n7) );
  NOR2X1 U236 ( .A(n66), .B(n163), .Y(n92) );
  INVX1 U237 ( .A(n252), .Y(n10) );
  NAND3X1 U238 ( .A(n145), .B(n88), .C(n78), .Y(n252) );
  NAND2X1 U239 ( .A(n138), .B(n36), .Y(n78) );
  NAND2X1 U240 ( .A(n191), .B(n229), .Y(n88) );
  INVX1 U241 ( .A(n113), .Y(n229) );
  NOR2X1 U242 ( .A(n251), .B(state[4]), .Y(n191) );
  NAND3X1 U243 ( .A(n38), .B(n253), .C(state[2]), .Y(n251) );
  INVX1 U244 ( .A(n93), .Y(n145) );
  NOR2X1 U245 ( .A(n17), .B(n163), .Y(n93) );
  NAND3X1 U246 ( .A(n37), .B(n39), .C(n249), .Y(n163) );
  OAI21X1 U247 ( .A(n113), .B(n114), .C(n76), .Y(crc_check) );
  OR2X1 U248 ( .A(n233), .B(n164), .Y(n76) );
  NAND3X1 U249 ( .A(n249), .B(n39), .C(state[2]), .Y(n233) );
  NAND2X1 U250 ( .A(state[1]), .B(state[0]), .Y(n113) );
  NAND2X1 U251 ( .A(n40), .B(n238), .Y(clear_4clk) );
  NOR2X1 U252 ( .A(n14), .B(n254), .Y(n238) );
  INVX1 U253 ( .A(n19), .Y(n254) );
  NAND2X1 U254 ( .A(n143), .B(n137), .Y(n19) );
  INVX1 U255 ( .A(n17), .Y(n137) );
  INVX1 U256 ( .A(n29), .Y(n143) );
  NAND3X1 U257 ( .A(state[5]), .B(n37), .C(n255), .Y(n29) );
  NOR2X1 U258 ( .A(state[4]), .B(state[3]), .Y(n255) );
  OAI21X1 U259 ( .A(n226), .B(n17), .C(n199), .Y(n14) );
  INVX1 U260 ( .A(n63), .Y(n226) );
  NOR2X1 U261 ( .A(n256), .B(n39), .Y(n63) );
  INVX1 U262 ( .A(state[4]), .Y(n39) );
  NAND2X1 U263 ( .A(n228), .B(n221), .Y(n40) );
  OAI21X1 U264 ( .A(n17), .B(n114), .C(n235), .Y(addr_check) );
  NAND2X1 U265 ( .A(n138), .B(n221), .Y(n235) );
  INVX1 U266 ( .A(n164), .Y(n221) );
  NAND2X1 U267 ( .A(state[1]), .B(n257), .Y(n164) );
  INVX1 U268 ( .A(n114), .Y(n138) );
  NAND3X1 U269 ( .A(n249), .B(n37), .C(state[4]), .Y(n114) );
  NOR2X1 U270 ( .A(n38), .B(state[5]), .Y(n249) );
  NAND2X1 U271 ( .A(state[0]), .B(n258), .Y(n17) );
  AND2X1 U272 ( .A(NRZI_en), .B(n199), .Y(N723) );
  NAND2X1 U273 ( .A(n228), .B(n36), .Y(n199) );
  INVX1 U274 ( .A(n66), .Y(n36) );
  NAND2X1 U275 ( .A(n257), .B(n258), .Y(n66) );
  INVX1 U276 ( .A(state[1]), .Y(n258) );
  INVX1 U277 ( .A(state[0]), .Y(n257) );
  NOR2X1 U278 ( .A(n256), .B(state[4]), .Y(n228) );
  NAND3X1 U279 ( .A(n38), .B(n253), .C(n37), .Y(n256) );
  INVX1 U280 ( .A(state[2]), .Y(n37) );
  INVX1 U281 ( .A(state[5]), .Y(n253) );
  INVX1 U282 ( .A(state[3]), .Y(n38) );
  OR2X1 U283 ( .A(clk_div), .B(rollover_flag_3), .Y(NRZI_en) );
endmodule


module flex_sr ( clk, n_rst, shift_enable, load_enable, serial_in, parallel_in, 
        serial_out, parallel_out );
  input [7:0] parallel_in;
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, load_enable, serial_in;
  output serial_out;
  wire   \next_parallel_out[0] , n31, n32, n33, n34, n35, n36, n37, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30;

  DFFSR \parallel_out_reg[7]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n37), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(\next_parallel_out[0] ), .CLK(clk), .R(1'b1), .S(n_rst), .Q(parallel_out[0]) );
  DFFSR serial_out_reg ( .D(\next_parallel_out[0] ), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(serial_out) );
  OAI21X1 U12 ( .A(n10), .B(n11), .C(n12), .Y(\next_parallel_out[0] ) );
  MUX2X1 U13 ( .B(parallel_in[0]), .A(n13), .S(n14), .Y(n12) );
  AND2X1 U14 ( .A(parallel_out[1]), .B(shift_enable), .Y(n13) );
  INVX1 U15 ( .A(parallel_out[0]), .Y(n11) );
  INVX1 U16 ( .A(n15), .Y(n10) );
  OAI21X1 U17 ( .A(n14), .B(n16), .C(n17), .Y(n37) );
  AOI22X1 U18 ( .A(parallel_out[3]), .B(n18), .C(parallel_out[2]), .D(n15), 
        .Y(n17) );
  INVX1 U19 ( .A(parallel_in[2]), .Y(n16) );
  OAI21X1 U20 ( .A(n14), .B(n19), .C(n20), .Y(n36) );
  AOI22X1 U21 ( .A(parallel_out[4]), .B(n18), .C(parallel_out[3]), .D(n15), 
        .Y(n20) );
  INVX1 U22 ( .A(parallel_in[3]), .Y(n19) );
  OAI21X1 U23 ( .A(n14), .B(n21), .C(n22), .Y(n35) );
  AOI22X1 U24 ( .A(parallel_out[5]), .B(n18), .C(parallel_out[4]), .D(n15), 
        .Y(n22) );
  INVX1 U25 ( .A(parallel_in[4]), .Y(n21) );
  OAI21X1 U26 ( .A(n14), .B(n23), .C(n24), .Y(n34) );
  AOI22X1 U27 ( .A(parallel_out[6]), .B(n18), .C(parallel_out[5]), .D(n15), 
        .Y(n24) );
  INVX1 U28 ( .A(parallel_in[5]), .Y(n23) );
  OAI21X1 U29 ( .A(n14), .B(n25), .C(n26), .Y(n33) );
  AOI22X1 U30 ( .A(parallel_out[7]), .B(n18), .C(parallel_out[6]), .D(n15), 
        .Y(n26) );
  INVX1 U31 ( .A(parallel_in[6]), .Y(n25) );
  OAI21X1 U32 ( .A(n14), .B(n27), .C(n28), .Y(n32) );
  AOI22X1 U33 ( .A(serial_in), .B(n18), .C(parallel_out[7]), .D(n15), .Y(n28)
         );
  INVX1 U34 ( .A(parallel_in[7]), .Y(n27) );
  OAI21X1 U35 ( .A(n14), .B(n29), .C(n30), .Y(n31) );
  AOI22X1 U36 ( .A(parallel_out[2]), .B(n18), .C(parallel_out[1]), .D(n15), 
        .Y(n30) );
  NOR2X1 U37 ( .A(n15), .B(load_enable), .Y(n18) );
  NOR2X1 U38 ( .A(load_enable), .B(shift_enable), .Y(n15) );
  INVX1 U39 ( .A(parallel_in[1]), .Y(n29) );
  INVX1 U40 ( .A(load_enable), .Y(n14) );
endmodule


module flex_counter_SIZE4_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        rollover_flag, count_out );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n1, n2, n3, n4, n5, n6, n7, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(N11) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U10 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n4) );
  OAI21X1 U11 ( .A(n5), .B(n6), .C(n7), .Y(next_count[1]) );
  NAND3X1 U12 ( .A(n13), .B(n5), .C(n14), .Y(n7) );
  OAI21X1 U13 ( .A(n15), .B(n16), .C(n17), .Y(n6) );
  NOR2X1 U14 ( .A(n13), .B(n18), .Y(n15) );
  XNOR2X1 U15 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n3) );
  OAI21X1 U16 ( .A(n19), .B(n20), .C(n21), .Y(next_count[2]) );
  NAND3X1 U17 ( .A(n22), .B(n19), .C(n14), .Y(n21) );
  OAI21X1 U18 ( .A(n23), .B(n16), .C(n17), .Y(n20) );
  NOR2X1 U19 ( .A(n22), .B(n18), .Y(n23) );
  NAND2X1 U20 ( .A(n24), .B(n25), .Y(n1) );
  XNOR2X1 U21 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n25) );
  OAI21X1 U22 ( .A(n13), .B(n26), .C(n27), .Y(next_count[0]) );
  NAND3X1 U23 ( .A(n17), .B(n16), .C(count_out[0]), .Y(n27) );
  XNOR2X1 U24 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n24) );
  OAI21X1 U25 ( .A(n28), .B(n26), .C(n29), .Y(next_count[3]) );
  NAND3X1 U26 ( .A(n17), .B(n16), .C(count_out[3]), .Y(n29) );
  INVX1 U27 ( .A(clear), .Y(n17) );
  INVX1 U28 ( .A(n14), .Y(n26) );
  NOR2X1 U29 ( .A(n16), .B(clear), .Y(n14) );
  INVX1 U30 ( .A(count_enable), .Y(n16) );
  AOI22X1 U31 ( .A(count_out[3]), .B(n30), .C(n22), .D(count_out[2]), .Y(n28)
         );
  AND2X1 U32 ( .A(n13), .B(count_out[1]), .Y(n22) );
  NOR2X1 U33 ( .A(n31), .B(n18), .Y(n13) );
  INVX1 U34 ( .A(n30), .Y(n18) );
  OAI22X1 U35 ( .A(n32), .B(n33), .C(count_out[3]), .D(n34), .Y(n30) );
  OAI21X1 U36 ( .A(n35), .B(n19), .C(n36), .Y(n33) );
  OAI21X1 U37 ( .A(n37), .B(count_out[2]), .C(n38), .Y(n36) );
  INVX1 U38 ( .A(rollover_val[2]), .Y(n38) );
  INVX1 U39 ( .A(count_out[2]), .Y(n19) );
  INVX1 U40 ( .A(n37), .Y(n35) );
  AOI22X1 U41 ( .A(n5), .B(rollover_val[1]), .C(rollover_val[0]), .D(n39), .Y(
        n37) );
  INVX1 U42 ( .A(n40), .Y(n39) );
  OAI21X1 U43 ( .A(rollover_val[1]), .B(n5), .C(n31), .Y(n40) );
  INVX1 U44 ( .A(count_out[0]), .Y(n31) );
  INVX1 U45 ( .A(count_out[1]), .Y(n5) );
  AND2X1 U46 ( .A(n34), .B(count_out[3]), .Y(n32) );
  INVX1 U47 ( .A(rollover_val[3]), .Y(n34) );
endmodule


module flex_counter_SIZE3_1 ( clk, n_rst, clear, count_enable, rollover_val, 
        rollover_flag, count_out );
  input [2:0] rollover_val;
  output [2:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N10, n1, n2, n3, n4, n5, n6, n7, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;
  wire   [2:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR rollover_flag_reg ( .D(N10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U7 ( .A(n1), .B(n2), .Y(N10) );
  NAND2X1 U8 ( .A(n3), .B(n4), .Y(n2) );
  XNOR2X1 U9 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n4) );
  OAI21X1 U10 ( .A(n5), .B(n6), .C(n7), .Y(next_count[2]) );
  NAND3X1 U11 ( .A(n12), .B(count_out[1]), .C(n13), .Y(n7) );
  OAI21X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n6) );
  XNOR2X1 U13 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n3) );
  OAI21X1 U14 ( .A(n17), .B(n18), .C(n19), .Y(next_count[1]) );
  NAND3X1 U15 ( .A(n12), .B(n17), .C(n13), .Y(n19) );
  NAND2X1 U16 ( .A(n20), .B(n16), .Y(n18) );
  OAI21X1 U17 ( .A(n13), .B(n21), .C(count_enable), .Y(n20) );
  XOR2X1 U18 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n1) );
  OAI21X1 U19 ( .A(n13), .B(n22), .C(n23), .Y(next_count[0]) );
  NAND3X1 U20 ( .A(n16), .B(n15), .C(count_out[0]), .Y(n23) );
  INVX1 U21 ( .A(clear), .Y(n16) );
  INVX1 U22 ( .A(n12), .Y(n22) );
  NOR2X1 U23 ( .A(n15), .B(clear), .Y(n12) );
  INVX1 U24 ( .A(count_enable), .Y(n15) );
  AND2X1 U25 ( .A(count_out[0]), .B(n14), .Y(n13) );
  INVX1 U26 ( .A(n21), .Y(n14) );
  OAI21X1 U27 ( .A(rollover_val[2]), .B(n5), .C(n24), .Y(n21) );
  OAI21X1 U28 ( .A(count_out[2]), .B(n25), .C(n26), .Y(n24) );
  AOI22X1 U29 ( .A(n27), .B(rollover_val[0]), .C(rollover_val[1]), .D(n17), 
        .Y(n26) );
  INVX1 U30 ( .A(count_out[1]), .Y(n17) );
  AOI21X1 U31 ( .A(count_out[1]), .B(n28), .C(count_out[0]), .Y(n27) );
  INVX1 U32 ( .A(rollover_val[1]), .Y(n28) );
  INVX1 U33 ( .A(rollover_val[2]), .Y(n25) );
  INVX1 U34 ( .A(count_out[2]), .Y(n5) );
endmodule


module flex_counter_SIZE8_DW01_inc_0_DW01_inc_8 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module flex_counter_SIZE8 ( clk, n_rst, clear, count_enable, rollover_val, 
        rollover_flag, count_out );
  input [7:0] rollover_val;
  output [7:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N19, N20, N21, N22, N23,
         N24, N25, N26, \eq_32/B[0] , \eq_32/B[1] , \eq_32/B[2] , \eq_32/B[3] ,
         \eq_32/B[4] , \eq_32/B[5] , \eq_32/B[6] , \eq_32/B[7] , n1, n2, n3,
         n4, n5, n6, n7, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60;

  DFFSR \count_out_reg[0]  ( .D(\eq_32/B[0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(\eq_32/B[1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(\eq_32/B[2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(\eq_32/B[3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(\eq_32/B[4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(\eq_32/B[5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(\eq_32/B[6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(\eq_32/B[7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_SIZE8_DW01_inc_0_DW01_inc_8 add_26_aco ( .A({N26, N25, N24, N23, 
        N22, N21, N20, N19}), .SUM({N14, N13, N12, N11, N10, N9, N8, N7}) );
  NOR2X1 U5 ( .A(n1), .B(n2), .Y(N26) );
  NOR2X1 U6 ( .A(n1), .B(n3), .Y(N25) );
  NOR2X1 U7 ( .A(n1), .B(n4), .Y(N24) );
  NOR2X1 U15 ( .A(n1), .B(n5), .Y(N23) );
  NOR2X1 U16 ( .A(n1), .B(n6), .Y(N22) );
  NOR2X1 U17 ( .A(n1), .B(n7), .Y(N21) );
  NOR2X1 U18 ( .A(n1), .B(n17), .Y(N20) );
  NOR2X1 U19 ( .A(n1), .B(n18), .Y(N19) );
  AOI22X1 U20 ( .A(n19), .B(n20), .C(n2), .D(rollover_val[7]), .Y(n1) );
  AOI21X1 U21 ( .A(count_out[6]), .B(n21), .C(n22), .Y(n20) );
  AOI21X1 U22 ( .A(n23), .B(n3), .C(rollover_val[6]), .Y(n22) );
  INVX1 U23 ( .A(n23), .Y(n21) );
  OAI21X1 U24 ( .A(count_out[5]), .B(n24), .C(n25), .Y(n23) );
  OAI21X1 U25 ( .A(n26), .B(n4), .C(rollover_val[5]), .Y(n25) );
  INVX1 U26 ( .A(n24), .Y(n26) );
  OAI21X1 U27 ( .A(n5), .B(n27), .C(n28), .Y(n24) );
  INVX1 U28 ( .A(n29), .Y(n28) );
  AOI21X1 U29 ( .A(n27), .B(n5), .C(rollover_val[4]), .Y(n29) );
  OAI21X1 U30 ( .A(count_out[3]), .B(n30), .C(n31), .Y(n27) );
  OAI21X1 U31 ( .A(rollover_val[2]), .B(n7), .C(n32), .Y(n31) );
  AOI21X1 U32 ( .A(count_out[3]), .B(n30), .C(n33), .Y(n32) );
  AOI21X1 U33 ( .A(rollover_val[2]), .B(n7), .C(n34), .Y(n33) );
  OAI22X1 U34 ( .A(count_out[1]), .B(n35), .C(n36), .D(n37), .Y(n34) );
  OAI21X1 U35 ( .A(rollover_val[1]), .B(n17), .C(n18), .Y(n37) );
  INVX1 U36 ( .A(rollover_val[0]), .Y(n36) );
  INVX1 U37 ( .A(rollover_val[1]), .Y(n35) );
  OR2X1 U38 ( .A(rollover_val[7]), .B(n2), .Y(n19) );
  NOR2X1 U39 ( .A(n38), .B(n39), .Y(N15) );
  NAND3X1 U40 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  NOR2X1 U41 ( .A(n43), .B(n44), .Y(n42) );
  XOR2X1 U42 ( .A(rollover_val[4]), .B(\eq_32/B[4] ), .Y(n44) );
  OAI21X1 U43 ( .A(n45), .B(n5), .C(n46), .Y(\eq_32/B[4] ) );
  NAND2X1 U44 ( .A(N11), .B(n47), .Y(n46) );
  INVX1 U45 ( .A(count_out[4]), .Y(n5) );
  XNOR2X1 U46 ( .A(n30), .B(\eq_32/B[3] ), .Y(n43) );
  OAI21X1 U47 ( .A(n45), .B(n6), .C(n48), .Y(\eq_32/B[3] ) );
  NAND2X1 U48 ( .A(N10), .B(n47), .Y(n48) );
  INVX1 U49 ( .A(count_out[3]), .Y(n6) );
  INVX1 U50 ( .A(rollover_val[3]), .Y(n30) );
  XNOR2X1 U51 ( .A(rollover_val[5]), .B(\eq_32/B[5] ), .Y(n41) );
  OAI21X1 U52 ( .A(n45), .B(n4), .C(n49), .Y(\eq_32/B[5] ) );
  NAND2X1 U53 ( .A(N12), .B(n47), .Y(n49) );
  INVX1 U54 ( .A(count_out[5]), .Y(n4) );
  XNOR2X1 U55 ( .A(rollover_val[6]), .B(\eq_32/B[6] ), .Y(n40) );
  OAI21X1 U56 ( .A(n45), .B(n3), .C(n50), .Y(\eq_32/B[6] ) );
  NAND2X1 U57 ( .A(N13), .B(n47), .Y(n50) );
  INVX1 U58 ( .A(count_out[6]), .Y(n3) );
  NAND3X1 U59 ( .A(n51), .B(n52), .C(n53), .Y(n38) );
  NOR2X1 U60 ( .A(n54), .B(n55), .Y(n53) );
  XOR2X1 U61 ( .A(rollover_val[1]), .B(\eq_32/B[1] ), .Y(n55) );
  OAI21X1 U62 ( .A(n45), .B(n17), .C(n56), .Y(\eq_32/B[1] ) );
  NAND2X1 U63 ( .A(N8), .B(n47), .Y(n56) );
  INVX1 U64 ( .A(count_out[1]), .Y(n17) );
  XOR2X1 U65 ( .A(rollover_val[0]), .B(\eq_32/B[0] ), .Y(n54) );
  OAI21X1 U66 ( .A(n45), .B(n18), .C(n57), .Y(\eq_32/B[0] ) );
  NAND2X1 U67 ( .A(N7), .B(n47), .Y(n57) );
  INVX1 U68 ( .A(count_out[0]), .Y(n18) );
  XNOR2X1 U69 ( .A(rollover_val[2]), .B(\eq_32/B[2] ), .Y(n52) );
  OAI21X1 U70 ( .A(n45), .B(n7), .C(n58), .Y(\eq_32/B[2] ) );
  NAND2X1 U71 ( .A(N9), .B(n47), .Y(n58) );
  INVX1 U72 ( .A(count_out[2]), .Y(n7) );
  XNOR2X1 U73 ( .A(rollover_val[7]), .B(\eq_32/B[7] ), .Y(n51) );
  OAI21X1 U74 ( .A(n45), .B(n2), .C(n59), .Y(\eq_32/B[7] ) );
  NAND2X1 U75 ( .A(N14), .B(n47), .Y(n59) );
  NOR2X1 U76 ( .A(n60), .B(clear), .Y(n47) );
  INVX1 U77 ( .A(count_enable), .Y(n60) );
  INVX1 U78 ( .A(count_out[7]), .Y(n2) );
  OR2X1 U79 ( .A(count_enable), .B(clear), .Y(n45) );
endmodule


module usb_rx ( clk, n_rst, dp_in, dm_in, crc_right, crc_wrong, bitstuff_error, 
        buffer_occupancy, RX_data_ready, RX_transfer_active, RX_error, flush, 
        store_RX_packet_data, RX_packet, RX_packet_data );
  input [6:0] buffer_occupancy;
  output [2:0] RX_packet;
  output [7:0] RX_packet_data;
  input clk, n_rst, dp_in, dm_in, crc_right, crc_wrong, bitstuff_error;
  output RX_data_ready, RX_transfer_active, RX_error, flush,
         store_RX_packet_data;
  wire   dp_in_sync, dm_in_sync, eop, eop_error, clear, EOP_en, clear_clk,
         _0_net_, readjust, clk_div, en_clk_div, d_edge, d_orig, NRZI_en,
         shift_in, store_data, send_packet, addr_right, addr_wrong, addr_check,
         store_packet, byte_strobe, shift_enable, count_en, rollover_flag_3,
         clk_4_en, clear_4clk, clear_diff_count, n3;
  wire   [7:0] packet_data;

  DFFSR clear_diff_count_reg ( .D(readjust), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(clear_diff_count) );
  sync_RST_VAL1 DPIN ( .clk(clk), .n_rst(n_rst), .async_in(dp_in), .sync_out(
        dp_in_sync) );
  sync_RST_VAL0 DMIN ( .clk(clk), .n_rst(n_rst), .async_in(dm_in), .sync_out(
        dm_in_sync) );
  EOP_det EOP ( .clk(clk), .n_rst(n_rst), .en(EOP_en), .dp_in(dp_in_sync), 
        .dm_in(dm_in_sync), .clear(clear), .eop(eop), .eop_error(eop_error) );
  clk_div_rx TWLV_MHZ ( .clk(clk), .n_rst(n_rst), .counter_clear(clear_clk), 
        .en_clk_div(_0_net_), .readjust(readjust), .clk_divider(clk_div) );
  NRZI_decoder NRZI ( .clk(clk), .n_rst(n_rst), .en(NRZI_en), .dp_in(
        dp_in_sync), .d_orig(d_orig), .d_edge(d_edge) );
  data_reg BUFF ( .clk(clk), .n_rst(n_rst), .shift_in(shift_in), .store_data(
        store_data), .flush(flush), .send_packet(send_packet), .store_packet(
        store_packet), .addr_check(addr_check), .packet_data(packet_data), 
        .rx_packet(RX_packet), .rx_packet_data(RX_packet_data), .addr_right(
        addr_right), .addr_wrong(addr_wrong) );
  rx_controller RX_CONTROLLER ( .clk(clk), .n_rst(n_rst), .clk_div(clk_div), 
        .byte_strobe(byte_strobe), .bitstuff_error(bitstuff_error), .d_edge(
        d_edge), .buffer_occupancy(buffer_occupancy), .packet_data(packet_data), .eop(eop), .eop_error(eop_error), .crc_right(crc_right), .crc_wrong(
        crc_wrong), .addr_right(addr_right), .addr_wrong(addr_wrong), 
        .rollover_flag_3(rollover_flag_3), .flush(flush), .rx_error(RX_error), 
        .rx_dr(RX_data_ready), .rx_busy(RX_transfer_active), .store_rx_data(
        store_RX_packet_data), .en_clk_div(en_clk_div), .addr_check(addr_check), .clk_4_en(clk_4_en), .store_data(store_data), .shift_in(shift_in), 
        .send_packet(send_packet), .store_packet(store_packet), .clear(clear), 
        .shift_en(shift_enable), .clear_clk(clear_clk), .count_en(count_en), 
        .EOP_en(EOP_en), .NRZI_en(NRZI_en), .clear_4clk(clear_4clk) );
  flex_sr STP8 ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .load_enable(1'b0), .serial_in(d_orig), .parallel_in({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .parallel_out(packet_data) );
  flex_counter_SIZE4_1 BYTE_COUNTS ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(count_en), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .rollover_flag(byte_strobe) );
  flex_counter_SIZE3_1 FOUR_clk ( .clk(clk), .n_rst(n_rst), .clear(clear_4clk), 
        .count_enable(clk_4_en), .rollover_val({1'b0, 1'b1, 1'b0}), 
        .rollover_flag(rollover_flag_3) );
  flex_counter_SIZE8 DIV_COUNT ( .clk(clk), .n_rst(n_rst), .clear(
        clear_diff_count), .count_enable(clk_div), .rollover_val({1'b0, 1'b0, 
        1'b1, 1'b0, 1'b1, 1'b1, 1'b0, 1'b1}), .rollover_flag(readjust) );
  NOR2X1 U6 ( .A(readjust), .B(n3), .Y(_0_net_) );
  INVX1 U7 ( .A(en_clk_div), .Y(n3) );
endmodule

