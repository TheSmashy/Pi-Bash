#!/bin/bash

for i in `seq 1 2`;
do
	echo 0 >/sys/class/leds/led0/brightness
	sleep 0.3
	echo 1 >/sys/class/leds/led0/brightness
	sleep 0.3
done

echo mmc0 | sudo tee /sys/class/leds/led0/trigger
