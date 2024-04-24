#! bin/bash

source locales/us-en/strings.sh

CHOICE=$(whiptail --title "$TITLE" --cancel-button "Exit" --menu "$MENU" 15 50 4 \
    1 "Install Mod" \
    2 "Uninstall Mod" \
    3 "Test Keyboard" \
    3>&1 1>&2 2>&3)

if [ "$CHOICE" == "1" ]; then
    source TUI/config.sh
    source TUI/action.sh
    python3 utils/mod_generator.py $KEY_ACTION $KEY
    mkdir -p /etc/key_mod
    mv mod.sh /etc/key_mod
    chmod +x /etc/key_mod/mod.sh
    python3 utils/service_generator.py $KEY_ACTION $KEY
    mv "$KEY.service" /etc/systemd/system/
    /sbin/restorecon -v "/etc/systemd/system/$KEY.service"
    systemctl start "$KEY.service"
    systemctl enable "$KEY.service"
    exit 0
elif [ "$CHOICE" == "2" ]; then
    source TUI/uninstall.sh
elif [ "$CHOICE" == "3" ]; then
    source TUI/test.sh
elif [ -z "$CHOICE" ]; then
    exit 0
fi