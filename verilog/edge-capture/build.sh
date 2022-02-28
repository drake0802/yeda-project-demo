#! /bin/bash
set -e

deps=("iverilog vvp")
for dep in $deps; do
    if ! command -v $dep &> /dev/null
    then
        echo "$dep not found"
        exit 1
    fi
done

echo "command deps OK..."

# compile
iverilog -v -o wave edge_capture.v edge_capture_tb.v

# dump wave, limited filesize under 128MiB
sh -c "ulimit -f 262144; vvp -n wave -vcd"

# generate wave png
vcd2wavedrom --input wave.vcd --exclude exclude.txt --include include.txt --output wave.drom

