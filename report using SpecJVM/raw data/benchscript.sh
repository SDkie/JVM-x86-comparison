#!/bin/bash

rm output
currentdir=$PWD
cd /home/komal/Desktop/GSOC/benchmark/SpecVM/
java -jar SPECjvm2008.jar -wt 5s -it 5s -bt 2 compress > $currentdir/output &
cd -
rm cpu.dat
rm mem.dat

processID=$(ps -C java -o pid | tail -n1)
while [ "$processID" != "  PID" ]
do
	ps -p $processID -o %cpu |tail -n1 >> cpu.dat
	ps -p $processID -o %mem |tail -n1 >> mem.dat
	sleep 1
	processID=$(ps -C java -o pid | tail -n1)
done
