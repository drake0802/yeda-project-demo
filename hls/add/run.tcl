### vitis hls parameters
set Project     proj1
set Solution    solution1
set Device      xcu50-fsvh2104-2-e
set Clock       10
set DefaultFlag 1

# presettings
open_project $Project -reset

### add user's solution
add_files top.cpp

add_files -tb tb.cpp -cflags "-I."

set_top top

open_solution -reset $Solution
set_part $Device
create_clock -period $Clock

# run
csim_design
csynth_design
cosim_design -rtl verilog -trace_level all

exit
