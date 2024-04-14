#!/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo -e "\n\e[31m[fail]\e[0m Please run the installer as root..."
    exit 1
fi

if [[ $1 == "unistall" ]]; then
    echo -e "\n\e[33m[info]\e[0m Uninstalling..."
    rm -rf /usr/local/bin/ssh-alias
    echo -e "\n\e[32m[done]\e[0m Uninstalled successfully!"
    exit 0
fi

source /TUI/main.sh
