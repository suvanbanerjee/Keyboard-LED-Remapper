#!/bin/bash

INDICATOR=$3
path="/sys/class/leds"
pattern="input([0-9]+)::(scrolllock|numlock|capslock)"

input_devices=()

if [[ ! -d $path ]]; then
    exit 1
fi

for led in "$path"/*; do
    if [[ $led =~ $pattern ]]; then
        input_devices+=("${BASH_REMATCH[1]}")
    fi
done

devices=($(for v in "${input_devices[@]}"; do echo "$v"; done | sort -u))

function DiskActivity() {
        
    getVmstat() {
        cat /proc/vmstat | grep -E "pgpgin|pgpgout"
    }

    # initialise variables
    NEW=$(getVmstat)
    OLD=$(getVmstat)

    while :; do
        NEW=$(getVmstat)
        if [ "$NEW" = "$OLD" ]; then
            for device in "${devices[@]}"; do
                echo "0" > /sys/class/leds/input$device::$INDICATOR/brightness
            done
        else
            for device in "${devices[@]}"; do
                echo "1" > /sys/class/leds/input$device::$INDICATOR/brightness
            done
        fi
        OLD=$NEW
    done
}

function NetworkActivity() {
    getNetstat() {
        cat /proc/net/dev | grep -E "eth0|wlan0|wl*" | awk '{print $2,$10}'
    }

    # initialise variables
    NEW=$(getNetstat)
    OLD=$(getNetstat)

    while :; do
        NEW=$(getNetstat)
        if [ "$NEW" = "$OLD" ]; then
            for device in "${devices[@]}"; do
                echo "0" > /sys/class/leds/input$device::$INDICATOR/brightness
            done
        else
            for device in "${devices[@]}"; do
                echo "1" > /sys/class/leds/input$device::$INDICATOR/brightness
            done
        fi
        OLD=$NEW
    done
}

case $1 in
    Disk)
        DiskActivity
        ;;
    Network)
        NetworkActivity
        ;;
    *)
        exit 1
        ;;
esac