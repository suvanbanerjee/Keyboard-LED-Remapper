#! bin/bash

source locales/us-en/strings.sh

KEY=$(whiptail --title "$TITLE_CONFIG" --cancel-button "Back" --menu "$CONFIG" 15 50 4 \
    "Num Lock" "" \
    "Caps Lock" "" \
    "Scroll Lock" "" \
    3>&1 1>&2 2>&3)

exit_status=$?
if [ $exit_status == 1 ]; then
    source TUI/main.sh
    source TUI/config.sh
fi
if [ "$KEY" == "Num Lock" ]; then
    KEY="numlock"
elif [ "$KEY" == "Caps Lock" ]; then
    KEY="capslock"
elif [ "$KEY" == "Scroll Lock" ]; then
    KEY="scrolllock"
fi

export KEY