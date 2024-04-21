#!/bin/bash

# indicator to use [caps, num, scroll]
INDICATOR=$3
device=4

getVmstat() {
    cat /proc/vmstat | grep -E "pgpgin|pgpgout"
}

# turn led on
function led_on() {
    echo "1" > /sys/class/leds/input$device::$INDICATOR/brightness
}

# turn led off
function led_off() {
    echo "0" > /sys/class/leds/input$device::$INDICATOR/brightness
}

# initialise variables
NEW=$(getVmstat)
OLD=$(getVmstat)

while :; do
    NEW=$(getVmstat)

    # compare state
    if [ "$NEW" = "$OLD" ]; then
        led_off
    else
        led_on
    fi
    OLD=$NEW
done