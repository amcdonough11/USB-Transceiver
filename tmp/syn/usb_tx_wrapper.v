/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Thu May  1 17:21:07 2025
/////////////////////////////////////////////////////////////


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


module flex_counter_SIZE3 ( clk, n_rst, clear, count_enable, rollover_val, 
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


module clk_div ( clk, n_rst, counter_clear, en_clk_div, clk_divider );
  input clk, n_rst, counter_clear, en_clk_div;
  output clk_divider;
  wire   cnt_en, c8_rollover_flag, c3_rollover_flag, n_cnt_en, n2, n3, n4, n5,
         n6, n7, n8;
  wire   [3:0] zero;

  DFFSR cnt_en_reg ( .D(n_cnt_en), .CLK(clk), .R(n_rst), .S(1'b1), .Q(cnt_en)
         );
  flex_counter_SIZE4_0 counter8 ( .clk(clk), .n_rst(n_rst), .clear(
        counter_clear), .count_enable(cnt_en), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(c8_rollover_flag), .count_out(zero) );
  flex_counter_SIZE3 counter3 ( .clk(clk), .n_rst(n_rst), .clear(counter_clear), .count_enable(c8_rollover_flag), .rollover_val({1'b0, 1'b1, 1'b1}), 
        .rollover_flag(c3_rollover_flag) );
  AOI21X1 U4 ( .A(n2), .B(cnt_en), .C(n3), .Y(n_cnt_en) );
  AND2X1 U5 ( .A(c3_rollover_flag), .B(c8_rollover_flag), .Y(n2) );
  NOR2X1 U6 ( .A(n3), .B(n4), .Y(clk_divider) );
  OAI21X1 U7 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  OAI21X1 U8 ( .A(c3_rollover_flag), .B(n8), .C(cnt_en), .Y(n7) );
  INVX1 U9 ( .A(c8_rollover_flag), .Y(n8) );
  OR2X1 U10 ( .A(zero[1]), .B(zero[0]), .Y(n6) );
  OR2X1 U11 ( .A(zero[3]), .B(zero[2]), .Y(n5) );
  INVX1 U12 ( .A(en_clk_div), .Y(n3) );
endmodule


module nrzi_encoder ( data, encoded_data );
  input [7:0] data;
  output [7:0] encoded_data;

  assign encoded_data[7] = data[7];

  XNOR2X1 U1 ( .A(encoded_data[1]), .B(data[0]), .Y(encoded_data[0]) );
  XNOR2X1 U2 ( .A(encoded_data[2]), .B(data[1]), .Y(encoded_data[1]) );
  XNOR2X1 U3 ( .A(encoded_data[3]), .B(data[2]), .Y(encoded_data[2]) );
  XNOR2X1 U4 ( .A(encoded_data[4]), .B(data[3]), .Y(encoded_data[3]) );
  XNOR2X1 U5 ( .A(encoded_data[5]), .B(data[4]), .Y(encoded_data[4]) );
  XNOR2X1 U6 ( .A(encoded_data[6]), .B(data[5]), .Y(encoded_data[5]) );
  XNOR2X1 U7 ( .A(data[7]), .B(data[6]), .Y(encoded_data[6]) );
endmodule


module flex_sr_SIZE8_MSB_FIRST1 ( clk, n_rst, shift_enable, load_enable, 
        serial_in, parallel_in, serial_out, parallel_out );
  input [7:0] parallel_in;
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, load_enable, serial_in;
  output serial_out;
  wire   \next_parallel_out[7] , n31, n32, n33, n34, n35, n36, n37, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30;

  DFFSR \parallel_out_reg[0]  ( .D(n37), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  DFFSR \parallel_out_reg[1]  ( .D(n36), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[2]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[3]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[4]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[5]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[6]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR serial_out_reg ( .D(\next_parallel_out[7] ), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(serial_out) );
  DFFSR \parallel_out_reg[7]  ( .D(\next_parallel_out[7] ), .CLK(clk), .R(1'b1), .S(n_rst), .Q(parallel_out[7]) );
  OAI21X1 U12 ( .A(n10), .B(n11), .C(n12), .Y(\next_parallel_out[7] ) );
  MUX2X1 U13 ( .B(parallel_in[7]), .A(n13), .S(n14), .Y(n12) );
  AND2X1 U14 ( .A(parallel_out[6]), .B(shift_enable), .Y(n13) );
  INVX1 U15 ( .A(parallel_out[7]), .Y(n11) );
  INVX1 U16 ( .A(n15), .Y(n10) );
  OAI21X1 U17 ( .A(n14), .B(n16), .C(n17), .Y(n37) );
  AOI22X1 U18 ( .A(serial_in), .B(n18), .C(parallel_out[0]), .D(n15), .Y(n17)
         );
  INVX1 U19 ( .A(parallel_in[0]), .Y(n16) );
  OAI21X1 U20 ( .A(n14), .B(n19), .C(n20), .Y(n36) );
  AOI22X1 U21 ( .A(parallel_out[0]), .B(n18), .C(parallel_out[1]), .D(n15), 
        .Y(n20) );
  INVX1 U22 ( .A(parallel_in[1]), .Y(n19) );
  OAI21X1 U23 ( .A(n14), .B(n21), .C(n22), .Y(n35) );
  AOI22X1 U24 ( .A(parallel_out[1]), .B(n18), .C(parallel_out[2]), .D(n15), 
        .Y(n22) );
  INVX1 U25 ( .A(parallel_in[2]), .Y(n21) );
  OAI21X1 U26 ( .A(n14), .B(n23), .C(n24), .Y(n34) );
  AOI22X1 U27 ( .A(parallel_out[2]), .B(n18), .C(parallel_out[3]), .D(n15), 
        .Y(n24) );
  INVX1 U28 ( .A(parallel_in[3]), .Y(n23) );
  OAI21X1 U29 ( .A(n14), .B(n25), .C(n26), .Y(n33) );
  AOI22X1 U30 ( .A(parallel_out[3]), .B(n18), .C(parallel_out[4]), .D(n15), 
        .Y(n26) );
  INVX1 U31 ( .A(parallel_in[4]), .Y(n25) );
  OAI21X1 U32 ( .A(n14), .B(n27), .C(n28), .Y(n32) );
  AOI22X1 U33 ( .A(parallel_out[4]), .B(n18), .C(parallel_out[5]), .D(n15), 
        .Y(n28) );
  INVX1 U34 ( .A(parallel_in[5]), .Y(n27) );
  OAI21X1 U35 ( .A(n14), .B(n29), .C(n30), .Y(n31) );
  AOI22X1 U36 ( .A(parallel_out[5]), .B(n18), .C(parallel_out[6]), .D(n15), 
        .Y(n30) );
  NOR2X1 U37 ( .A(n15), .B(load_enable), .Y(n18) );
  NOR2X1 U38 ( .A(load_enable), .B(shift_enable), .Y(n15) );
  INVX1 U39 ( .A(parallel_in[6]), .Y(n29) );
  INVX1 U40 ( .A(load_enable), .Y(n14) );
endmodule


module usb_tx_fsm ( clk, n_rst, c8bit_rollover_flag, clk_div, tx_packet, 
        buff_occupancy, encoded_tx_packet_data, pidbyte, packet_done, 
        get_tx_packet_data, tx_transfer_active, clear, counter_clear, 
        bit_counter_en, DP_OUT, DM_OUT );
  input [2:0] tx_packet;
  input [6:0] buff_occupancy;
  input [7:0] encoded_tx_packet_data;
  input [7:0] pidbyte;
  input clk, n_rst, c8bit_rollover_flag, clk_div;
  output packet_done, get_tx_packet_data, tx_transfer_active, clear,
         counter_clear, bit_counter_en, DP_OUT, DM_OUT;
  wire   load_enable, serial_out_sr, n135, n136, n137, n138, n139, n1, n2, n3,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129;
  wire   [4:0] state;
  wire   [7:0] parallel_in;

  DFFSR \state_reg[0]  ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[3]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[4]  ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4]) );
  flex_sr_SIZE8_MSB_FIRST1 bit8sr ( .clk(clk), .n_rst(n_rst), .shift_enable(
        n128), .load_enable(load_enable), .serial_in(1'b0), .parallel_in({
        parallel_in[7:4], n129, parallel_in[2:0]}), .serial_out(serial_out_sr)
         );
  NAND3X1 U8 ( .A(n1), .B(n2), .C(n3), .Y(tx_transfer_active) );
  NOR2X1 U9 ( .A(n9), .B(n10), .Y(n3) );
  NOR2X1 U10 ( .A(bit_counter_en), .B(n11), .Y(n1) );
  NAND3X1 U11 ( .A(n12), .B(n13), .C(n14), .Y(parallel_in[7]) );
  AOI22X1 U12 ( .A(encoded_tx_packet_data[7]), .B(get_tx_packet_data), .C(
        pidbyte[7]), .D(n15), .Y(n14) );
  OAI21X1 U13 ( .A(n16), .B(n17), .C(n18), .Y(parallel_in[6]) );
  AOI21X1 U14 ( .A(encoded_tx_packet_data[6]), .B(get_tx_packet_data), .C(n19), 
        .Y(n18) );
  INVX1 U15 ( .A(pidbyte[6]), .Y(n17) );
  OAI21X1 U16 ( .A(n16), .B(n20), .C(n21), .Y(parallel_in[5]) );
  AOI21X1 U17 ( .A(encoded_tx_packet_data[5]), .B(get_tx_packet_data), .C(n22), 
        .Y(n21) );
  INVX1 U18 ( .A(pidbyte[5]), .Y(n20) );
  NAND3X1 U19 ( .A(n23), .B(n24), .C(n25), .Y(parallel_in[4]) );
  AOI22X1 U20 ( .A(encoded_tx_packet_data[4]), .B(get_tx_packet_data), .C(
        pidbyte[4]), .D(n15), .Y(n25) );
  OAI21X1 U21 ( .A(n16), .B(n26), .C(n27), .Y(parallel_in[2]) );
  AOI21X1 U22 ( .A(encoded_tx_packet_data[2]), .B(get_tx_packet_data), .C(n19), 
        .Y(n27) );
  INVX1 U23 ( .A(pidbyte[2]), .Y(n26) );
  OAI21X1 U24 ( .A(n16), .B(n28), .C(n29), .Y(parallel_in[1]) );
  AOI21X1 U25 ( .A(encoded_tx_packet_data[1]), .B(get_tx_packet_data), .C(n22), 
        .Y(n29) );
  INVX1 U26 ( .A(n30), .Y(n22) );
  INVX1 U27 ( .A(pidbyte[1]), .Y(n28) );
  OAI21X1 U28 ( .A(n16), .B(n31), .C(n32), .Y(parallel_in[0]) );
  AOI21X1 U29 ( .A(encoded_tx_packet_data[0]), .B(get_tx_packet_data), .C(n33), 
        .Y(n32) );
  INVX1 U30 ( .A(pidbyte[0]), .Y(n31) );
  INVX1 U31 ( .A(n34), .Y(n128) );
  INVX1 U32 ( .A(n35), .Y(n129) );
  AOI22X1 U33 ( .A(encoded_tx_packet_data[3]), .B(get_tx_packet_data), .C(
        pidbyte[3]), .D(n15), .Y(n35) );
  INVX1 U34 ( .A(n16), .Y(n15) );
  INVX1 U35 ( .A(n36), .Y(get_tx_packet_data) );
  AOI21X1 U36 ( .A(n37), .B(n38), .C(n39), .Y(n139) );
  AOI21X1 U37 ( .A(n40), .B(n41), .C(clk_div), .Y(n39) );
  NOR2X1 U38 ( .A(n42), .B(n43), .Y(n38) );
  NAND2X1 U39 ( .A(n40), .B(n41), .Y(n43) );
  NAND3X1 U40 ( .A(n24), .B(n44), .C(n30), .Y(n42) );
  NOR2X1 U41 ( .A(n45), .B(n46), .Y(n37) );
  NAND2X1 U42 ( .A(n47), .B(n48), .Y(n46) );
  OAI21X1 U43 ( .A(tx_packet[0]), .B(n49), .C(n50), .Y(n48) );
  INVX1 U44 ( .A(n12), .Y(n50) );
  OR2X1 U45 ( .A(tx_packet[1]), .B(tx_packet[2]), .Y(n49) );
  MUX2X1 U46 ( .B(n9), .A(n51), .S(n52), .Y(n47) );
  OAI21X1 U47 ( .A(n53), .B(n54), .C(n55), .Y(n51) );
  AND2X1 U48 ( .A(n56), .B(n57), .Y(n55) );
  OAI21X1 U49 ( .A(n58), .B(n59), .C(n60), .Y(n45) );
  OAI21X1 U50 ( .A(n61), .B(n53), .C(n62), .Y(n60) );
  OAI21X1 U51 ( .A(state[2]), .B(state[1]), .C(n63), .Y(n59) );
  NAND3X1 U52 ( .A(n41), .B(n64), .C(n65), .Y(n138) );
  AOI21X1 U53 ( .A(n53), .B(n66), .C(n10), .Y(n65) );
  INVX1 U54 ( .A(n40), .Y(n10) );
  NAND3X1 U55 ( .A(n67), .B(n68), .C(n69), .Y(n137) );
  NOR2X1 U56 ( .A(n70), .B(n71), .Y(n69) );
  OAI21X1 U57 ( .A(n72), .B(n73), .C(n40), .Y(n71) );
  NAND3X1 U58 ( .A(n74), .B(n75), .C(state[1]), .Y(n40) );
  NAND2X1 U59 ( .A(state[0]), .B(n76), .Y(n73) );
  NAND2X1 U60 ( .A(n77), .B(n56), .Y(n70) );
  NAND3X1 U61 ( .A(n78), .B(n79), .C(n80), .Y(n56) );
  MUX2X1 U62 ( .B(n81), .A(n82), .S(n79), .Y(n68) );
  NOR2X1 U63 ( .A(n61), .B(n54), .Y(n82) );
  OAI21X1 U64 ( .A(n2), .B(n83), .C(n84), .Y(n81) );
  AOI21X1 U65 ( .A(n85), .B(n86), .C(n9), .Y(n84) );
  INVX1 U66 ( .A(n87), .Y(n9) );
  INVX1 U67 ( .A(n88), .Y(n67) );
  OAI21X1 U68 ( .A(n57), .B(n52), .C(n89), .Y(n88) );
  NAND3X1 U69 ( .A(n90), .B(n91), .C(n92), .Y(n136) );
  AOI21X1 U70 ( .A(n93), .B(n94), .C(n95), .Y(n92) );
  OAI21X1 U71 ( .A(n54), .B(n52), .C(n96), .Y(n95) );
  NAND3X1 U72 ( .A(n80), .B(n78), .C(n53), .Y(n96) );
  INVX1 U73 ( .A(n61), .Y(n52) );
  NOR2X1 U74 ( .A(n97), .B(c8bit_rollover_flag), .Y(n61) );
  INVX1 U75 ( .A(clk_div), .Y(n97) );
  AND2X1 U76 ( .A(n98), .B(n36), .Y(n91) );
  NOR2X1 U77 ( .A(n62), .B(n85), .Y(n90) );
  INVX1 U78 ( .A(n57), .Y(n85) );
  NAND3X1 U79 ( .A(n99), .B(n89), .C(n100), .Y(n135) );
  NOR2X1 U80 ( .A(n101), .B(n102), .Y(n100) );
  OAI21X1 U81 ( .A(n57), .B(n86), .C(n87), .Y(n102) );
  NAND2X1 U82 ( .A(n103), .B(n104), .Y(n87) );
  NAND3X1 U83 ( .A(n105), .B(n106), .C(n53), .Y(n86) );
  INVX1 U84 ( .A(tx_packet[2]), .Y(n106) );
  XOR2X1 U85 ( .A(tx_packet[1]), .B(tx_packet[0]), .Y(n105) );
  NAND2X1 U86 ( .A(n93), .B(n107), .Y(n57) );
  NAND2X1 U87 ( .A(n23), .B(n108), .Y(n101) );
  NOR2X1 U88 ( .A(n109), .B(n110), .Y(n89) );
  OAI21X1 U89 ( .A(n53), .B(n2), .C(n30), .Y(n110) );
  INVX1 U90 ( .A(n79), .Y(n53) );
  NAND3X1 U91 ( .A(n44), .B(n98), .C(n36), .Y(n109) );
  AOI22X1 U92 ( .A(n62), .B(n83), .C(n66), .D(n79), .Y(n99) );
  NAND2X1 U93 ( .A(c8bit_rollover_flag), .B(clk_div), .Y(n79) );
  INVX1 U94 ( .A(n54), .Y(n66) );
  NAND2X1 U95 ( .A(n80), .B(n104), .Y(n54) );
  NAND3X1 U96 ( .A(n111), .B(n112), .C(n113), .Y(n83) );
  NOR2X1 U97 ( .A(buff_occupancy[0]), .B(n114), .Y(n113) );
  OR2X1 U98 ( .A(buff_occupancy[2]), .B(buff_occupancy[1]), .Y(n114) );
  NOR2X1 U99 ( .A(buff_occupancy[6]), .B(buff_occupancy[5]), .Y(n112) );
  NOR2X1 U100 ( .A(buff_occupancy[4]), .B(buff_occupancy[3]), .Y(n111) );
  INVX1 U101 ( .A(n2), .Y(n62) );
  NAND2X1 U102 ( .A(n115), .B(n116), .Y(n2) );
  OR2X1 U103 ( .A(n19), .B(counter_clear), .Y(load_enable) );
  INVX1 U104 ( .A(n24), .Y(n19) );
  NAND3X1 U105 ( .A(n12), .B(n13), .C(n117), .Y(counter_clear) );
  INVX1 U106 ( .A(clear), .Y(n13) );
  NAND2X1 U107 ( .A(n103), .B(n78), .Y(n12) );
  OAI21X1 U108 ( .A(n78), .B(n118), .C(n119), .Y(clear) );
  NAND3X1 U109 ( .A(n24), .B(n34), .C(n117), .Y(bit_counter_en) );
  INVX1 U110 ( .A(n120), .Y(n117) );
  NAND3X1 U111 ( .A(n41), .B(n30), .C(n121), .Y(n120) );
  NOR2X1 U112 ( .A(n33), .B(n122), .Y(n121) );
  NAND2X1 U113 ( .A(n36), .B(n16), .Y(n122) );
  NAND2X1 U114 ( .A(n93), .B(n103), .Y(n16) );
  NAND2X1 U115 ( .A(n115), .B(n107), .Y(n36) );
  INVX1 U116 ( .A(n23), .Y(n33) );
  NAND2X1 U117 ( .A(n93), .B(n80), .Y(n23) );
  INVX1 U118 ( .A(n123), .Y(n93) );
  NAND2X1 U119 ( .A(n116), .B(n104), .Y(n30) );
  NAND3X1 U120 ( .A(n75), .B(n76), .C(n74), .Y(n41) );
  NOR2X1 U121 ( .A(n124), .B(n125), .Y(n34) );
  OAI21X1 U122 ( .A(n126), .B(n123), .C(n127), .Y(n125) );
  AND2X1 U123 ( .A(n98), .B(n44), .Y(n127) );
  NAND2X1 U124 ( .A(n103), .B(n115), .Y(n44) );
  NOR2X1 U125 ( .A(n58), .B(state[1]), .Y(n103) );
  NAND2X1 U126 ( .A(n115), .B(n80), .Y(n98) );
  AND2X1 U127 ( .A(state[1]), .B(n11), .Y(n80) );
  AND2X1 U128 ( .A(state[2]), .B(state[3]), .Y(n115) );
  NAND2X1 U129 ( .A(state[2]), .B(n63), .Y(n123) );
  INVX1 U130 ( .A(n116), .Y(n126) );
  NAND3X1 U131 ( .A(n64), .B(n108), .C(n77), .Y(n124) );
  NAND2X1 U132 ( .A(n116), .B(n78), .Y(n77) );
  NOR2X1 U133 ( .A(n76), .B(n58), .Y(n116) );
  INVX1 U134 ( .A(n94), .Y(n58) );
  NOR2X1 U135 ( .A(state[0]), .B(state[4]), .Y(n94) );
  NAND2X1 U136 ( .A(n107), .B(n104), .Y(n108) );
  NOR2X1 U137 ( .A(n63), .B(state[2]), .Y(n104) );
  INVX1 U138 ( .A(state[3]), .Y(n63) );
  NAND3X1 U139 ( .A(state[0]), .B(n76), .C(n74), .Y(n64) );
  NAND2X1 U140 ( .A(n78), .B(n107), .Y(n24) );
  AND2X1 U141 ( .A(n11), .B(n76), .Y(n107) );
  INVX1 U142 ( .A(state[1]), .Y(n76) );
  NOR2X1 U143 ( .A(n75), .B(state[4]), .Y(n11) );
  INVX1 U144 ( .A(state[0]), .Y(n75) );
  NOR2X1 U145 ( .A(DP_OUT), .B(n74), .Y(DM_OUT) );
  OR2X1 U146 ( .A(packet_done), .B(serial_out_sr), .Y(DP_OUT) );
  INVX1 U147 ( .A(n119), .Y(packet_done) );
  NAND3X1 U148 ( .A(n74), .B(state[0]), .C(state[1]), .Y(n119) );
  NOR2X1 U149 ( .A(n118), .B(n72), .Y(n74) );
  INVX1 U150 ( .A(n78), .Y(n72) );
  NOR2X1 U151 ( .A(state[2]), .B(state[3]), .Y(n78) );
  INVX1 U152 ( .A(state[4]), .Y(n118) );
endmodule


module usb_tx_wrapper ( clk, n_rst, buffer_occupancy, TX_packet, 
        TX_packet_data, TX_error, packet_done, get_TX_packet_data, 
        TX_transfer_active, dp_out, dm_out );
  input [6:0] buffer_occupancy;
  input [2:0] TX_packet;
  input [7:0] TX_packet_data;
  input clk, n_rst;
  output TX_error, packet_done, get_TX_packet_data, TX_transfer_active, dp_out,
         dm_out;
  wire   counter_clear, bit_counter_en, c8bit_rollover_flag, clear, clk_div,
         N36, n18, n19, n20, n21, n22, n23, n24;
  wire   [7:1] pidbyte;
  wire   [7:0] encoded_TX_packet_data;
  assign TX_error = N36;

  flex_counter_SIZE4_1 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(
        counter_clear), .count_enable(bit_counter_en), .rollover_val({1'b1, 
        1'b0, 1'b0, 1'b0}), .rollover_flag(c8bit_rollover_flag) );
  clk_div divider ( .clk(clk), .n_rst(n_rst), .counter_clear(clear), 
        .en_clk_div(n24), .clk_divider(clk_div) );
  nrzi_encoder encoder ( .data(TX_packet_data), .encoded_data(
        encoded_TX_packet_data) );
  usb_tx_fsm fsm ( .clk(clk), .n_rst(n_rst), .c8bit_rollover_flag(
        c8bit_rollover_flag), .clk_div(clk_div), .tx_packet(TX_packet), 
        .buff_occupancy(buffer_occupancy), .encoded_tx_packet_data(
        encoded_TX_packet_data), .pidbyte({pidbyte[7:2], pidbyte[2], 1'b1}), 
        .packet_done(packet_done), .get_tx_packet_data(get_TX_packet_data), 
        .tx_transfer_active(TX_transfer_active), .clear(clear), 
        .counter_clear(counter_clear), .bit_counter_en(bit_counter_en), 
        .DP_OUT(dp_out), .DM_OUT(dm_out) );
  NOR2X1 U22 ( .A(N36), .B(n18), .Y(pidbyte[6]) );
  OAI21X1 U23 ( .A(TX_packet[0]), .B(n19), .C(n20), .Y(pidbyte[5]) );
  OAI21X1 U24 ( .A(TX_packet[1]), .B(n21), .C(n20), .Y(pidbyte[4]) );
  OAI21X1 U25 ( .A(n22), .B(n21), .C(n20), .Y(pidbyte[3]) );
  OAI22X1 U26 ( .A(TX_packet[1]), .B(n21), .C(TX_packet[0]), .D(n19), .Y(
        pidbyte[2]) );
  NAND3X1 U27 ( .A(n20), .B(n21), .C(n19), .Y(n24) );
  NAND2X1 U28 ( .A(TX_packet[1]), .B(n23), .Y(n19) );
  INVX1 U29 ( .A(pidbyte[7]), .Y(n21) );
  NOR2X1 U30 ( .A(n18), .B(TX_packet[2]), .Y(pidbyte[7]) );
  NAND3X1 U31 ( .A(n18), .B(n22), .C(TX_packet[2]), .Y(n20) );
  INVX1 U32 ( .A(TX_packet[0]), .Y(n18) );
  NOR2X1 U33 ( .A(n23), .B(n22), .Y(N36) );
  INVX1 U34 ( .A(TX_packet[1]), .Y(n22) );
  INVX1 U35 ( .A(TX_packet[2]), .Y(n23) );
endmodule

