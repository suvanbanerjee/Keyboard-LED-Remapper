#! bin/bash

source locales/us-en/strings.sh

SESSION_TYPE=$XDG_SESSION_TYPE

CHOICE=$(whiptail --title "$TITLE" --cancel-button "Exit" --menu "$MENU" 15 50 4 \
    1 "Install Mod" \
    2 "Uninstall Mod" \
    3 "Test Keyboard" \
    3>&1 1>&2 2>&3)

if [ "$CHOICE" == "1" ]; then
    source TUI/config.sh
    if [ "$SESSION_TYPE" == "Wayland" ]; then
        source TUI/Wayland/KEYBOARD_ID.sh
    fi
    source TUI/action.sh
elif [ "$CHOICE" == "2" ]; then
    source TUI/uninstall.sh
elif [ "$CHOICE" == "3" ]; then
    source TUI/test_keyboard.sh
elif [ -z "$CHOICE" ]; then
    exit 0
fi

if [ "$SESSION_TYPE" == "Wayland" ]; then
    source TUI/Wayland/apply_mod.sh
else
    source TUI/X11/apply_mod.sh
fi

echo "Mod applied successfully. Please restart your session."
exit 0