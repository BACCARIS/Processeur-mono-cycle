onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_alu_registre/CLK
add wave -noupdate /tb_alu_registre/RST
add wave -noupdate /tb_alu_registre/RA
add wave -noupdate /tb_alu_registre/RB
add wave -noupdate /tb_alu_registre/RW
add wave -noupdate /tb_alu_registre/WE
add wave -noupdate /tb_alu_registre/OP
add wave -noupdate /tb_alu_registre/N
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 227
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {933 ps}
