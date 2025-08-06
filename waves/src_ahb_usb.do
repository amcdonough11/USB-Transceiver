onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_usb/test_name
add wave -noupdate /tb_ahb_usb/sub_test
add wave -noupdate /tb_ahb_usb/clk
add wave -noupdate /tb_ahb_usb/n_rst
add wave -noupdate -divider AHB
add wave -noupdate -expand -group in /tb_ahb_usb/hsel
add wave -noupdate -expand -group in /tb_ahb_usb/haddr
add wave -noupdate -expand -group in /tb_ahb_usb/hsize
add wave -noupdate -expand -group in /tb_ahb_usb/hburst
add wave -noupdate -expand -group in /tb_ahb_usb/htrans
add wave -noupdate -expand -group in /tb_ahb_usb/hwrite
add wave -noupdate -expand -group in /tb_ahb_usb/hwdata
add wave -noupdate /tb_ahb_usb/DUT/AHB/RX_data
add wave -noupdate /tb_ahb_usb/DUT/AHB/store_TX_data
add wave -noupdate -expand -group out /tb_ahb_usb/hrdata
add wave -noupdate -expand -group out /tb_ahb_usb/hresp
add wave -noupdate -expand -group out /tb_ahb_usb/hready
add wave -noupdate /tb_ahb_usb/DUT/AHB/TX_data
add wave -noupdate /tb_ahb_usb/DUT/AHB/get_RX_data
add wave -noupdate -expand -group Reg /tb_ahb_usb/DUT/AHB/data_buffer_reg
add wave -noupdate -expand -group Reg /tb_ahb_usb/DUT/AHB/tx_packet_control_reg
add wave -noupdate -expand -group Reg /tb_ahb_usb/DUT/AHB/flush_buffer_control_reg
add wave -noupdate -divider d
add wave -noupdate /tb_ahb_usb/d_mode
add wave -noupdate -divider TX
add wave -noupdate /tb_ahb_usb/dp_out
add wave -noupdate /tb_ahb_usb/dm_out
add wave -noupdate /tb_ahb_usb/DUT/TX/fsm/state
add wave -noupdate /tb_ahb_usb/DUT/TX/c8bit_rollover_flag
add wave -noupdate /tb_ahb_usb/DUT/TX/buffer_occupancy
add wave -noupdate /tb_ahb_usb/DUT/TX/fsm/bit8sr/parallel_out
add wave -noupdate -divider RX
add wave -noupdate /tb_ahb_usb/dp_in
add wave -noupdate /tb_ahb_usb/dm_in
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_data_ready
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_transfer_active
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_error
add wave -noupdate /tb_ahb_usb/DUT/RX/flush
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_packet
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_packet_data
add wave -noupdate /tb_ahb_usb/DUT/RX/RX_CONTROLLER/state
add wave -noupdate -divider {Data buffer}
add wave -noupdate /tb_ahb_usb/DUT/DB/clear
add wave -noupdate /tb_ahb_usb/DUT/DB/flush
add wave -noupdate /tb_ahb_usb/DUT/DB/waddr
add wave -noupdate /tb_ahb_usb/DUT/DB/raddr_temp
add wave -noupdate /tb_ahb_usb/DUT/DB/store_TX_data
add wave -noupdate /tb_ahb_usb/DUT/DB/store_RX_packet_data
add wave -noupdate /tb_ahb_usb/DUT/DB/TX_data
add wave -noupdate /tb_ahb_usb/DUT/DB/RX_packet_data
add wave -noupdate /tb_ahb_usb/DUT/DB/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {249098985 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {249063301 ps} {249146699 ps}
