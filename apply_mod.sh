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