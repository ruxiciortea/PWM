## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
# Mode Selectros
set_property PACKAGE_PIN V17 [get_ports {mode[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[0]}]
set_property PACKAGE_PIN V16 [get_ports {mode[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {mode[1]}]

# Time Interval Selectors for Automatic Mode	
set_property PACKAGE_PIN W16 [get_ports {time_interval[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {time_interval[0]}]
set_property PACKAGE_PIN W17 [get_ports {time_interval[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {time_interval[1]}]
set_property PACKAGE_PIN W15 [get_ports {time_interval[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {time_interval[2]}]

# Intensity Selectors for Manual Mode	
set_property PACKAGE_PIN V2 [get_ports {duty_cycle[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[0]}]
set_property PACKAGE_PIN T3 [get_ports {duty_cycle[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[1]}]
set_property PACKAGE_PIN T2 [get_ports {duty_cycle[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[2]}]
set_property PACKAGE_PIN R3 [get_ports {duty_cycle[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[3]}]
set_property PACKAGE_PIN W2 [get_ports {duty_cycle[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[4]}]
set_property PACKAGE_PIN U1 [get_ports {duty_cycle[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[5]}]
set_property PACKAGE_PIN T1 [get_ports {duty_cycle[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[6]}]
set_property PACKAGE_PIN R2 [get_ports {duty_cycle[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {duty_cycle[7]}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {out_signal[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[0]}]
set_property PACKAGE_PIN W6 [get_ports {out_signal[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[1]}]
set_property PACKAGE_PIN U8 [get_ports {out_signal[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[2]}]
set_property PACKAGE_PIN V8 [get_ports {out_signal[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[3]}]
set_property PACKAGE_PIN U5 [get_ports {out_signal[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[4]}]
set_property PACKAGE_PIN V5 [get_ports {out_signal[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[5]}]
set_property PACKAGE_PIN U7 [get_ports {out_signal[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {out_signal[6]}]

set_property PACKAGE_PIN U2 [get_ports {anods_on[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anods_on[0]}]
set_property PACKAGE_PIN U4 [get_ports {anods_on[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anods_on[1]}]
set_property PACKAGE_PIN V4 [get_ports {anods_on[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anods_on[2]}]
set_property PACKAGE_PIN W4 [get_ports {anods_on[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {anods_on[3]}]