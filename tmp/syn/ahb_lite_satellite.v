/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Thu May  1 17:21:29 2025
/////////////////////////////////////////////////////////////


module ahb_lite_satellite ( clk, n_rst, RX_packet, RX_data_ready, 
        RX_transfer_active, RX_error, buffer_occupancy, raddr, RX_data, 
        clear_done, d_mode, get_RX_data, store_TX_data, TX_data, clear, 
        TX_error, TX_transfer_active, packet_done, TX_packet, hsel, haddr, 
        hsize, htrans, hwrite, hburst, hwdata, hready, hrdata, hresp );
  input [2:0] RX_packet;
  input [6:0] buffer_occupancy;
  input [6:0] raddr;
  input [7:0] RX_data;
  output [7:0] TX_data;
  output [2:0] TX_packet;
  input [3:0] haddr;
  input [2:0] hsize;
  input [1:0] htrans;
  input [2:0] hburst;
  input [31:0] hwdata;
  output [31:0] hrdata;
  input clk, n_rst, RX_data_ready, RX_transfer_active, RX_error, clear_done,
         TX_error, TX_transfer_active, packet_done, hsel, hwrite;
  output d_mode, get_RX_data, store_TX_data, clear, hready, hresp;
  wire   d_mode, last_hwrite, \last_state_RX[1] , last_hwrite_RAW,
         \last_state[1] , n85, n86, n87, n88, n89, n90, n91, n92, n94, n120,
         n128, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929;
  wire   [3:0] last_haddr;
  wire   [2:0] last_hsize;
  wire   [3:0] last_haddr_RAW;
  wire   [1:0] hready_state;
  wire   [1:0] next_hready_state;
  wire   [7:3] tx_packet_control_reg;
  wire   [7:1] flush_buffer_control_reg;
  wire   [31:0] data_buffer_reg;
  wire   [31:0] next_data_buffer_reg;
  wire   [4:0] TX_state;
  wire   [1:0] TX_current_hsize;
  wire   [4:0] RX_state;
  wire   [1:0] RX_current_hsize;
  wire   [3:0] next_TX_state;
  wire   [3:0] next_RX_state;
  assign d_mode = TX_transfer_active;

  DFFSR \last_state_reg[1]  ( .D(htrans[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\last_state[1] ) );
  DFFSR last_hwrite_RAW_reg ( .D(hwrite), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_hwrite_RAW) );
  DFFSR \last_haddr_RAW_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(last_haddr_RAW[3]) );
  DFFSR \last_haddr_RAW_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(last_haddr_RAW[2]) );
  DFFSR \last_haddr_RAW_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(last_haddr_RAW[1]) );
  DFFSR \last_haddr_RAW_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(last_haddr_RAW[0]) );
  DFFSR \RX_state_reg[0]  ( .D(next_RX_state[0]), .CLK(clk), .R(1'b1), .S(
        n_rst), .Q(RX_state[0]) );
  DFFSR \RX_current_hsize_reg[1]  ( .D(n543), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(RX_current_hsize[1]) );
  DFFSR \RX_current_hsize_reg[0]  ( .D(n542), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(RX_current_hsize[0]) );
  DFFSR \RX_state_reg[2]  ( .D(next_RX_state[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(RX_state[2]) );
  DFFSR \RX_state_reg[3]  ( .D(next_RX_state[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(RX_state[3]) );
  DFFSR \hready_state_reg[0]  ( .D(next_hready_state[0]), .CLK(clk), .R(1'b1), 
        .S(n_rst), .Q(hready_state[0]) );
  DFFSR \TX_current_hsize_reg[1]  ( .D(n526), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(TX_current_hsize[1]) );
  DFFSR \TX_state_reg[1]  ( .D(next_TX_state[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_state[1]) );
  DFFSR \TX_state_reg[3]  ( .D(next_TX_state[3]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_state[3]) );
  DFFSR \TX_current_hsize_reg[0]  ( .D(n525), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(TX_current_hsize[0]) );
  DFFSR \TX_state_reg[0]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        TX_state[0]) );
  DFFSR \TX_state_reg[2]  ( .D(next_TX_state[2]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_state[2]) );
  DFFSR \hready_state_reg[1]  ( .D(next_hready_state[1]), .CLK(clk), .R(1'b1), 
        .S(n_rst), .Q(hready_state[1]) );
  DFFSR \last_haddr_reg[0]  ( .D(n535), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_haddr[0]) );
  DFFSR \last_haddr_reg[1]  ( .D(n536), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_haddr[1]) );
  DFFSR \last_haddr_reg[2]  ( .D(n537), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_haddr[2]) );
  DFFSR \last_haddr_reg[3]  ( .D(n538), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_haddr[3]) );
  DFFSR \RX_state_reg[1]  ( .D(next_RX_state[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(RX_state[1]) );
  DFFSR \last_hsize_reg[0]  ( .D(n539), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_hsize[0]) );
  DFFSR \last_hsize_reg[1]  ( .D(n540), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_hsize[1]) );
  DFFSR \last_hsize_reg[2]  ( .D(n120), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_hsize[2]) );
  DFFSR \last_state_RX_reg[1]  ( .D(n541), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \last_state_RX[1] ) );
  DFFSR last_hwrite_reg ( .D(n94), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        last_hwrite) );
  DFFSR \tx_packet_control_reg_reg[6]  ( .D(n92), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet_control_reg[6]) );
  DFFSR \tx_packet_control_reg_reg[5]  ( .D(n91), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet_control_reg[5]) );
  DFFSR \tx_packet_control_reg_reg[4]  ( .D(n90), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet_control_reg[4]) );
  DFFSR \tx_packet_control_reg_reg[3]  ( .D(n89), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet_control_reg[3]) );
  DFFSR \tx_packet_control_reg_reg[2]  ( .D(n88), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_packet[2]) );
  DFFSR \tx_packet_control_reg_reg[1]  ( .D(n87), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_packet[1]) );
  DFFSR \tx_packet_control_reg_reg[0]  ( .D(n86), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(TX_packet[0]) );
  DFFSR \tx_packet_control_reg_reg[7]  ( .D(n85), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet_control_reg[7]) );
  DFFSR \flush_buffer_control_reg_reg[7]  ( .D(n527), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[7]) );
  DFFSR \flush_buffer_control_reg_reg[5]  ( .D(n528), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[5]) );
  DFFSR \flush_buffer_control_reg_reg[4]  ( .D(n529), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[4]) );
  DFFSR \flush_buffer_control_reg_reg[3]  ( .D(n530), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[3]) );
  DFFSR \flush_buffer_control_reg_reg[2]  ( .D(n531), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[2]) );
  DFFSR \flush_buffer_control_reg_reg[1]  ( .D(n532), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[1]) );
  DFFSR \flush_buffer_control_reg_reg[0]  ( .D(n533), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(clear) );
  DFFSR \flush_buffer_control_reg_reg[6]  ( .D(n534), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(flush_buffer_control_reg[6]) );
  DFFSR \data_buffer_reg_reg[7]  ( .D(next_data_buffer_reg[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[7]) );
  DFFSR \data_buffer_reg_reg[6]  ( .D(next_data_buffer_reg[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[6]) );
  DFFSR \data_buffer_reg_reg[5]  ( .D(next_data_buffer_reg[5]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[5]) );
  DFFSR \data_buffer_reg_reg[4]  ( .D(next_data_buffer_reg[4]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[4]) );
  DFFSR \data_buffer_reg_reg[3]  ( .D(next_data_buffer_reg[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[3]) );
  DFFSR \data_buffer_reg_reg[2]  ( .D(next_data_buffer_reg[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[2]) );
  DFFSR \data_buffer_reg_reg[1]  ( .D(next_data_buffer_reg[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[1]) );
  DFFSR \data_buffer_reg_reg[0]  ( .D(next_data_buffer_reg[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[0]) );
  DFFSR \data_buffer_reg_reg[9]  ( .D(next_data_buffer_reg[9]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[9]) );
  DFFSR \data_buffer_reg_reg[8]  ( .D(next_data_buffer_reg[8]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_buffer_reg[8]) );
  DFFSR \data_buffer_reg_reg[15]  ( .D(next_data_buffer_reg[15]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[15]) );
  DFFSR \data_buffer_reg_reg[14]  ( .D(next_data_buffer_reg[14]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[14]) );
  DFFSR \data_buffer_reg_reg[13]  ( .D(next_data_buffer_reg[13]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[13]) );
  DFFSR \data_buffer_reg_reg[12]  ( .D(next_data_buffer_reg[12]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[12]) );
  DFFSR \data_buffer_reg_reg[11]  ( .D(next_data_buffer_reg[11]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[11]) );
  DFFSR \data_buffer_reg_reg[10]  ( .D(next_data_buffer_reg[10]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[10]) );
  DFFSR \data_buffer_reg_reg[23]  ( .D(next_data_buffer_reg[23]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[23]) );
  DFFSR \data_buffer_reg_reg[22]  ( .D(next_data_buffer_reg[22]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[22]) );
  DFFSR \data_buffer_reg_reg[21]  ( .D(next_data_buffer_reg[21]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[21]) );
  DFFSR \data_buffer_reg_reg[20]  ( .D(next_data_buffer_reg[20]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[20]) );
  DFFSR \data_buffer_reg_reg[19]  ( .D(next_data_buffer_reg[19]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[19]) );
  DFFSR \data_buffer_reg_reg[18]  ( .D(next_data_buffer_reg[18]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[18]) );
  DFFSR \data_buffer_reg_reg[17]  ( .D(next_data_buffer_reg[17]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[17]) );
  DFFSR \data_buffer_reg_reg[16]  ( .D(next_data_buffer_reg[16]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[16]) );
  DFFSR \data_buffer_reg_reg[31]  ( .D(next_data_buffer_reg[31]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[31]) );
  DFFSR \data_buffer_reg_reg[30]  ( .D(next_data_buffer_reg[30]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[30]) );
  DFFSR \data_buffer_reg_reg[29]  ( .D(next_data_buffer_reg[29]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[29]) );
  DFFSR \data_buffer_reg_reg[28]  ( .D(next_data_buffer_reg[28]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[28]) );
  DFFSR \data_buffer_reg_reg[27]  ( .D(next_data_buffer_reg[27]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[27]) );
  DFFSR \data_buffer_reg_reg[26]  ( .D(next_data_buffer_reg[26]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[26]) );
  DFFSR \data_buffer_reg_reg[25]  ( .D(next_data_buffer_reg[25]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[25]) );
  DFFSR \data_buffer_reg_reg[24]  ( .D(next_data_buffer_reg[24]), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(data_buffer_reg[24]) );
  NAND2X1 U628 ( .A(n544), .B(n545), .Y(store_TX_data) );
  OAI21X1 U629 ( .A(n546), .B(n547), .C(n548), .Y(next_hready_state[1]) );
  INVX1 U630 ( .A(n549), .Y(n546) );
  AOI21X1 U631 ( .A(n549), .B(n547), .C(n550), .Y(next_hready_state[0]) );
  INVX1 U632 ( .A(n548), .Y(n550) );
  NAND3X1 U633 ( .A(n551), .B(n552), .C(n553), .Y(n547) );
  NOR2X1 U634 ( .A(n554), .B(n555), .Y(n553) );
  OAI21X1 U635 ( .A(n556), .B(n557), .C(n558), .Y(n555) );
  NAND2X1 U636 ( .A(RX_current_hsize[0]), .B(n559), .Y(n557) );
  NAND2X1 U637 ( .A(n560), .B(n561), .Y(n554) );
  OAI21X1 U638 ( .A(n562), .B(n563), .C(n564), .Y(n552) );
  OR2X1 U639 ( .A(n565), .B(n566), .Y(n563) );
  OAI21X1 U640 ( .A(n567), .B(n568), .C(n569), .Y(n566) );
  INVX1 U641 ( .A(n570), .Y(n567) );
  NAND3X1 U642 ( .A(n545), .B(n571), .C(n572), .Y(n562) );
  AOI21X1 U643 ( .A(n573), .B(n574), .C(n575), .Y(n572) );
  INVX1 U644 ( .A(n576), .Y(n575) );
  AOI22X1 U645 ( .A(n577), .B(n578), .C(n579), .D(n580), .Y(n551) );
  AOI21X1 U646 ( .A(n581), .B(n582), .C(n583), .Y(n579) );
  NAND3X1 U647 ( .A(n584), .B(hsel), .C(n585), .Y(n549) );
  NOR2X1 U648 ( .A(n586), .B(n587), .Y(n585) );
  MUX2X1 U649 ( .B(n588), .A(n589), .S(hwrite), .Y(n587) );
  NAND2X1 U650 ( .A(n590), .B(n591), .Y(n589) );
  AOI21X1 U651 ( .A(n592), .B(n593), .C(n594), .Y(n591) );
  OAI21X1 U652 ( .A(n595), .B(n596), .C(n597), .Y(n594) );
  OR2X1 U653 ( .A(n598), .B(n599), .Y(n596) );
  NAND2X1 U654 ( .A(n600), .B(n601), .Y(n595) );
  OAI21X1 U655 ( .A(last_haddr[2]), .B(n602), .C(n603), .Y(n592) );
  INVX1 U656 ( .A(n604), .Y(n603) );
  AOI22X1 U657 ( .A(last_haddr[1]), .B(n605), .C(last_haddr[3]), .D(n606), .Y(
        n590) );
  OAI21X1 U658 ( .A(last_haddr[2]), .B(n607), .C(n608), .Y(n606) );
  NAND3X1 U659 ( .A(n609), .B(n602), .C(n610), .Y(n608) );
  INVX1 U660 ( .A(n611), .Y(n610) );
  OAI21X1 U661 ( .A(n612), .B(n607), .C(n611), .Y(n605) );
  OAI21X1 U662 ( .A(n597), .B(n613), .C(n614), .Y(n588) );
  AOI21X1 U663 ( .A(haddr[1]), .B(n615), .C(n616), .Y(n614) );
  AOI21X1 U664 ( .A(n599), .B(haddr[2]), .C(n617), .Y(n616) );
  NAND2X1 U665 ( .A(n618), .B(n593), .Y(n617) );
  NAND2X1 U666 ( .A(n611), .B(n607), .Y(n593) );
  NAND2X1 U667 ( .A(hsize[0]), .B(n601), .Y(n607) );
  OAI21X1 U668 ( .A(n619), .B(n620), .C(n613), .Y(n618) );
  NOR2X1 U669 ( .A(n619), .B(haddr[1]), .Y(n599) );
  OAI22X1 U670 ( .A(haddr[2]), .B(n611), .C(hsize[0]), .D(n619), .Y(n615) );
  INVX1 U671 ( .A(haddr[3]), .Y(n619) );
  NAND2X1 U672 ( .A(hsize[1]), .B(n600), .Y(n611) );
  NAND3X1 U673 ( .A(haddr[3]), .B(n598), .C(n621), .Y(n597) );
  NOR2X1 U674 ( .A(hsize[1]), .B(hsize[0]), .Y(n621) );
  NOR2X1 U675 ( .A(hsize[2]), .B(hresp), .Y(n584) );
  OAI21X1 U676 ( .A(n622), .B(n623), .C(n624), .Y(next_data_buffer_reg[9]) );
  AOI22X1 U677 ( .A(data_buffer_reg[9]), .B(n625), .C(hwdata[9]), .D(n626), 
        .Y(n624) );
  OAI21X1 U678 ( .A(n622), .B(n627), .C(n628), .Y(next_data_buffer_reg[8]) );
  AOI22X1 U679 ( .A(data_buffer_reg[8]), .B(n625), .C(hwdata[8]), .D(n626), 
        .Y(n628) );
  OAI21X1 U680 ( .A(n629), .B(n630), .C(n631), .Y(next_data_buffer_reg[7]) );
  AOI22X1 U681 ( .A(data_buffer_reg[7]), .B(n632), .C(hwdata[7]), .D(n633), 
        .Y(n631) );
  OAI21X1 U682 ( .A(n629), .B(n634), .C(n635), .Y(next_data_buffer_reg[6]) );
  AOI22X1 U683 ( .A(data_buffer_reg[6]), .B(n632), .C(hwdata[6]), .D(n633), 
        .Y(n635) );
  OAI21X1 U684 ( .A(n629), .B(n636), .C(n637), .Y(next_data_buffer_reg[5]) );
  AOI22X1 U685 ( .A(data_buffer_reg[5]), .B(n632), .C(hwdata[5]), .D(n633), 
        .Y(n637) );
  OAI21X1 U686 ( .A(n629), .B(n638), .C(n639), .Y(next_data_buffer_reg[4]) );
  AOI22X1 U687 ( .A(data_buffer_reg[4]), .B(n632), .C(hwdata[4]), .D(n633), 
        .Y(n639) );
  OAI21X1 U688 ( .A(n629), .B(n640), .C(n641), .Y(next_data_buffer_reg[3]) );
  AOI22X1 U689 ( .A(data_buffer_reg[3]), .B(n632), .C(hwdata[3]), .D(n633), 
        .Y(n641) );
  OAI21X1 U690 ( .A(n630), .B(n642), .C(n643), .Y(next_data_buffer_reg[31]) );
  AOI22X1 U691 ( .A(data_buffer_reg[31]), .B(n644), .C(hwdata[31]), .D(n645), 
        .Y(n643) );
  OAI21X1 U692 ( .A(n634), .B(n642), .C(n646), .Y(next_data_buffer_reg[30]) );
  AOI22X1 U693 ( .A(data_buffer_reg[30]), .B(n644), .C(hwdata[30]), .D(n645), 
        .Y(n646) );
  OAI21X1 U694 ( .A(n629), .B(n647), .C(n648), .Y(next_data_buffer_reg[2]) );
  AOI22X1 U695 ( .A(data_buffer_reg[2]), .B(n632), .C(hwdata[2]), .D(n633), 
        .Y(n648) );
  OAI21X1 U696 ( .A(n636), .B(n642), .C(n649), .Y(next_data_buffer_reg[29]) );
  AOI22X1 U697 ( .A(data_buffer_reg[29]), .B(n644), .C(hwdata[29]), .D(n645), 
        .Y(n649) );
  OAI21X1 U698 ( .A(n638), .B(n642), .C(n650), .Y(next_data_buffer_reg[28]) );
  AOI22X1 U699 ( .A(data_buffer_reg[28]), .B(n644), .C(hwdata[28]), .D(n645), 
        .Y(n650) );
  OAI21X1 U700 ( .A(n640), .B(n642), .C(n651), .Y(next_data_buffer_reg[27]) );
  AOI22X1 U701 ( .A(data_buffer_reg[27]), .B(n644), .C(hwdata[27]), .D(n645), 
        .Y(n651) );
  OAI21X1 U702 ( .A(n642), .B(n647), .C(n652), .Y(next_data_buffer_reg[26]) );
  AOI22X1 U703 ( .A(data_buffer_reg[26]), .B(n644), .C(hwdata[26]), .D(n645), 
        .Y(n652) );
  OAI21X1 U704 ( .A(n623), .B(n642), .C(n653), .Y(next_data_buffer_reg[25]) );
  AOI22X1 U705 ( .A(data_buffer_reg[25]), .B(n644), .C(hwdata[25]), .D(n645), 
        .Y(n653) );
  OAI21X1 U706 ( .A(n627), .B(n642), .C(n654), .Y(next_data_buffer_reg[24]) );
  AOI22X1 U707 ( .A(data_buffer_reg[24]), .B(n644), .C(hwdata[24]), .D(n645), 
        .Y(n654) );
  INVX1 U708 ( .A(n655), .Y(n645) );
  NAND3X1 U709 ( .A(n656), .B(n642), .C(n657), .Y(n655) );
  INVX1 U710 ( .A(n658), .Y(n644) );
  OAI21X1 U711 ( .A(n659), .B(n660), .C(n642), .Y(n658) );
  OAI21X1 U712 ( .A(n661), .B(n662), .C(n657), .Y(n660) );
  OAI21X1 U713 ( .A(n630), .B(n663), .C(n664), .Y(next_data_buffer_reg[23]) );
  AOI22X1 U714 ( .A(data_buffer_reg[23]), .B(n665), .C(hwdata[23]), .D(n666), 
        .Y(n664) );
  OAI21X1 U715 ( .A(n634), .B(n663), .C(n667), .Y(next_data_buffer_reg[22]) );
  AOI22X1 U716 ( .A(data_buffer_reg[22]), .B(n665), .C(hwdata[22]), .D(n666), 
        .Y(n667) );
  OAI21X1 U717 ( .A(n636), .B(n663), .C(n668), .Y(next_data_buffer_reg[21]) );
  AOI22X1 U718 ( .A(data_buffer_reg[21]), .B(n665), .C(hwdata[21]), .D(n666), 
        .Y(n668) );
  OAI21X1 U719 ( .A(n638), .B(n663), .C(n669), .Y(next_data_buffer_reg[20]) );
  AOI22X1 U720 ( .A(data_buffer_reg[20]), .B(n665), .C(hwdata[20]), .D(n666), 
        .Y(n669) );
  OAI21X1 U721 ( .A(n623), .B(n629), .C(n670), .Y(next_data_buffer_reg[1]) );
  AOI22X1 U722 ( .A(data_buffer_reg[1]), .B(n632), .C(hwdata[1]), .D(n633), 
        .Y(n670) );
  OAI21X1 U723 ( .A(n640), .B(n663), .C(n671), .Y(next_data_buffer_reg[19]) );
  AOI22X1 U724 ( .A(data_buffer_reg[19]), .B(n665), .C(hwdata[19]), .D(n666), 
        .Y(n671) );
  OAI21X1 U725 ( .A(n647), .B(n663), .C(n672), .Y(next_data_buffer_reg[18]) );
  AOI22X1 U726 ( .A(data_buffer_reg[18]), .B(n665), .C(hwdata[18]), .D(n666), 
        .Y(n672) );
  OAI21X1 U727 ( .A(n623), .B(n663), .C(n673), .Y(next_data_buffer_reg[17]) );
  AOI22X1 U728 ( .A(data_buffer_reg[17]), .B(n665), .C(hwdata[17]), .D(n666), 
        .Y(n673) );
  INVX1 U729 ( .A(RX_data[1]), .Y(n623) );
  OAI21X1 U730 ( .A(n627), .B(n663), .C(n674), .Y(next_data_buffer_reg[16]) );
  AOI22X1 U731 ( .A(data_buffer_reg[16]), .B(n665), .C(hwdata[16]), .D(n666), 
        .Y(n674) );
  INVX1 U732 ( .A(n675), .Y(n666) );
  NAND3X1 U733 ( .A(n676), .B(n663), .C(n657), .Y(n675) );
  INVX1 U734 ( .A(n677), .Y(n665) );
  OAI21X1 U735 ( .A(n659), .B(n678), .C(n663), .Y(n677) );
  OAI21X1 U736 ( .A(n679), .B(n662), .C(n657), .Y(n678) );
  OAI21X1 U737 ( .A(n680), .B(n681), .C(n682), .Y(n659) );
  OAI21X1 U738 ( .A(n622), .B(n630), .C(n683), .Y(next_data_buffer_reg[15]) );
  AOI22X1 U739 ( .A(data_buffer_reg[15]), .B(n625), .C(hwdata[15]), .D(n626), 
        .Y(n683) );
  INVX1 U740 ( .A(RX_data[7]), .Y(n630) );
  OAI21X1 U741 ( .A(n622), .B(n634), .C(n684), .Y(next_data_buffer_reg[14]) );
  AOI22X1 U742 ( .A(data_buffer_reg[14]), .B(n625), .C(hwdata[14]), .D(n626), 
        .Y(n684) );
  INVX1 U743 ( .A(RX_data[6]), .Y(n634) );
  OAI21X1 U744 ( .A(n622), .B(n636), .C(n685), .Y(next_data_buffer_reg[13]) );
  AOI22X1 U745 ( .A(data_buffer_reg[13]), .B(n625), .C(hwdata[13]), .D(n626), 
        .Y(n685) );
  INVX1 U746 ( .A(RX_data[5]), .Y(n636) );
  OAI21X1 U747 ( .A(n622), .B(n638), .C(n686), .Y(next_data_buffer_reg[12]) );
  AOI22X1 U748 ( .A(data_buffer_reg[12]), .B(n625), .C(hwdata[12]), .D(n626), 
        .Y(n686) );
  INVX1 U749 ( .A(RX_data[4]), .Y(n638) );
  OAI21X1 U750 ( .A(n622), .B(n640), .C(n687), .Y(next_data_buffer_reg[11]) );
  AOI22X1 U751 ( .A(data_buffer_reg[11]), .B(n625), .C(hwdata[11]), .D(n626), 
        .Y(n687) );
  INVX1 U752 ( .A(RX_data[3]), .Y(n640) );
  OAI21X1 U753 ( .A(n622), .B(n647), .C(n688), .Y(next_data_buffer_reg[10]) );
  AOI22X1 U754 ( .A(data_buffer_reg[10]), .B(n625), .C(hwdata[10]), .D(n626), 
        .Y(n688) );
  INVX1 U755 ( .A(n689), .Y(n626) );
  NAND3X1 U756 ( .A(n690), .B(n622), .C(n657), .Y(n689) );
  OAI21X1 U757 ( .A(n662), .B(n691), .C(n692), .Y(n690) );
  INVX1 U758 ( .A(n693), .Y(n625) );
  OAI21X1 U759 ( .A(n694), .B(n695), .C(n622), .Y(n693) );
  AND2X1 U760 ( .A(n691), .B(n696), .Y(n694) );
  INVX1 U761 ( .A(RX_data[2]), .Y(n647) );
  OAI21X1 U762 ( .A(n627), .B(n629), .C(n697), .Y(next_data_buffer_reg[0]) );
  AOI22X1 U763 ( .A(data_buffer_reg[0]), .B(n632), .C(hwdata[0]), .D(n633), 
        .Y(n697) );
  INVX1 U764 ( .A(n698), .Y(n633) );
  NAND3X1 U765 ( .A(n699), .B(n629), .C(n657), .Y(n698) );
  OAI21X1 U766 ( .A(n662), .B(n681), .C(n692), .Y(n699) );
  AOI21X1 U767 ( .A(n700), .B(n701), .C(n702), .Y(n692) );
  INVX1 U768 ( .A(n703), .Y(n632) );
  OAI21X1 U769 ( .A(n695), .B(n681), .C(n629), .Y(n703) );
  NAND3X1 U770 ( .A(n682), .B(n704), .C(n657), .Y(n695) );
  INVX1 U771 ( .A(n705), .Y(n682) );
  OAI21X1 U772 ( .A(n701), .B(n706), .C(n707), .Y(n705) );
  AOI21X1 U773 ( .A(n700), .B(n704), .C(n708), .Y(n706) );
  INVX1 U774 ( .A(RX_data[0]), .Y(n627) );
  INVX1 U775 ( .A(n545), .Y(next_TX_state[3]) );
  NAND2X1 U776 ( .A(n709), .B(n544), .Y(next_TX_state[2]) );
  INVX1 U777 ( .A(n710), .Y(n544) );
  OAI21X1 U778 ( .A(TX_state[2]), .B(n568), .C(n711), .Y(n710) );
  AND2X1 U779 ( .A(n712), .B(n576), .Y(n711) );
  AOI22X1 U780 ( .A(n713), .B(n714), .C(n715), .D(n570), .Y(n709) );
  INVX1 U781 ( .A(n716), .Y(n714) );
  NOR2X1 U782 ( .A(n620), .B(n613), .Y(n713) );
  OR2X1 U783 ( .A(n565), .B(n717), .Y(next_TX_state[1]) );
  OAI21X1 U784 ( .A(n718), .B(n716), .C(n569), .Y(n717) );
  INVX1 U785 ( .A(n719), .Y(n569) );
  OAI21X1 U786 ( .A(n720), .B(n721), .C(n712), .Y(n719) );
  NAND2X1 U787 ( .A(TX_state[0]), .B(n722), .Y(n721) );
  NAND2X1 U788 ( .A(n570), .B(n723), .Y(n720) );
  XNOR2X1 U789 ( .A(n724), .B(TX_current_hsize[1]), .Y(n570) );
  XOR2X1 U790 ( .A(n613), .B(haddr[1]), .Y(n718) );
  OR2X1 U791 ( .A(n725), .B(n726), .Y(next_RX_state[2]) );
  OAI21X1 U792 ( .A(n727), .B(n728), .C(n729), .Y(n726) );
  INVX1 U793 ( .A(n730), .Y(n729) );
  OAI22X1 U794 ( .A(n731), .B(n732), .C(RX_state[0]), .D(n558), .Y(n725) );
  NAND3X1 U795 ( .A(RX_state[3]), .B(n733), .C(n734), .Y(n558) );
  NOR2X1 U796 ( .A(RX_state[2]), .B(RX_state[1]), .Y(n734) );
  OR2X1 U797 ( .A(n735), .B(n730), .Y(next_RX_state[1]) );
  OAI22X1 U798 ( .A(n728), .B(last_haddr[1]), .C(n556), .D(n736), .Y(n735) );
  INVX1 U799 ( .A(n733), .Y(n736) );
  OAI21X1 U800 ( .A(RX_current_hsize[1]), .B(n737), .C(n731), .Y(n733) );
  NAND3X1 U801 ( .A(n738), .B(n739), .C(RX_data_ready), .Y(n728) );
  NAND3X1 U802 ( .A(n740), .B(n741), .C(n742), .Y(next_RX_state[0]) );
  NOR2X1 U803 ( .A(n743), .B(n744), .Y(n742) );
  OAI22X1 U804 ( .A(n745), .B(n746), .C(n577), .D(n732), .Y(n744) );
  INVX1 U805 ( .A(n731), .Y(n577) );
  NAND2X1 U806 ( .A(RX_current_hsize[1]), .B(n737), .Y(n731) );
  OAI21X1 U807 ( .A(hresp), .B(n571), .C(n564), .Y(n746) );
  INVX1 U808 ( .A(n580), .Y(n571) );
  NOR2X1 U809 ( .A(n747), .B(hwrite), .Y(n580) );
  NAND3X1 U810 ( .A(n738), .B(n748), .C(RX_data_ready), .Y(n741) );
  INVX1 U811 ( .A(n560), .Y(n738) );
  AND2X1 U812 ( .A(n642), .B(n622), .Y(n740) );
  INVX1 U813 ( .A(n749), .Y(n94) );
  MUX2X1 U814 ( .B(last_hwrite), .A(hwrite), .S(hready), .Y(n749) );
  INVX1 U815 ( .A(n750), .Y(n92) );
  AOI22X1 U816 ( .A(n751), .B(tx_packet_control_reg[6]), .C(hwdata[6]), .D(
        n752), .Y(n750) );
  INVX1 U817 ( .A(n753), .Y(n91) );
  AOI22X1 U818 ( .A(n751), .B(tx_packet_control_reg[5]), .C(hwdata[5]), .D(
        n752), .Y(n753) );
  INVX1 U819 ( .A(n754), .Y(n90) );
  AOI22X1 U820 ( .A(n751), .B(tx_packet_control_reg[4]), .C(hwdata[4]), .D(
        n752), .Y(n754) );
  INVX1 U821 ( .A(n755), .Y(n89) );
  AOI22X1 U822 ( .A(n751), .B(tx_packet_control_reg[3]), .C(hwdata[3]), .D(
        n752), .Y(n755) );
  INVX1 U823 ( .A(n756), .Y(n88) );
  AOI22X1 U824 ( .A(n751), .B(TX_packet[2]), .C(hwdata[2]), .D(n752), .Y(n756)
         );
  INVX1 U825 ( .A(n757), .Y(n87) );
  AOI22X1 U826 ( .A(n751), .B(TX_packet[1]), .C(hwdata[1]), .D(n752), .Y(n757)
         );
  INVX1 U827 ( .A(n758), .Y(n86) );
  AOI22X1 U828 ( .A(n751), .B(TX_packet[0]), .C(hwdata[0]), .D(n752), .Y(n758)
         );
  INVX1 U829 ( .A(n759), .Y(n85) );
  AOI22X1 U830 ( .A(n751), .B(tx_packet_control_reg[7]), .C(hwdata[7]), .D(
        n752), .Y(n759) );
  INVX1 U831 ( .A(n760), .Y(n752) );
  NAND3X1 U832 ( .A(n761), .B(n762), .C(n763), .Y(n760) );
  OAI21X1 U833 ( .A(packet_done), .B(n763), .C(n761), .Y(n751) );
  NAND2X1 U834 ( .A(n762), .B(n764), .Y(n761) );
  OAI21X1 U835 ( .A(n708), .B(n765), .C(n657), .Y(n764) );
  INVX1 U836 ( .A(n766), .Y(n657) );
  INVX1 U837 ( .A(packet_done), .Y(n762) );
  MUX2X1 U838 ( .B(n601), .A(n559), .S(n767), .Y(n543) );
  INVX1 U839 ( .A(RX_current_hsize[1]), .Y(n559) );
  MUX2X1 U840 ( .B(n600), .A(n737), .S(n767), .Y(n542) );
  NAND3X1 U841 ( .A(n560), .B(n561), .C(n768), .Y(n767) );
  NOR2X1 U842 ( .A(n769), .B(n743), .Y(n768) );
  NAND2X1 U843 ( .A(n556), .B(n583), .Y(n743) );
  INVX1 U844 ( .A(RX_state[3]), .Y(n583) );
  NAND3X1 U845 ( .A(n578), .B(n745), .C(RX_state[1]), .Y(n556) );
  INVX1 U846 ( .A(n732), .Y(n769) );
  NAND3X1 U847 ( .A(RX_state[0]), .B(n578), .C(RX_state[1]), .Y(n732) );
  NAND3X1 U848 ( .A(n745), .B(n582), .C(n564), .Y(n560) );
  INVX1 U849 ( .A(RX_current_hsize[0]), .Y(n737) );
  MUX2X1 U850 ( .B(n770), .A(n586), .S(hready), .Y(n541) );
  INVX1 U851 ( .A(htrans[1]), .Y(n586) );
  MUX2X1 U852 ( .B(n771), .A(n601), .S(hready), .Y(n540) );
  INVX1 U853 ( .A(hsize[1]), .Y(n601) );
  MUX2X1 U854 ( .B(n772), .A(n600), .S(hready), .Y(n539) );
  INVX1 U855 ( .A(hsize[0]), .Y(n600) );
  INVX1 U856 ( .A(n773), .Y(n538) );
  MUX2X1 U857 ( .B(last_haddr[3]), .A(haddr[3]), .S(hready), .Y(n773) );
  MUX2X1 U858 ( .B(n612), .A(n598), .S(hready), .Y(n537) );
  MUX2X1 U859 ( .B(n727), .A(n620), .S(hready), .Y(n536) );
  MUX2X1 U860 ( .B(n602), .A(n613), .S(hready), .Y(n535) );
  INVX1 U861 ( .A(haddr[0]), .Y(n613) );
  OAI22X1 U862 ( .A(n774), .B(n775), .C(n776), .D(n777), .Y(n534) );
  INVX1 U863 ( .A(hwdata[14]), .Y(n776) );
  OAI22X1 U864 ( .A(n774), .B(n778), .C(n779), .D(n777), .Y(n533) );
  INVX1 U865 ( .A(hwdata[8]), .Y(n779) );
  INVX1 U866 ( .A(clear), .Y(n778) );
  OAI22X1 U867 ( .A(n774), .B(n780), .C(n781), .D(n777), .Y(n532) );
  INVX1 U868 ( .A(hwdata[9]), .Y(n781) );
  OAI22X1 U869 ( .A(n774), .B(n782), .C(n783), .D(n777), .Y(n531) );
  INVX1 U870 ( .A(hwdata[10]), .Y(n783) );
  OAI22X1 U871 ( .A(n774), .B(n784), .C(n785), .D(n777), .Y(n530) );
  INVX1 U872 ( .A(hwdata[11]), .Y(n785) );
  OAI22X1 U873 ( .A(n774), .B(n786), .C(n787), .D(n777), .Y(n529) );
  INVX1 U874 ( .A(hwdata[12]), .Y(n787) );
  OAI22X1 U875 ( .A(n774), .B(n788), .C(n789), .D(n777), .Y(n528) );
  INVX1 U876 ( .A(hwdata[13]), .Y(n789) );
  OAI22X1 U877 ( .A(n774), .B(n790), .C(n791), .D(n777), .Y(n527) );
  NAND3X1 U878 ( .A(n792), .B(n793), .C(n794), .Y(n777) );
  OAI21X1 U879 ( .A(n680), .B(n795), .C(n796), .Y(n794) );
  AOI21X1 U880 ( .A(n797), .B(n708), .C(n798), .Y(n796) );
  INVX1 U881 ( .A(hwdata[15]), .Y(n791) );
  AND2X1 U882 ( .A(n799), .B(n792), .Y(n774) );
  OAI21X1 U883 ( .A(n766), .B(n800), .C(n793), .Y(n792) );
  INVX1 U884 ( .A(clear_done), .Y(n793) );
  NAND2X1 U885 ( .A(n707), .B(n727), .Y(n800) );
  NAND3X1 U886 ( .A(\last_state[1] ), .B(last_hwrite), .C(n801), .Y(n766) );
  NOR2X1 U887 ( .A(last_hsize[2]), .B(n802), .Y(n801) );
  OAI21X1 U888 ( .A(n696), .B(n795), .C(n803), .Y(n799) );
  NOR2X1 U889 ( .A(clear_done), .B(n798), .Y(n803) );
  INVX1 U890 ( .A(n804), .Y(n798) );
  MUX2X1 U891 ( .B(n805), .A(n806), .S(n807), .Y(n526) );
  NAND2X1 U892 ( .A(n808), .B(hsize[1]), .Y(n806) );
  INVX1 U893 ( .A(TX_current_hsize[1]), .Y(n805) );
  MUX2X1 U894 ( .B(n724), .A(n809), .S(n807), .Y(n525) );
  NOR2X1 U895 ( .A(n810), .B(n811), .Y(n807) );
  NAND2X1 U896 ( .A(n808), .B(hsize[0]), .Y(n809) );
  OR2X1 U897 ( .A(n565), .B(n812), .Y(n128) );
  OAI21X1 U898 ( .A(haddr[0]), .B(n716), .C(n576), .Y(n812) );
  NAND3X1 U899 ( .A(n574), .B(n813), .C(n808), .Y(n716) );
  INVX1 U900 ( .A(n814), .Y(n808) );
  NAND3X1 U901 ( .A(hwrite), .B(n815), .C(n573), .Y(n814) );
  INVX1 U902 ( .A(n747), .Y(n573) );
  NAND3X1 U903 ( .A(htrans[1]), .B(hsel), .C(n816), .Y(n747) );
  NOR2X1 U904 ( .A(haddr[3]), .B(haddr[2]), .Y(n816) );
  OAI22X1 U905 ( .A(TX_state[2]), .B(n568), .C(n817), .D(n818), .Y(n565) );
  NAND2X1 U906 ( .A(TX_current_hsize[1]), .B(TX_state[1]), .Y(n818) );
  NAND3X1 U907 ( .A(n724), .B(n819), .C(n722), .Y(n817) );
  INVX1 U908 ( .A(TX_current_hsize[0]), .Y(n724) );
  INVX1 U909 ( .A(n820), .Y(n120) );
  MUX2X1 U910 ( .B(last_hsize[2]), .A(hsize[2]), .S(hready), .Y(n820) );
  INVX1 U911 ( .A(n821), .Y(hready) );
  OAI21X1 U912 ( .A(n822), .B(n823), .C(hready_state[1]), .Y(n821) );
  NAND3X1 U913 ( .A(n824), .B(n825), .C(n826), .Y(n823) );
  NOR2X1 U914 ( .A(n827), .B(n828), .Y(n826) );
  XOR2X1 U915 ( .A(last_haddr_RAW[0]), .B(haddr[0]), .Y(n828) );
  XOR2X1 U916 ( .A(last_haddr_RAW[3]), .B(haddr[3]), .Y(n827) );
  XOR2X1 U917 ( .A(n620), .B(last_haddr_RAW[1]), .Y(n825) );
  INVX1 U918 ( .A(haddr[1]), .Y(n620) );
  XOR2X1 U919 ( .A(n598), .B(last_haddr_RAW[2]), .Y(n824) );
  INVX1 U920 ( .A(haddr[2]), .Y(n598) );
  NAND3X1 U921 ( .A(last_hwrite_RAW), .B(htrans[1]), .C(n829), .Y(n822) );
  NOR2X1 U922 ( .A(hwrite), .B(n802), .Y(n829) );
  OAI22X1 U923 ( .A(n830), .B(n831), .C(n780), .D(n832), .Y(hrdata[9]) );
  INVX1 U924 ( .A(flush_buffer_control_reg[1]), .Y(n780) );
  INVX1 U925 ( .A(data_buffer_reg[9]), .Y(n830) );
  AND2X1 U926 ( .A(n833), .B(n834), .Y(hrdata[8]) );
  OAI21X1 U927 ( .A(n835), .B(n836), .C(n837), .Y(n834) );
  AOI22X1 U928 ( .A(d_mode), .B(n838), .C(clear), .D(n839), .Y(n837) );
  OAI21X1 U929 ( .A(n840), .B(n841), .C(n842), .Y(n838) );
  NAND3X1 U930 ( .A(n604), .B(n696), .C(n843), .Y(n842) );
  INVX1 U931 ( .A(data_buffer_reg[8]), .Y(n836) );
  INVX1 U932 ( .A(n844), .Y(n835) );
  AOI21X1 U933 ( .A(n845), .B(n846), .C(n847), .Y(hrdata[7]) );
  NAND2X1 U934 ( .A(RX_transfer_active), .B(n848), .Y(n846) );
  AOI22X1 U935 ( .A(data_buffer_reg[7]), .B(n701), .C(tx_packet_control_reg[7]), .D(n763), .Y(n845) );
  AND2X1 U936 ( .A(n849), .B(n850), .Y(hrdata[6]) );
  OAI21X1 U937 ( .A(n795), .B(n851), .C(n852), .Y(n850) );
  AOI22X1 U938 ( .A(buffer_occupancy[6]), .B(n853), .C(data_buffer_reg[6]), 
        .D(n701), .Y(n852) );
  INVX1 U939 ( .A(tx_packet_control_reg[6]), .Y(n851) );
  AND2X1 U940 ( .A(n849), .B(n854), .Y(hrdata[5]) );
  OAI21X1 U941 ( .A(n795), .B(n855), .C(n856), .Y(n854) );
  AOI22X1 U942 ( .A(buffer_occupancy[5]), .B(n853), .C(data_buffer_reg[5]), 
        .D(n701), .Y(n856) );
  INVX1 U943 ( .A(tx_packet_control_reg[5]), .Y(n855) );
  AND2X1 U944 ( .A(n849), .B(n857), .Y(hrdata[4]) );
  OAI21X1 U945 ( .A(n795), .B(n858), .C(n859), .Y(n857) );
  AOI22X1 U946 ( .A(buffer_occupancy[4]), .B(n853), .C(data_buffer_reg[4]), 
        .D(n701), .Y(n859) );
  INVX1 U947 ( .A(tx_packet_control_reg[4]), .Y(n858) );
  AOI21X1 U948 ( .A(n860), .B(n861), .C(n847), .Y(hrdata[3]) );
  AOI22X1 U949 ( .A(buffer_occupancy[3]), .B(n853), .C(data_buffer_reg[3]), 
        .D(n701), .Y(n861) );
  AOI22X1 U950 ( .A(tx_packet_control_reg[3]), .B(n763), .C(RX_packet[2]), .D(
        n848), .Y(n860) );
  NOR2X1 U951 ( .A(n862), .B(n863), .Y(hrdata[31]) );
  INVX1 U952 ( .A(data_buffer_reg[31]), .Y(n862) );
  NOR2X1 U953 ( .A(n864), .B(n863), .Y(hrdata[30]) );
  INVX1 U954 ( .A(data_buffer_reg[30]), .Y(n864) );
  AOI21X1 U955 ( .A(n865), .B(n866), .C(n847), .Y(hrdata[2]) );
  AOI22X1 U956 ( .A(buffer_occupancy[2]), .B(n853), .C(data_buffer_reg[2]), 
        .D(n701), .Y(n866) );
  AOI22X1 U957 ( .A(TX_packet[2]), .B(n763), .C(RX_packet[1]), .D(n848), .Y(
        n865) );
  NOR2X1 U958 ( .A(n867), .B(n863), .Y(hrdata[29]) );
  INVX1 U959 ( .A(data_buffer_reg[29]), .Y(n867) );
  NOR2X1 U960 ( .A(n868), .B(n863), .Y(hrdata[28]) );
  INVX1 U961 ( .A(data_buffer_reg[28]), .Y(n868) );
  NOR2X1 U962 ( .A(n869), .B(n863), .Y(hrdata[27]) );
  INVX1 U963 ( .A(data_buffer_reg[27]), .Y(n869) );
  NOR2X1 U964 ( .A(n870), .B(n863), .Y(hrdata[26]) );
  INVX1 U965 ( .A(data_buffer_reg[26]), .Y(n870) );
  NOR2X1 U966 ( .A(n871), .B(n863), .Y(hrdata[25]) );
  INVX1 U967 ( .A(data_buffer_reg[25]), .Y(n871) );
  OAI22X1 U968 ( .A(n872), .B(n863), .C(n873), .D(n874), .Y(hrdata[24]) );
  NAND2X1 U969 ( .A(n875), .B(TX_error), .Y(n874) );
  MUX2X1 U970 ( .B(n840), .A(n662), .S(last_haddr[0]), .Y(n875) );
  NAND3X1 U971 ( .A(n833), .B(last_haddr[1]), .C(n604), .Y(n873) );
  NAND2X1 U972 ( .A(n833), .B(n656), .Y(n863) );
  OAI21X1 U973 ( .A(n680), .B(n704), .C(n876), .Y(n656) );
  AOI21X1 U974 ( .A(n661), .B(n696), .C(n702), .Y(n876) );
  INVX1 U975 ( .A(n877), .Y(n702) );
  INVX1 U976 ( .A(n662), .Y(n696) );
  INVX1 U977 ( .A(n878), .Y(n661) );
  NAND3X1 U978 ( .A(last_haddr[1]), .B(last_haddr[0]), .C(n739), .Y(n878) );
  INVX1 U979 ( .A(data_buffer_reg[24]), .Y(n872) );
  NOR2X1 U980 ( .A(n879), .B(n880), .Y(hrdata[23]) );
  INVX1 U981 ( .A(data_buffer_reg[23]), .Y(n879) );
  NOR2X1 U982 ( .A(n881), .B(n880), .Y(hrdata[22]) );
  INVX1 U983 ( .A(data_buffer_reg[22]), .Y(n881) );
  NOR2X1 U984 ( .A(n882), .B(n880), .Y(hrdata[21]) );
  INVX1 U985 ( .A(data_buffer_reg[21]), .Y(n882) );
  NOR2X1 U986 ( .A(n883), .B(n880), .Y(hrdata[20]) );
  INVX1 U987 ( .A(data_buffer_reg[20]), .Y(n883) );
  AOI21X1 U988 ( .A(n884), .B(n885), .C(n847), .Y(hrdata[1]) );
  AOI22X1 U989 ( .A(buffer_occupancy[1]), .B(n853), .C(data_buffer_reg[1]), 
        .D(n701), .Y(n885) );
  AOI22X1 U990 ( .A(TX_packet[1]), .B(n763), .C(RX_packet[0]), .D(n848), .Y(
        n884) );
  NOR2X1 U991 ( .A(n886), .B(n880), .Y(hrdata[19]) );
  INVX1 U992 ( .A(data_buffer_reg[19]), .Y(n886) );
  NOR2X1 U993 ( .A(n887), .B(n880), .Y(hrdata[18]) );
  INVX1 U994 ( .A(data_buffer_reg[18]), .Y(n887) );
  NOR2X1 U995 ( .A(n888), .B(n880), .Y(hrdata[17]) );
  INVX1 U996 ( .A(data_buffer_reg[17]), .Y(n888) );
  OAI22X1 U997 ( .A(n889), .B(n880), .C(n890), .D(n891), .Y(hrdata[16]) );
  NAND2X1 U998 ( .A(RX_error), .B(n849), .Y(n891) );
  INVX1 U999 ( .A(n847), .Y(n849) );
  NAND3X1 U1000 ( .A(last_haddr[1]), .B(n602), .C(n604), .Y(n890) );
  NAND2X1 U1001 ( .A(n833), .B(n676), .Y(n880) );
  OAI21X1 U1002 ( .A(n892), .B(n704), .C(n877), .Y(n676) );
  NAND2X1 U1003 ( .A(n708), .B(n701), .Y(n877) );
  INVX1 U1004 ( .A(n679), .Y(n704) );
  NOR2X1 U1005 ( .A(n748), .B(n727), .Y(n679) );
  INVX1 U1006 ( .A(n765), .Y(n892) );
  NAND2X1 U1007 ( .A(n680), .B(n662), .Y(n765) );
  INVX1 U1008 ( .A(data_buffer_reg[16]), .Y(n889) );
  OAI22X1 U1009 ( .A(n893), .B(n831), .C(n790), .D(n832), .Y(hrdata[15]) );
  INVX1 U1010 ( .A(flush_buffer_control_reg[7]), .Y(n790) );
  INVX1 U1011 ( .A(data_buffer_reg[15]), .Y(n893) );
  OAI22X1 U1012 ( .A(n894), .B(n831), .C(n775), .D(n832), .Y(hrdata[14]) );
  INVX1 U1013 ( .A(flush_buffer_control_reg[6]), .Y(n775) );
  INVX1 U1014 ( .A(data_buffer_reg[14]), .Y(n894) );
  OAI22X1 U1015 ( .A(n895), .B(n831), .C(n788), .D(n832), .Y(hrdata[13]) );
  INVX1 U1016 ( .A(flush_buffer_control_reg[5]), .Y(n788) );
  INVX1 U1017 ( .A(data_buffer_reg[13]), .Y(n895) );
  OAI22X1 U1018 ( .A(n896), .B(n831), .C(n786), .D(n832), .Y(hrdata[12]) );
  INVX1 U1019 ( .A(flush_buffer_control_reg[4]), .Y(n786) );
  INVX1 U1020 ( .A(data_buffer_reg[12]), .Y(n896) );
  OAI22X1 U1021 ( .A(n897), .B(n831), .C(n784), .D(n832), .Y(hrdata[11]) );
  INVX1 U1022 ( .A(flush_buffer_control_reg[3]), .Y(n784) );
  INVX1 U1023 ( .A(data_buffer_reg[11]), .Y(n897) );
  OAI22X1 U1024 ( .A(n898), .B(n831), .C(n782), .D(n832), .Y(hrdata[10]) );
  NAND2X1 U1025 ( .A(n833), .B(n839), .Y(n832) );
  OAI22X1 U1026 ( .A(n840), .B(n795), .C(n899), .D(n804), .Y(n839) );
  NAND3X1 U1027 ( .A(last_haddr[3]), .B(last_haddr[2]), .C(n843), .Y(n804) );
  NOR2X1 U1028 ( .A(last_haddr[1]), .B(n602), .Y(n843) );
  INVX1 U1029 ( .A(n707), .Y(n899) );
  INVX1 U1030 ( .A(flush_buffer_control_reg[2]), .Y(n782) );
  NAND2X1 U1031 ( .A(n833), .B(n844), .Y(n831) );
  OAI22X1 U1032 ( .A(n662), .B(n691), .C(n840), .D(n681), .Y(n844) );
  INVX1 U1033 ( .A(n701), .Y(n681) );
  NAND3X1 U1034 ( .A(last_haddr[0]), .B(n727), .C(n739), .Y(n691) );
  INVX1 U1035 ( .A(data_buffer_reg[10]), .Y(n898) );
  AOI21X1 U1036 ( .A(n900), .B(n901), .C(n847), .Y(hrdata[0]) );
  NAND2X1 U1037 ( .A(n833), .B(n707), .Y(n847) );
  NAND2X1 U1038 ( .A(n840), .B(n662), .Y(n707) );
  NAND2X1 U1039 ( .A(n772), .B(n771), .Y(n662) );
  INVX1 U1040 ( .A(last_hsize[0]), .Y(n772) );
  NOR2X1 U1041 ( .A(n708), .B(n700), .Y(n840) );
  INVX1 U1042 ( .A(n680), .Y(n700) );
  NAND2X1 U1043 ( .A(last_hsize[0]), .B(n771), .Y(n680) );
  NOR2X1 U1044 ( .A(n771), .B(last_hsize[0]), .Y(n708) );
  INVX1 U1045 ( .A(last_hsize[1]), .Y(n771) );
  INVX1 U1046 ( .A(n902), .Y(n833) );
  NAND3X1 U1047 ( .A(n903), .B(n815), .C(n904), .Y(n902) );
  NOR2X1 U1048 ( .A(n802), .B(n770), .Y(n904) );
  INVX1 U1049 ( .A(\last_state_RX[1] ), .Y(n770) );
  INVX1 U1050 ( .A(hsel), .Y(n802) );
  INVX1 U1051 ( .A(hresp), .Y(n815) );
  OAI21X1 U1052 ( .A(hready_state[0]), .B(n905), .C(n548), .Y(hresp) );
  NAND2X1 U1053 ( .A(hready_state[0]), .B(n905), .Y(n548) );
  INVX1 U1054 ( .A(hready_state[1]), .Y(n905) );
  NOR2X1 U1055 ( .A(last_hwrite), .B(last_hsize[2]), .Y(n903) );
  AOI22X1 U1056 ( .A(buffer_occupancy[0]), .B(n853), .C(data_buffer_reg[0]), 
        .D(n701), .Y(n901) );
  NOR2X1 U1057 ( .A(n748), .B(last_haddr[1]), .Y(n701) );
  NAND2X1 U1058 ( .A(n739), .B(n602), .Y(n748) );
  NOR2X1 U1059 ( .A(last_haddr[2]), .B(last_haddr[3]), .Y(n739) );
  INVX1 U1060 ( .A(n906), .Y(n853) );
  NAND3X1 U1061 ( .A(last_haddr[3]), .B(n602), .C(n907), .Y(n906) );
  NOR2X1 U1062 ( .A(last_haddr[2]), .B(last_haddr[1]), .Y(n907) );
  AOI22X1 U1063 ( .A(TX_packet[0]), .B(n763), .C(n848), .D(RX_data_ready), .Y(
        n900) );
  INVX1 U1064 ( .A(n841), .Y(n848) );
  NAND3X1 U1065 ( .A(n602), .B(n727), .C(n604), .Y(n841) );
  NOR2X1 U1066 ( .A(n612), .B(last_haddr[3]), .Y(n604) );
  INVX1 U1067 ( .A(last_haddr[2]), .Y(n612) );
  INVX1 U1068 ( .A(n795), .Y(n763) );
  NAND2X1 U1069 ( .A(n797), .B(n727), .Y(n795) );
  INVX1 U1070 ( .A(last_haddr[1]), .Y(n727) );
  INVX1 U1071 ( .A(n609), .Y(n797) );
  NAND3X1 U1072 ( .A(last_haddr[2]), .B(n602), .C(last_haddr[3]), .Y(n609) );
  INVX1 U1073 ( .A(last_haddr[0]), .Y(n602) );
  INVX1 U1074 ( .A(n561), .Y(get_RX_data) );
  NOR2X1 U1075 ( .A(n730), .B(next_RX_state[3]), .Y(n561) );
  NAND2X1 U1076 ( .A(n663), .B(n642), .Y(next_RX_state[3]) );
  NAND3X1 U1077 ( .A(n578), .B(n582), .C(RX_state[0]), .Y(n642) );
  NAND3X1 U1078 ( .A(n745), .B(n582), .C(n578), .Y(n663) );
  NOR2X1 U1079 ( .A(n581), .B(RX_state[3]), .Y(n578) );
  INVX1 U1080 ( .A(RX_state[2]), .Y(n581) );
  INVX1 U1081 ( .A(RX_state[1]), .Y(n582) );
  NAND2X1 U1082 ( .A(n629), .B(n622), .Y(n730) );
  NAND3X1 U1083 ( .A(RX_state[0]), .B(n564), .C(RX_state[1]), .Y(n622) );
  NAND3X1 U1084 ( .A(n564), .B(n745), .C(RX_state[1]), .Y(n629) );
  INVX1 U1085 ( .A(RX_state[0]), .Y(n745) );
  NOR2X1 U1086 ( .A(RX_state[2]), .B(RX_state[3]), .Y(n564) );
  NAND2X1 U1087 ( .A(n908), .B(n909), .Y(TX_data[7]) );
  AOI22X1 U1088 ( .A(data_buffer_reg[23]), .B(n715), .C(data_buffer_reg[31]), 
        .D(n810), .Y(n909) );
  AOI22X1 U1089 ( .A(data_buffer_reg[7]), .B(n910), .C(data_buffer_reg[15]), 
        .D(n911), .Y(n908) );
  NAND2X1 U1090 ( .A(n912), .B(n913), .Y(TX_data[6]) );
  AOI22X1 U1091 ( .A(data_buffer_reg[22]), .B(n715), .C(data_buffer_reg[30]), 
        .D(n810), .Y(n913) );
  AOI22X1 U1092 ( .A(data_buffer_reg[6]), .B(n910), .C(data_buffer_reg[14]), 
        .D(n911), .Y(n912) );
  NAND2X1 U1093 ( .A(n914), .B(n915), .Y(TX_data[5]) );
  AOI22X1 U1094 ( .A(data_buffer_reg[21]), .B(n715), .C(data_buffer_reg[29]), 
        .D(n810), .Y(n915) );
  AOI22X1 U1095 ( .A(data_buffer_reg[5]), .B(n910), .C(data_buffer_reg[13]), 
        .D(n911), .Y(n914) );
  NAND2X1 U1096 ( .A(n916), .B(n917), .Y(TX_data[4]) );
  AOI22X1 U1097 ( .A(data_buffer_reg[20]), .B(n715), .C(data_buffer_reg[28]), 
        .D(n810), .Y(n917) );
  AOI22X1 U1098 ( .A(data_buffer_reg[4]), .B(n910), .C(data_buffer_reg[12]), 
        .D(n911), .Y(n916) );
  NAND2X1 U1099 ( .A(n918), .B(n919), .Y(TX_data[3]) );
  AOI22X1 U1100 ( .A(data_buffer_reg[19]), .B(n715), .C(data_buffer_reg[27]), 
        .D(n810), .Y(n919) );
  AOI22X1 U1101 ( .A(data_buffer_reg[3]), .B(n910), .C(data_buffer_reg[11]), 
        .D(n911), .Y(n918) );
  NAND2X1 U1102 ( .A(n920), .B(n921), .Y(TX_data[2]) );
  AOI22X1 U1103 ( .A(data_buffer_reg[18]), .B(n715), .C(data_buffer_reg[26]), 
        .D(n810), .Y(n921) );
  AOI22X1 U1104 ( .A(data_buffer_reg[2]), .B(n910), .C(data_buffer_reg[10]), 
        .D(n911), .Y(n920) );
  NAND2X1 U1105 ( .A(n922), .B(n923), .Y(TX_data[1]) );
  AOI22X1 U1106 ( .A(data_buffer_reg[17]), .B(n715), .C(data_buffer_reg[25]), 
        .D(n810), .Y(n923) );
  AOI22X1 U1107 ( .A(data_buffer_reg[1]), .B(n910), .C(data_buffer_reg[9]), 
        .D(n911), .Y(n922) );
  NAND2X1 U1108 ( .A(n924), .B(n925), .Y(TX_data[0]) );
  AOI22X1 U1109 ( .A(data_buffer_reg[16]), .B(n715), .C(data_buffer_reg[24]), 
        .D(n810), .Y(n925) );
  OAI21X1 U1110 ( .A(n811), .B(n926), .C(n545), .Y(n810) );
  NAND2X1 U1111 ( .A(n722), .B(n813), .Y(n545) );
  NAND2X1 U1112 ( .A(n813), .B(n927), .Y(n811) );
  NOR2X1 U1113 ( .A(TX_state[0]), .B(TX_state[1]), .Y(n813) );
  INVX1 U1114 ( .A(n568), .Y(n715) );
  NAND3X1 U1115 ( .A(TX_state[1]), .B(n926), .C(TX_state[0]), .Y(n568) );
  INVX1 U1116 ( .A(TX_state[3]), .Y(n926) );
  AOI22X1 U1117 ( .A(data_buffer_reg[0]), .B(n910), .C(data_buffer_reg[8]), 
        .D(n911), .Y(n924) );
  OAI21X1 U1118 ( .A(n723), .B(n928), .C(n712), .Y(n911) );
  NAND3X1 U1119 ( .A(n574), .B(n819), .C(TX_state[1]), .Y(n712) );
  NAND2X1 U1120 ( .A(n722), .B(n819), .Y(n928) );
  OAI21X1 U1121 ( .A(n819), .B(n929), .C(n576), .Y(n910) );
  NAND3X1 U1122 ( .A(n574), .B(n723), .C(TX_state[0]), .Y(n576) );
  NOR2X1 U1123 ( .A(TX_state[3]), .B(TX_state[2]), .Y(n574) );
  NAND2X1 U1124 ( .A(n722), .B(n723), .Y(n929) );
  INVX1 U1125 ( .A(TX_state[1]), .Y(n723) );
  NOR2X1 U1126 ( .A(n927), .B(TX_state[3]), .Y(n722) );
  INVX1 U1127 ( .A(TX_state[2]), .Y(n927) );
  INVX1 U1128 ( .A(TX_state[0]), .Y(n819) );
endmodule

