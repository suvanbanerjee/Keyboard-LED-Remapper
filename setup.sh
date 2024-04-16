#!/bin/env bash

if [[ $EUID -ne 0 ]]; then
    echo -e "\n\e[31m[fail]\e[0m Please run the installer as root..."
    exit 1
fi

source TUI/main.sh
