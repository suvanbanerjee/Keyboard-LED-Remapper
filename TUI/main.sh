#! bin/bash

source locales/us-en/strings.sh

SESSION_TYPE= $XDG_SESSION_TYPE
CHOICE=$(whiptail --title "$TITLE" --menu "$MENU" 25 78 16 \
    "1" "Install Mod" \
    "2" "Uninstall Mod" \
    "3" "Test Keyboard" \
    3>&1 1>&2 2>&3)

case $CHOICE in
    "1")
        if [ "$SESSION_TYPE" == "tty" ]; then
            echo "You are in a tty session, please switch to a graphical session to install the mod."
            exit 1
        fi
        source TUI/config.sh
        ;;
    "2")
        SESSION_TYPE="uninstall"
        # TODO
        pass
        ;;
    "3")
        SESSION_TYPE="test"
        source TUI/test.sh
        source TUI/main.sh
        ;;
esac

