@echo off
ghdl -a ../utility/bookutility.vhd

ghdl -a %1.vhd
ghdl -a %1_tb.vhd
ghdl -r %1_tb --wave=%1.ghw --vcd=%1.vcd