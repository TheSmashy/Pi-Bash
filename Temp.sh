#!/bin/bash
# check_cpu_temp
#
CPUOUT=`cat /sys/class/thermal/thermal_zone0/temp`
CPUC=`cut -c1-2 <<< $CPUOUT`.`cut -c3-5 <<< $CPUOUT`
# formula: Temp F=(9/5)*Temp C + 32
CPUF=$(echo "scale=2;((9/5) * $CPUC) + 32" | bc)
echo "Current CPU Temp:"
echo 'C:'$CPUC '     F:'$CPUF
