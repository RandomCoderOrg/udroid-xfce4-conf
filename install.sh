#!/usr/bin/env bash

_c_magneta="\e[95m"
_c_green="\e[32m"
_c_red="\e[31m"
_c_blue="\e[34m"
RST="\e[0m"

die()    { echo -e "${_c_red}[E] ${*}${RST}";exit 1;:;}
warn()   { echo -e "${_c_red}[W] ${*}${RST}";:;}
shout()  { echo -e "${_c_blue}[-] ${*}${RST}";:;}
lshout() { echo -e "${_c_blue}-> ${*}${RST}";:;}
msg()    { echo -e "${*} \e[0m" >&2;:;}

ICONS_DIR="/usr/share/icons"
THEME_DIR="/usr/share/themes"
BACKGROUND_DIR="/usr/share/backgrounds"

echo -e "${_c_magneta}UDROID XFCE4${RST}"

shout "Installing icons..."
cp -r ./usr/share/icons $ICONS_DIR || {
    die "Failed to install icons"
}
shout "Installing themes..."
cp -r ./usr/share/themes $THEME_DIR || {
    die "Failed to install themes"
}
shout "Installing backgrounds..."
cp -r ./usr/share/backgrounds $BACKGROUND_DIR || {
    die "Failed to install backgrounds"
}

if ((UID != 0)); then
    lshout "Trying to fix permissions to $user [$UID]"
    chown -Rv "$user":"$user" .*
fi