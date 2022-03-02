#! /bin/bash

rm ./generated/ ./project/ ./target/ -rf
sbt 'test:runMain test.AdderTestGen -td ./generated/addertest --backend-name verilator' 

vcd2wavedrom --input ./generated/addertest/*/Adder.vcd --exclude exclude.txt --include include.txt --output wave.drom