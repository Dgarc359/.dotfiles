#!/bin/bash


cpu_temp() {
	cat /sys/class/thermal/thermal_zone*/temp | while read temp; do
	    echo "CPU: $((temp/1000))°C"
    done
}

