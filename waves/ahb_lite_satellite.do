onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_satellite/test_name
add wave -noupdate /tb_ahb_lite_satellite/clk
add wave -noupdate /tb_ahb_lite_satellite/n_rst
add wave -noupdate /tb_ahb_lite_satellite/d_mode
add wave -noupdate /tb_ahb_lite_satellite/DUT/state
add wave -noupdate -divider {Bus In}
add wave -noupdate /tb_ahb_lite_satellite/hsel
add wave -noupdate /tb_ahb_lite_satellite/haddr
add wave -noupdate /tb_ahb_lite_satellite/hsize
add wave -noupdate /tb_ahb_lite_satellite/hburst
add wave -noupdate /tb_ahb_lite_satellite/htrans
add wave -noupdate /tb_ahb_lite_satellite/hwrite
add wave -noupdate /tb_ahb_lite_satellite/hwdata
add wave -noupdate -divider {Bus Out}
add wave -noupdate /tb_ahb_lite_satellite/hrdata
add wave -noupdate /tb_ahb_lite_satellite/hresp
add wave -noupdate /tb_ahb_lite_satellite/hready
add wave -noupdate /tb_ahb_lite_satellite/DUT/hready_state
add wave -noupdate -divider RX
add wave -noupdate /tb_ahb_lite_satellite/DUT/RX_state
add wave -noupdate /tb_ahb_lite_satellite/RX_packet
add wave -noupdate /tb_ahb_lite_satellite/RX_data_ready
add wave -noupdate /tb_ahb_lite_satellite/RX_transfer_active
add wave -noupdate /tb_ahb_lite_satellite/RX_error
add wave -noupdate -divider Buffer
add wave -noupdate /tb_ahb_lite_satellite/buffer_occupancy
add wave -noupdate /tb_ahb_lite_satellite/clear_done
add wave -noupdate /tb_ahb_lite_satellite/get_RX_data
add wave -noupdate /tb_ahb_lite_satellite/store_TX_data
add wave -noupdate /tb_ahb_lite_satellite/RX_data
add wave -noupdate /tb_ahb_lite_satellite/TX_data
add wave -noupdate /tb_ahb_lite_satellite/clear
add wave -noupdate -divider TX
add wave -noupdate /tb_ahb_lite_satellite/DUT/TX_state
add wave -noupdate /tb_ahb_lite_satellite/TX_error
add wave -noupdate /tb_ahb_lite_satellite/TX_transfer_active
add wave -noupdate /tb_ahb_lite_satellite/packet_done
add wave -noupdate /tb_ahb_lite_satellite/TX_packet
add wave -noupdate -divider REG
add wave -noupdate /tb_ahb_lite_satellite/DUT/data_buffer_reg
add wave -noupdate /tb_ahb_lite_satellite/DUT/error_reg
add wave -noupdate /tb_ahb_lite_satellite/DUT/status_reg
add wave -noupdate /tb_ahb_lite_satellite/DUT/buffer_occupancy_reg
add wave -noupdate /tb_ahb_lite_satellite/DUT/tx_packet_control_reg
add wave -noupdate /tb_ahb_lite_satellite/DUT/flush_buffer_control_reg
add wave -noupdate -divider {Data Buffer Values}
add wave -noupdate /tb_ahb_lite_satellite/BD/dataregs/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {93820 ps} 0}
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
WaveRestoreZoom {749301 ps} {849051 ps}
