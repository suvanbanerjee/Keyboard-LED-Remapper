#! /bin/bash

DISTRO_NAME=$(source /etc/os-release && echo "$ID")

case "$DISTRO_NAME" in
debian | ubuntu | raspbian | linuxmint)
    apt-get update
    apt-get install --no-install-recommends -y python whiptail
    ;;
fedora)
    dnf install -y python3 newt
    ;;
rocky | centos)
    dnf install -y python3 newt
    ;;
opensuse-tumbleweed | opensuse-leap)
    zypper install -y python3 newt
    ;;
arch | manjaro | endeavouros)
    pacman -Sy --noconfirm python libnewt
    ;;
*)
    echo "Operating system not supported."
    exit 1
    ;;
esac
