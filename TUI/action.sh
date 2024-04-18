#! bin/bash

source locales/us-en/strings.sh

ACTION_KEY=$(whiptail --title "$TITLE_ACTION" --menu "$ACTION" 15 50 4 \
    "Disk Activity" "" \
    "Network Activity" "" \
    3>&1 1>&2 2>&3)

export ACTION_KEY