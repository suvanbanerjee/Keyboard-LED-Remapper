#! bin/bash
source locales/us-en/strings.sh

UNINSTALL=$(whiptail --title "$TITLE_UNINSTALL" --yesno "$UNINSTALL" 10 50 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    ls /etc/systemd/system/ | grep -E '(numlock|capslock|scrolllock).service'
    if [ $? -eq 0 ]; then
        systemctl stop $(ls /etc/systemd/system/ | grep -E '(numlock|capslock|scrolllock).service')
        systemctl disable $(ls /etc/systemd/system/ | grep -E '(numlock|capslock|scrolllock).service')
        rm -f /etc/systemd/system/$(ls /etc/systemd/system/ | grep -E '(numlock|capslock|scrolllock).service')
    fi
    rm -rf /etc/key_mod
    echo "Uninstalled successfully."
else
    source TUI/main.sh
fi