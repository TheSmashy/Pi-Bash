#!/bin/sh

while true #run indefinitely
do
inotifywait -e modify,close_write /home/pi/responder/logs/HTTP-NTLMv2-192.168.2.1.txt && /bin/bash /home/pi/blink_two.sh
done