#!/bin/env bash

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo -e "\n\e[31m[fail]\e[0m Please run the installer as root..."
fi

# Check for git command to be installed
if ! command -v git &>/dev/null; then
    echo -e "\n\e[31m[fail]\e[0m git command not found..."
    echo -e "       Please install git package before running the installer.\n"
    exit 1
fi

#checking for prerequisites
if ! command -v python3 &>/dev/null || ! command -v whiptail &>/dev/null; then
    source utils/install_required.sh
fi

# Remove keyboard-led-remapper directory if exists
installer_path="$RUN_AS_HOME/Keyboard-LED-Remapper"
if [[ -d "$installer_path" ]]; then
    rm -rf "$installer_path"
fi

# Clone the latest version of ovos-installer git repository
git clone --quiet https://github.com/suvanbanerjee/Keyboard-LED-Remapper.git "$installer_path"
cd "$installer_path" || exit 1

# Execute the installer entrypoint
bash setup.sh "$@"

# Delete Keyboard-LED-Remapper directory once the installer is successful
exit_status="$?"
if [ "$exit_status" -eq 0 ]; then
    cd "$RUN_AS_HOME" || exit 1
    rm -rf "$installer_path"
fi
