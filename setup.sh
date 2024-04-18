#!/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo -e "\n\e[31m[fail]\e[0m Please run the installer as root..."
    exit 1
fi

source TUI/main.sh

exit_status=$?
if [ $exit_status -eq 0 ]; then
    echo -e "\n\e[32m[success]\e[0m Done! Please restart your session to apply the changes."
else
    echo -e "\n\e[31m[fail]\e[0m An error occurred."
    exit 1
fi

exit 0