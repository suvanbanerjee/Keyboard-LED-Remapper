source locales/us-en/strings.sh
KEY_ID=4
RUN_TEST_KEYBOARD=true

function test_keyboard() {
    while [ "$RUN_TEST_KEYBOARD" = true ]; do
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
        RUN_TEST_KEYBOARD=false
    fi
}

test_keyboard & tui