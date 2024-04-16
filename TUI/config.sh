#! bin/bash

source locales/us-en/strings.sh

KEY=$(whiptail --title "$TITLE_CONFIG" --menu "$CONFIG" 15 50 4 \
    "Num Lock" "" \
    "Caps Lock" "" \
    "Scroll Lock" "" \
    3>&1 1>&2 2>&3)

export KEY