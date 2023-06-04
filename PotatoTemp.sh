#!/bin/bash
#
# check_cpu_temp
#
# Bill deWindt 10-08-2020
# script to query the CPU temp from /sys and display
# it in degC and degF.
#
if [ ! -f /sys/class/thermal/thermal_zone0/temp ]; 
then
        echo "ERROR: Thermal data not present."
        exit
fi

if [[ $(which bc | wc -c) -ne 0 ]];
then
        CPUOUT=`cat /sys/class/thermal/thermal_zone0/temp`
        CPUC=`cut -c1-2 <<< $CPUOUT`.`cut -c3-5 <<< $CPUOUT`
        # formula: Temp F=(9/5)*Temp C + 32
        CPUF=$(echo "scale=2;((9/5) * $CPUC) + 32" | bc)
        echo "Current CPU Temp:"
        echo 'C:'$CPUC '     F:'$CPUF
else
        echo "ERROR: bc not found in PATH"
fi
