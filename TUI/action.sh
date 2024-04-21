#! bin/bash

source locales/us-en/strings.sh

KEY_ACTION=$(whiptail --title "$TITLE_ACTION" --cancel-button "Back" --menu "$ACTION" 15 50 4 \
    "Disk Activity" "" \
    "Network Activity" "" \
    3>&1 1>&2 2>&3)

exit_status=$?
if [ $exit_status == 1 ]; then
    source TUI/config.sh
    source TUI/action.sh
fi

export KEY_ACTION