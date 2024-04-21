source locales/us-en/strings.sh
KEY_ID=4

function test_keyboard() {
    while :; do
        echo "1" > /sys/class/leds/input$KEY_ID::scrolllock/brightness
        echo "1" > /sys/class/leds/input$KEY_ID::numlock/brightness
        echo "1" > /sys/class/leds/input$KEY_ID::capslock/brightness
        sleep 0.5
        echo "0" > /sys/class/leds/input$KEY_ID::scrolllock/brightness
        echo "0" > /sys/class/leds/input$KEY_ID::numlock/brightness
        echo "0" > /sys/class/leds/input$KEY_ID::capslock/brightness
        sleep 1
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