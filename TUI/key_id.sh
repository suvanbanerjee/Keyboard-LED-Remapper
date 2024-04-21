#!/bin/bash

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

