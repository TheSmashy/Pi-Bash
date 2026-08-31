#!/bin/bashfor i in `seq 1 5`;do	echo 0 >/sys/class/leds/led0/brightness	sleep 0.3	echo 1 >/sys/class/leds/led0/brightness	sleep 0.3doneecho 0 >/sys/class/leds/led0/brightnesssleep 0.3
