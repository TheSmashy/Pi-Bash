#!/bin/bash

for i in `seq 1 10`;
do
	echo 0 >/sys/class/leds/led0/brightness
	sleep 0.3
	echo 1 >/sys/class/leds/led0/brightness
	sleep 0.3
done

echo 0 >/sys/class/leds/led0/brightness
sleep 0.3
