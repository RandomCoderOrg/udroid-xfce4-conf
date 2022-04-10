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

# USER DIR
LOCAL_DIR="$HOME/.local"
LOCAL_CONFIG="$HOME/.config"
LOCAL_VNC="$HOME/.vnc"

echo -e "${_c_magneta}UDROID XFCE4${RST}"

shout "Installing icons..."
cp -r ./usr/share/icons/* $ICONS_DIR || {
    die "Failed to install icons"
}
shout "Installing themes..."
cp -r ./usr/share/themes/* $THEME_DIR || {
    die "Failed to install themes"
}
shout "Installing backgrounds..."
cp -r ./usr/share/backgrounds/* $BACKGROUND_DIR || {
    die "Failed to install backgrounds"
}

shout "Installing local directories..."
cp -r .local/* "$LOCAL_DIR" || die "Failed to install local directories"
cp -r .config/* "$LOCAL_CONFIG" || die "Failed to install local directories"
cp -r .vnc/* "$LOCAL_VNC" || die "Failed to install local directories"
# add user dirs
[[ ! -d ~/Desktop ]] && mkdir ~/Desktop
[[ ! -d ~/Download ]] && mkdir ~/Download
[[ ! -d ~/Templates ]] && mkdir ~/Templates
[[ ! -d ~/public ]] && mkdir ~/public
[[ ! -d ~/Documents ]] && mkdir ~/Documents
[[ ! -d ~/Music ]] && mkdir ~/Music
[[ ! -d ~/Pictutes ]] && mkdir ~/Pictutes
[[ ! -d ~/Videos ]] && mkdir ~/Videos

if ((UID != 0)); then
    lshout "Trying to fix permissions to $user [$UID]"
    sudo chown -Rv "$user":"$user" .* || {
    lwarn "Failed to chown"
    }
fi
