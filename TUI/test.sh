source locales/us-en/strings.sh


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

function test_keyboard() {
    while :; do
        for device in "${devices[@]}"; do
            for led in "numlock" "capslock" "scrolllock"; do
                echo "1" > /sys/class/leds/input$device::$led/brightness
                sleep 0.1
                echo "0" > /sys/class/leds/input$device::$led/brightness
                sleep 0.1
            done
        done
    done
}

function tui() {
    CHOICE=$(whiptail --title "$TITLE_TEST" --msgbox "$TEST_KEYBOARD" 15 50 4 \
        3>&1 1>&2 2>&3)
    if [ "$CHOICE" == 1 ]; then
        exit 0
    fi
}

test_keyboard & 
test_keyboard_pid=$!
tui
kill $test_keyboard_pid
source TUI/main.sh