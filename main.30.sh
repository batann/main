!/bin/bash
# vim:fileencoding=utf-8:foldmethod=marker


#{{{>>>   radio-button-menu
#!/bin/bash
# ANSI Colors
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'

# Questions and their answers (0 = No, 1 = Yes)
QUESTIONS=(
    "Question 1"
    "Question 2"
    "Question 3"
    "Question 4"
)
ANSWERS=(0 0 0 0)  # Default all answers to No
NUM_QUESTIONS=${#QUESTIONS[@]}
selected=0  # Current selected row (-1 for Cancel, NUM_QUESTIONS for Accept)

# Function to display the radio menu
DISPLAY_MENU() {
    clear

    # Display Cancel option
    if [[ $selected -eq -1 ]]; then
        echo -e "${White}${Blue}[ Cancel ]${NC}"
    else
        echo -e "  Cancel  "
    fi

    echo # Empty line

    # Display questions and their Yes/No options
    for ((i=0; i<NUM_QUESTIONS; i++)); do
        if [[ $selected -eq $i ]]; then
            echo -ne "${White}${Blue}>"
        else
            echo -ne " "
        fi

        echo -ne " ${QUESTIONS[i]}"

        # Move cursor to position 40
        printf "%*s" $((40 - ${#QUESTIONS[i]})) ""

        if [[ ${ANSWERS[i]} -eq 1 ]]; then
            echo -e "[${Green}Yes${NC}] / No "
        else
            echo -e "Yes / [${Red}No${NC}] "
        fi
    done

    echo # Empty line

    # Display Accept option
    if [[ $selected -eq $NUM_QUESTIONS ]]; then
        echo -e "${White}${Blue}[ Accept and Continue ]${NC}"
    else
        echo -e "  Accept and Continue  "
    fi
}

# Main loop
while true; do
    DISPLAY_MENU

    read -sn1 key

    if [[ $key == $'\e' ]]; then
        read -sn1 key
        if [[ $key == '[' ]]; then
            read -sn1 key
            case $key in
                'A') # Up arrow
                    ((selected--))
                    if [[ $selected -lt -1 ]]; then
                        selected=$NUM_QUESTIONS
                    fi
                    ;;
                'B') # Down arrow
                    ((selected++))
                    if [[ $selected -gt $NUM_QUESTIONS ]]; then
                        selected=-1
                    fi
                    ;;
                'C') # Right arrow
                    if [[ $selected -ge 0 && $selected -lt NUM_QUESTIONS ]]; then
                        ANSWERS[selected]=1
                    fi
                    ;;
                'D') # Left arrow
                    if [[ $selected -ge 0 && $selected -lt NUM_QUESTIONS ]]; then
                        ANSWERS[selected]=0
                    fi
                    ;;
            esac
        fi
    elif [[ $key == '' ]]; then  # Enter key
        if [[ $selected -eq -1 ]]; then
            echo "Operation cancelled."
            exit 1
        elif [[ $selected -eq $NUM_QUESTIONS ]]; then
            clear
            echo "Selected answers:"
            for ((i=0; i<NUM_QUESTIONS; i++)); do
                echo "${QUESTIONS[i]}: ${ANSWERS[i]}"
            done
            exit 0
        fi
    fi
done
#}}}
#{{{>>>   Check if DEBIAN or ARCH based DISTRO

# Function to check for Arch-based systems
is_arch_based() {
    if command -v pacman &> /dev/null; then
        return 0
    fi
    if grep -qi "arch" /etc/os-release; then
        return 0
    fi
    return 1
}

# Function to check for Debian-based systems
is_debian_based() {
    if command -v apt &> /dev/null; then
        return 0
    fi
    if grep -qi "debian" /etc/os-release; then
        return 0
    fi
    return 1
}

# Main detection logic
if is_arch_based; then
    echo -e "\033[31mThe OS is Arch-based.\033[0m"
    DISTRO="Arch"
elif is_debian_based; then
    echo -e "\033[31mThe OS is Debian-based.\033[0m.."
    DISTRO="Debian"
else
    echo -e "\033[31mThe OS is neither Arch-based nor Debian-based.\033[0m"
    DISTRO="Unknown"
fi
#}}}
#{{{###   User form intergrate with code from gpt
clear
for package in ${DEPS_FORM[@]};
do
	dpkg -s $package >/dev/null 2>&1
	if [[ $? == '1' ]];then
		echo -e "Missing dependency \033[31m${package}\033[0m being installed...]}]"
		sudo apt install $package > /dev/null 2>&1
	fi
	done

clear
#}}}
#{{{>>>   MAIN FORM
#!/bin/bash
# Script Nu.a Display Form for interactive-mode
B='\033[0;30m'
Re='\033[0;31m'
Gr='\033[0;32m'
Bl='\033[0;34m'
Pu='\033[0;35m'
Cy='\033[0;36m'
Ye='\033[1;33m'
Wh='\033[1;37m'
N='\033[0m'
#   ANSI CODE BACKGROUND  ##################################################################
BBlue='\e[0;104m'
BBlack='\e[0;100m'
RRed='\e[0;100m'
GGreen='\e[0;100m'
YYellow='\e[0;100m'
BBlue='\e[0;100m'
PPurple='\e[0;100m'
CCyan='\e[0;100m'
WWhite='\e[0;100m'
xdotool key 'Ctrl+minus'
clear
tput civis
tput cup 0 0
echo -e "\033[40m\033[32m=================================================================\033[m"
tput cup 1 0
echo -e "${Cy}To set up gpg encyption please provide${N}"
tput cup 2 4
echo -e "${Pu}full_name           ${Re}:${N}"
tput cup 3 4
echo -e "${Pu}email_address       ${Re}:${N}"
tput cup 4 4
echo -e "${Pu}passphrase          ${Re}:${N}"
tput cup 5 4
echo -e "${Pu}app_passphrase      ${Re}:${N}"
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 7 0
echo -e "${Cy}To set up samba0shares please provide${N}"
tput cup 8 4
echo -e "${Pu}passphrase          ${Re}:${N}"
tput cup 9 4
echo -e "${Pu}samba user          ${Re}:${N}"
tput cup 10 4
echo -e "${Pu}permissions RW      ${Re}:${N}"
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 12 0
echo -e "${Cy}To decrypt default credentials provide${N}"
tput cup 13 4
echo -e "${Pu}passphrase          ${Re}:${N}"
tput cup 14 0
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 15 0
echo -e "${Cy}To set up mashpodder provide${N}"
tput cup 16 4
echo -e "${Pu}base directory      ${Re}:${N}"
tput cup 17 0
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 18 0
echo -e "${Cy}To backup and encrypt apt configs provide${N}"
tput cup 19 4
echo -e "${Pu}passphrase          ${Re}:${N}"
tput cup 20 0
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 21 0
echo -e "${Cy}To set up minidlna please provide ${N}"
tput cup 22 4
echo -e "${Pu}base dir for media ${Re}:${N}"
tput cup 23 9
echo -e "${Bl}Video         ${Re}:${N}"
tput cup 24 9
echo -e "${Bl}Audio         ${Re}:${N}"
tput cup 25 9
echo -e "${Bl}Images        ${Re}:${N}"
tput cup 26 9
echo -e "${Bl}Documents     ${Re}:${N}"
tput cup 27 9
echo -e "${Bl}Podcasts      ${Re}:${N}"
tput cup 28 0
echo -e "\033[40m\033[32m===============================================================\033[m"
tput cup 35 0
echo -e "${Cy} Mark following pakages with yes or no${N}"
tput cup 36 0
echo -e "${Re}>>> ${Wh}1${Pu}) ${Wh}Yes"
tput cup 37 0
echo -e "${Re}>>> ${Wh}2${Pu}) ${Wh}No "
echo -e "\033[40m\033[32m---------------------------------------------------------------\033[m"
tput cup 39 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 40 4
echo -e "${Pu}Custm Fonts       ${Re}:${N}"
tput cup 41 4
echo -e "${Pu}Backgrounds       ${Re}:${N}"
tput cup 42 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 43 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 44 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 45 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 46 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 47 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 48 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 49 4
echo -e "${Pu}Lamp Server       ${Re}:${N}"
tput cup 50 0
echo -e "\033[40m\033[32m==============================================================\033[m"
tput cup 53 0








tput cup 55 3
echo -e "$Bl==================================="
tput cup 56 3
echo -e "=== ${Wh}  Enter${Cy} [${Gr}ANY${Cy}]${Wh} to continuue  $Bl==="
tput cup 57 3
echo -e "==================================="


read -n1 lol
tput cup 55 0
tput el
tput cup 56 0
tput el
tput cup 57 0
tput el

tput cup 2 29
echo -e "${Re}>>>${Gr}"
tput cup 2 34
read -e -i "fairdinkum batan" full_name


tput cup 3 29
echo -e "${Re}>>>${Gr}"
tput cup 3 34
read -e -i "" email_address

tput cup 4 29
echo -e "${Re}>>>${Gr}"
tput cup 4 34
read -e -i "Ba7an" passphrase

tput cup 5 29
echo -e "${Re}>>>${Gr}"
tput cup 5 34
read -e -i "ixeh bhbn dbrq pbyc" app_passphrase

tput cup 8 29
echo -e "${Re}>>>${Gr}"
tput cup 8 34
read -e -i "" SAMBA_PASSWORD

tput cup 9 29
echo -e "${Re}>>>${Gr}"
tput cup 9 34
read -e -i "" SAMBA_USER

tput cup 10 29
echo -e "${Re}>>>${Gr}"
tput cup 10 34
read -e -i "rw" SAMBA_PERMISSIONS

tput cup 13 29
echo -e "${Re}>>>${Gr}"
tput cup 13 34
read -e -i "" GPG_passphrase

tput cup 16 29
echo -e "${Re}>>>${Gr}"
tput cup 16 34
read -e -i "/home/batan/.config/mashpodder" BASE_DIR_MASHPODDER

tput cup 19 29
echo -e "${Re}>>>${Gr}"
tput cup 19 34
read passphrase_apt














tput cup 22 29
echo -e "${Re}>>>${Gr}"
tput cup 22 34
read -e -i "" BASE_DIR_MINIDLNA

tput cup 23 29
echo -e "${Re}>>>${Wh}"
tput cup 23 34
read -e -i "$BASE_DIR_MINIDLNA" VIDEO

tput cup 24 29
echo -e "${Re}>>>${Wh}"
tput cup 24 34
read -e -i "$BASE_DIR_MINIDLNA" AUDIO

tput cup 25 29
echo -e "${Re}>>>${Wh}"
tput cup 25 34
read -e -i "$BASE_DIR_MINIDLNA" IMAGES

tput cup 26 29
echo -e "${Re}>>>${Wh}"
tput cup 26 34
read -e -i "$BASE_DIR_MINIDLNA" Documents

tput cup 27 29
echo -e "${Re}>>>${Wh}"
tput cup 27 34
read -e -i "$BASE_DIR_MINIDLNA" Podcasts



tput cup 39 29
echo -e "${Re}>>>${Gr}"
tput cup 39 34
read -n1  aa1
if [[ "$aa1" == "1" ]]; then
	tput cup 39 34
	echo -e "${Wh}Yes"
else
	tput cup 39 34
	echo -e "${Wh}No"
fi


tput cup 40 29
echo -e "${Re}>>>${Gr}"
tput cup 40 34
read -n1 aa2
if [[ "$aa2" == "1" ]]; then
	tput cup 40 34
	echo -e "${Wh}Yes"
else
	tput cup 40 34
	echo -e "${Wh}No"
fi

tput cup 41 29
echo -e "${Re}>>>${Gr}"
tput cup 41 34
read -n1 aa3
if [[ "$aa3" == "1" ]]; then
	tput cup 41 34
	echo -e "${Wh}Yes"
else
	tput cup 41 34
	echo -e "${Wh}No"
fi

tput cup 42 29
echo -e "${Re}>>>${Gr}"
tput cup 42 34
read -n1  aa4
if [[ "$aa4" == "1" ]]; then
	tput cup 42 34
	echo -e "${Wh}Yes"
else
	tput cup 42 34
	echo -e "${Wh}No"
fi

tput cup 43 29
echo -e "${Re}>>>${Gr}"
tput cup 43 34
read -n1  aa5
if [[ "$aa5" == "1" ]]; then
	tput cup 43 34
	echo -e "${Wh}Yes"
else
	tput cup 43 34
	echo -e "${Wh}No"
fi

tput cup 44 29
echo -e "${Re}>>>${Gr}"
tput cup 44 34
read -n1  aa6
if [[ "$aa6" == "1" ]]; then
	tput cup 44 34
	echo -e "${Wh}Yes"
else
	tput cup 44 34
	echo -e "${Wh}No"
fi

tput cup 45 29
echo -e "${Re}>>>${Gr}"
tput cup 45 34
read -n1  aa7
if [[ "$aa7" == "1" ]]; then
	tput cup 45 34
	echo -e "${Wh}Yes"
else
	tput cup 45 34
	echo -e "${Wh}No"
fi

tput cup 46 29
echo -e "${Re}>>>${Gr}"
tput cup 46 34
read -n1  aa8
if [[ "$aa8" == "1" ]]; then
	tput cup 46 34
	echo -e "${Wh}Yes"
else
	tput cup 46 34
	echo -e "${Wh}No"
fi

tput cup 47 29
echo -e "${Re}>>>${Gr}"
tput cup 47 34
read -n1  aa9
if [[ "$aa9" == "1" ]]; then
	tput cup 47 34
	echo -e "${Wh}Yes"
else
	tput cup 47 34
	echo -e "${Wh}No"
fi

tput cup 48 29
echo -e "${Re}>>>${Gr}"
tput cup 48 34
read -n1  aa10
if [[ "$aa10" == "1" ]]; then
	tput cup 48 34
	echo -e "${Wh}Yes"
else
	tput cup 48 34
	echo -e "${Wh}No"
fi
tput cup 49 29
echo -e "${Re}>>>${Gr}"
tput cup 49 34
read -n1  aa11
if [[ "$aa10" == "1" ]]; then
	tput cup 49 34
	echo -e "${Wh}Yes"
else
	tput cup 49 34
	echo -e "${Wh}No"
fi







tput cup 55 3
echo -e "$Bl==================================="
tput cup 56 3
echo -e "=== ${Wh}        Please Wait         $Bl==="
tput cup 57 3
echo -e "==================================="

#}}}
#{{{###   TEMPORARY List of random Packages
DEPS_TEMP="git dialog yad vim smenu tmux xfce4-terminal surf ranger ranger cmus git python3-pip taskwarrior timewarrior sweeper apt-transport-https
lsb-release curl bleachbit openssh-server openssh-client renameutils mat2 yt-dlp ffmpeg megatools w3m trash-cli ufw tmux firefox mpv fzf rofi ddgr tldr falkon firefox"

#}}}
#{{{>>>   Set Variables and/or functions
DESKTOPS="fluxbox i3 xfce4"
DOTDIR="/home/batan/.config/dot"
BINDIR="/home/batan/.config/bin"

#}}}
#{{{>>>   Set Dependencies

DEPS_DISTROBOX="aardvark-dns buildah catatonit conmon containernetworking-plugins crun fuse-overlayfs golang-github-containers-common golang-github-containers-image libsubid4 netavark podman slirp4netns uidmap distrobox"


DEPS_i3="i3 i3status i3lock dunst picom cava xfce4-terminal stterm suckless-tools rofi surf thunar xterm pavucontrol sox libsox-fmt-all alsa-utils i3status wmctrl xdotool xorg xinit x11-xserver-utils pulseaudio pulseaudio-utils network-manager network-manager-gnome fonts-font-awesome arandr feh lxappearance xarchiver lightdm lightdm-gtk-greeter policykit-1-gnome software-properties-gtk apt-transport-https curl wget git firefox-esr thunar-archive-plugin thunar-volman thunar-media-tags-plugin gvfs gvfs-backends xbacklight acpi acpid notification-daemon libnotify-bin volumeicon-alsa vim htop neofetch python3-pip nmcli arj lbzip2 lhasa liblz4-tool lrzip lzip lzop ncompress pbzip2 pigz plzip rar unar libgtk-4-dev libgcr-3-dev libgcr-3-dev libwebkit2gtk-4.0-dev x11-apps mesa-utils"

DEPS_FORM="xdotool dialog yad zenity wmctrl smenu megatools git curl wget"

DEPS_WINDSCRIBE="net-tools"


DEPS_FLUX="fluxbox idesk mx-fluxbox gkrellm mxfb-docs   mx-fluxbox-data mxfb-accessories wmalauncher  lxappearance  rofi-calc custom-toolbox roxterm feh"

DEPS_BOXES2="gnome-boxes qemu-system-x86 libvirt-daemon-driver-lxc libvirt-daemon-driver-vbox libvirt-daemon-driver-xen netcat-openbsd tracker-miner-fs qemu-system-gui qemu-utils ovmf ibverbs-providers"
DEPS_BOXES="dmeventd gnome-boxes gnutls-bin ibverbs-providers ipxe-qemu libaio1 libboost-thread1.74.0 libbrlapi0.8 libcacard0 libcapstone4 libcue2 libdevmapper-event1.02.1 libexecs0 libexempi8 libexiv2-27 libfdt1 libfmt9 libgexiv2-2 libgfapi0 libgfrpc0 libgfxdr0 libglusterfs0 libgnutls-dane0 libgsf-1-114 libgsf-1-common libgxps2 libibverbs1 libiptcdata0 libiscsi7 liblvm2cmd2.03 libosinfo-1.0-0 libosinfo-bin libosinfo-l10n libphodav-3.0-0 libphodav-3.0-common librados2 librbd1 librdmacm1 libslirp0 libspice-client-glib-2.0-8 libspice-client-gtk-3.0-5 libspice-server1 libssh-4 libtotem-plparser-common libtotem-plparser18 libtpms0 libtracker-sparql-3.0-0 libunbound8 libusbredirhost1 libusbredirparser1 libvdeplug2 libvirglrenderer1 libvirt-daemon-driver-lxc libvirt-daemon-driver-qemu libvirt-daemon-driver-vbox libvirt-daemon-driver-xen libvirt-daemon libvirt-glib-1.0-0 libvirt-glib-1.0-data libvirt-l10n libvirt0 libxencall1 libxendevicemodel1 libxenevtchn1 libxenforeignmemory1 libxengnttab1 libxenhypfs1 libxenmisc4.17 libxenstore4 libxentoolcore1 libxentoollog1 lvm2 netcat-openbsd osinfo-db ovmf qemu-block-extra qemu-system-common qemu-system-data qemu-system-gui qemu-system-x86 qemu-utils seabios spice-client-glib-usb-acl-helper swtpm-libs swtpm-tools swtpm thin-provisioning-tools tracker-extract tracker-miner-fs tracker"

DEPS_LAMP="apache2 apache2-utils curl mariadb-server mariadb-client php libapache2-mod-php php-mysql php-common php-cli php-common php-opcache php-xml php-yaml php-readline php-fpm php-gd php-mbstring php-curl php-zip"

DEPS_CODIUM="apt-transport-https codium"
#https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium/main amd64 codium amd64 1.95.2.24313

DEPS_NVIM="wget curl git build-essential libtool libtool-bin autoconf cmake g++ pkg-config unzip ninja-build gettext libncurses5-dev libgnome2-dev libgnomecanvas2-dev libx11-dev libxt-dev python3-dev ruby-dev lua5.1.0-dev liblua5.1-0-dev python3-pynvim"


DEPS_TREES="clang libclang-dev cmake make nodejs python3-setuptools python3-pynvim"

DEPS_DOCKER="docker.io"

DEPS_MPD="mpd ncmpcpp wildmidi pulseaudio cava"

PIPX_PACKAGES="edge-tts pynvim pyxtermjs castero eg browser-history rtv rainbowstream yt-dlp"

FLATPAK_PACKAGES="io.github.ungoogled_software.ungoogled_chromium"

DEPS_MEGA="megatools"

DEPS_SURF="build-essential git intel-media-va-driver libcairo2-dev libfreetype-dev libfribidi-dev libgcr-3-dev libgdk-pixbuf2.0-dev libgles2-mesa libgtk-3-dev libharfbuzz-dev libpango1.0-dev libsqlite3-dev libvpx-dev libwebkit2gtk-4.0-dev libxml2-dev pkg-config x11-utils"

DEPS_DOCKER_UBUNTU="docker.io docker-compose docker-clean docker-buildx docker-doc docker
ca-certificates curl gnupg lsb-release"

DEPS_DOCKER_DEBIAN="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin ca-certificates curl gnupg lsb-release"

DEPS_LC_SNAPSHOT="mx-iso-template mx-remaster mx-snapshot minstall"

DEPS_REMOVE_DESK="xserver-xorg-video-* exim4 gnome-keyring vim-tiny man-db cups cups-bsd cups-client printer-driver-* bluez
pulseaudio-module-bluetooth avahi-daemon postfix sendmail bsd-mailx libkde-* libxfce4-* lib-gtk-* libqt5-* nano vi vim-tinyunity unity-common unity-services unity-lens-\* unity-scope-\* unity-webapps-\* gnome-control-center-unity hud libunity-core-6\* libunity-misc4 libunity-webapps\* appmenu-gtk appmenu-gtk3 appmenu-qt\* overlay-scrollbar\* activity-log-manager-control-center firefox-globalmenu thunderbird-globalmenu libufe-xidgetter0 xul-ext-unity xul-ext-webaccounts webaccounts-extension-common xul-ext-websites-integration gnome-control-center gnome-session"

DEPS_YAD="git build-essential intltool libgtk-3-dev libwebkit2gtk-4.0-dev libgdk-pixbuf2.0-dev libnotify-dev libjson-glib-dev libxml2-utils"



#}}}
#{{{>>>   Add User to Visudo and Groups
echo "batan ALL=(ALL:ALL) NOPASSWD:ALL"|sudo EDITOR='tee -a' visudo

USER="batan"
# List of groups to check and add
GROUPS=('lp' 'dialout' 'cdrom' 'floppy' 'sudo' 'audio' 'dip' 'video' 'plugdev' 'users' 'netdev' 'lpadmin' 'vboxsf' 'scanner' 'sambashare')

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root."
	exit 1
fi
# Check if the user was provided
if [[ -z "$USER" ]]; then
	echo "Usage: $0 <username>"
	exit 1
fi
# Iterate through each group and check if the user is a member
for group in "${GROUPS[@]}"; do
	if groups "$USER" | grep -qw "$group"; then
		echo "User $USER is already in group $group."
	else
		echo "Adding user $USER to group $group."
		usermod -aG "$group" "$USER"
	fi
done
echo -e "${B}Group membership check and update complete for$R $USER."
#}}}
#{{{>>>   Check installed OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	if [ -f /etc/os-release ]; then
		# Source the os-release file to get distribution info
		. /etc/os-release
		OS=$NAME
		VER=$VERSION_ID
	elif [ -f /etc/lsb-release ]; then
		# For older systems, use lsb_release if available
		. /etc/lsb-release
		OS=$DISTRIB_ID
		VER=$DISTRIB_RELEASE
	elif [ -f /etc/debian_version ]; then
		# For Debian-based systems without os-release
		OS="Debian"
		VER=$(cat /etc/debian_version)
	else
		# Unknown Linux system
		OS=$(uname -s)
		VER=$(uname -r)
	fi
fi
echo -e "${B}Detected Linux system:$R $OS $VER"



#}}}
#{{{>>>   Setup GPG-key
	command -v gpg >/dev/null 2>&1 || { echo >&2 "GPG is not installed. Please install GPG and try again."; exit 1; }
###   Set key details   ##########################################
full_name="fairdinkum batan"
email_address="fairdinkumbatan@gmail.com"
passphrase="Ba7an?12982"
app_password="ixeh bhbn dbrq pbyc"
###   Generate GPG key   #########################################
gpg --batch --full-generate-key <<EOF
	Key-Type: RSA
	Key-Length: 4096
	Subkey-Type: RSA
	Subkey-Length: 4096
	Name-Real: $full_name
	Name-Email: $email_address
	Expire-Date: 1y
	Passphrase: $passphrase
	%commit
EOF

echo "${B}GPG key generation completed.$R Please make sure to remember your passphrase.$N"
read -n1 -p ' Press [any] to Continue ....' abc
pass init fairdinkumbatan@gmail.com
#}}}
#{{{>>>   Setup SSH-keys

key_name="id_rsa"
key_location="$HOME/.ssh/$key_name"
ssh-keygen -t rsa -b 4096 -f "$key_location" -N ""

###   Function to detect the init system   ###########
get_init_system() {
	if [ -f /run/systemd/system ]; then
		echo "systemd"
	elif command -v service >/dev/null; then
		echo "SysVinit"
	elif command -v rc-service >/dev/null; then
		echo "OpenRC"
	elif command -v initctl >/dev/null; then
		echo "Upstart"
	else
		echo "unknown"
	fi
}

###   Function to configure SSH on a remote machine   ###########
configure_ssh() {
	# SSH configuration file path
	local ssh_config="/etc/ssh/sshd_config"
	local init_system=$(get_init_system)  # Detect the init system
	sudo cp $ssh_config "$ssh_config.bak"
	# Combine all SSH configuration changes into one command
	ssh -o "StrictHostKeyChecking=no" -o "PasswordAuthentication=no" "$1" "\
		sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' $ssh_config && \
		sudo sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/' $ssh_config && \
		# Restart SSH service based on the detected init system
			$(case "$init_system" in
			systemd) echo "sudo systemctl restart ssh";;
			SysVinit) echo "sudo service ssh restart";;
			OpenRC) echo "sudo rc-service sshd restart";;
			Upstart) echo "sudo stop ssh && sudo start ssh";;
			*) echo "echo 'Unknown init system: $init_system. Cannot restart SSH.'";;
		esac)"
		}

		active_ips=()
		local_ip=$(hostname -I | awk '{print $1}')

		for i in $(seq 35 40); do
			current_ip="192.168.1.$i"
			if [ "$current_ip" != "$local_ip" ] && ping -c 1 -W 1 "$current_ip" &> /dev/null; then
				active_ips+=("$current_ip")
			fi
		done

		for ip in "${active_ips[@]}"; do
			ssh-copy-id -i "$key_location.pub" batan@"$ip"
			configure_ssh "$ip"  # Call the function to configure SSH on the remote machine
		done
		clear
		read -n1 -p '           Press [any] to Continue...'
#}}}
#{{{>>>   Setup Firewall

sudo dpkg -s ufw >/dev/null
if [[ $? -eq 0 ]]; then
	echo "ufw is already installed."
else
sudo apt install -y ufw
fi
for i in $(seq 35 40);
do
	sudo ufw allow from 192.168.1.$i && sudo ufw allow to 192.168.1.$i
done
sudo ufw enable


#}}}
#{{{>>>   Add MX- REPO and or any other
sudo tar vfcz /home/$USER/apt-conf-backup.tar.gz /etc/apt/*
git clone https://github.com/batann/lc-repo.git
sudo rm lc-repo/images lc-repo/README.md
sudo cp -r lc-repo/* /etc/apt/
sudo rm -rf lc-repo
#}}}
#{{{>>>   Setup MEGACLOUD Dot Config and Bin files
#BASEMEGADIR="/home/batan/.config"
#for i in ${DEPS_MEGA[@]};
#do
#	dpkg -s $i>/dev/null
#	if [[ $? !== "0" ]];
#	then
#		sudo apt install $i -y
#	fi
#
#cat<< 'EOL'>/home/batan/.megarc
#[Login]
#Username=tel.petar@gmail.com
#Password=Ba7an?12982
#EOL
#mkdir $BASEMEGADIR/dot
#mkdir $BASEMEGADIR/bin
#mkdir $BASEMEGADIR/homepage
#mkdir $BASEMEGADIR/vimwiki
#DOTDIR="/home/batan/.config/dot"
#BINDIR="/home/batan/.config/bin"
#megacopy -l $BASEMEGADIR/dot -r /Root/dot --download
#megacopy -l $BASEMEGADIR/bin -r /Root/bin --download
#megacopy -l $BASEMEGADIR/homepage -r /Root/homepage --download
#megacopy -l $BASEMEGADIR/vimwiki -r /Root/vimwiki --download
#clear
## apply the downlaoded dot files
#for i in $(ls /home/batan/.config/dot);
#do
#	if [[ -d /home/batan/.$i ]];
#	then
#		mv /home/batan/.$i /home/batan/.$i.bak
#	fi
#	cp /home/batan/.config/dot/$i /home/batan/.$i
#echo -e "\033[33mCopied /home/batan/.config/dot/$i to /home/batan/.$i"
#done
#echo -e"\033[34m===========================================\033[0m"
##apply new bin files systemwide
#for i in $(ls /home/batan/.config/bin);
#do
#	sudo cp /home/batan/.config/bin/$i /usr/bin/$i
#echo -e "\033[33mCopied /home/batan/.config/bin/$i to /usr/bin/$i"
#done
#echo -e"\033[34m===========================================\033[0m"
#
#}}}
#{{{###   Setup a Desktop Environments i3,feg,xfce4


DESKT="i3"

if [[ "$DESKT" == "i3" ]]; then
# Silently check if any dependencies are installed and install them if not
for dep in $DEPS_i3; do
	if ! dpkg -s $dep >/dev/null 2>&1; then
		echo "Installing \033[34m$dep...\033[0m"
		sudo apt-get install -y $dep
	fi
done

# modify bash_profile after checking if it has already been modified
grep -qxF "if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then exec startx; fi" ~/.bash_profile || echo "if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then exec startx; fi" >> ~/.bash_profile

clear
echo -e "\033[33mInstalling \033[34msurf build dependencies...\033[0m"

for package in ${DEPS_SURF[@]};
do
	dpkg -s $package >/dev/null 2>&1
	if [[ $? == "1" ]]; then
		echo -e "\033[33mInstalling $package\033[0m"
		sudo apt install $package -y
	fi
done


git clone git://git.suckless.org/dmenu
git clone git://git.suckless.org/tabbed
git clone git://git.suckless.org/st
git clone https://github.com/batann/surf
find /home/batan/ -maxdepth 5 -type d -name ".git" -exec rm -rf {} \;
sudo rm /home/batan/surf/patches/surf-bookmarks-20170722-723ff26.diff
sudo rm /home/batan/surf/patches/surf-git-20170323-webkit2-searchengines.diff
sudo rm /home/batan/surf/patches/surf-websearch-20190510-d068a38.diff


cd /home/batan/dmenu
sudo make
sudo make clean install

cd /home/batan/tabbed
sudo make
sudo make clean install

cd /home/batan/st
sudo make
sudo make clean install

cd /home/batan/surf
for i in $(ls patches); do patch -p1 patches/$i ;done
sudo make
sudo make clean install

find /usr/share/polkit-1/actions/ -type f -name "org.freedesktop.UDisks2.policy" -exec sudo sed -i 's!<allow_active>auth_admin_keep</allow_active>!<allow_active>yes</allow_active>!g' {} \;




# FLUXBOX
	clear
elif [[ $DESKT == 'Fluxbox' ]]; then
	clear
	echo "In Progress"
# XFCE4
elif [[ $DESKT == 'xfce4' ]]; then
clear
echo "In Progress"
fi
#}}}
#{{{###   Setup Distrobox

# Silently check if any dependencies are installed and install them if not
for dep in ${DEPS_DISTROBOX[@]}; do
	dpkg -s $dep>/dev/null 2>&1
	if [[ $? == '1' ]]; then
	echo "Installing \033[34m$dep...\033[0m"
		sudo apt-get install -y $dep >/dev/null 2>&1
	fi
done

#}}}
#{{{>>>   Install Minidlana

# Define variables
USER="batan"
GROUP="batan"
UUID="c96173e2-aae6-43b1-bad3-2d8fb4e87e25"
MOUNT_POINT="/media/batan/100"
FSTAB_ENTRY="UUID=${UUID} ${MOUNT_POINT} ext4 defaults 0 2"
MINIDLNA_CONF="/etc/minidlna.conf"

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Install MiniDLNA
apt update && apt install -y minidlna

# Create mount point and add fstab entry if not present
if ! grep -q "$UUID" /etc/fstab; then
    mkdir -p "$MOUNT_POINT"
    echo "$FSTAB_ENTRY" >> /etc/fstab
    mount -a
else
    echo "FSTAB entry already exists."
fi

# Create media directories
for dir in Videos Music Backgrounds; do
    mkdir -p "$MOUNT_POINT/$dir"
done

# Set ownership and permissions
chown -R $USER:$GROUP "$MOUNT_POINT"
chmod -R 755 "$MOUNT_POINT"

# Backup MiniDLNA configuration
cp $MINIDLNA_CONF ${MINIDLNA_CONF}.bak

# Configure MiniDLNA
cat <<EOF > $MINIDLNA_CONF
# MiniDLNA configuration file
media_dir=V,$MOUNT_POINT/Videos
media_dir=A,$MOUNT_POINT/Music
media_dir=P,$MOUNT_POINT/Backgrounds
friendly_name=My MiniDLNA Server
db_dir=/var/cache/minidlna
log_dir=/var/log
inotify=yes
EOF

# Ensure permissions for MiniDLNA
chown -R minidlna:minidlna /var/cache/minidlna
chmod -R 755 /var/cache/minidlna
chown -R minidlna:minidlna /var/log
chmod -R 755 /var/log
sudo chown -R minidlna:minidlna /media/batan/100
sudo chmod -R 755 /media/batan/100

# Restart and enable MiniDLNA
systemctl restart minidlna
systemctl enable minidlna
sudo systemctl stop minidlna
sudo rm -rf /var/cache/minidlna/files.db
sudo systemctl start minidlna
sudo systemctl restart minidlna
sudo systemctl status minidlna

# Display status
echo "MiniDLNA installation and configuration completed."
systemctl status minidlna

fi
#}}}
#{{{>>>   Install Samba

# Variables
USER="batan"
PASSWORD="Ba7an?12982"
SHARE_DIRS=("/home/batan/Videos" "/home/batan/Music" "/home/batan/Documents" "/home/batan/Pictures")

# Ensure samba service is installed
if ! command -v smbpasswd &> /dev/null; then
	echo "Samba is not installed. Installing now..."
	sudo apt-get install samba -y || sudo pacman -S samba || sudo dnf install samba -y
fi

# Create samba user and set password
echo "Creating Samba user: $USER"
sudo smbpasswd -x $USER &> /dev/null  # Remove the user if they exist already
sudo useradd -M -s /sbin/nologin $USER  # Create system user without home
echo -e "$PASSWORD\n$PASSWORD" | sudo smbpasswd -a $USER  # Set Samba password
sudo smbpasswd -e $USER  # Enable the user

# Backup smb.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# Modify smb.conf
echo "Modifying /etc/samba/smb.conf"

for dir in "${SHARE_DIRS[@]}"; do
	sudo mkdir -p "/srv/samba/$dir"
	sudo chown $USER:users "/srv/samba/$dir"
	sudo chmod 755 "/srv/samba/$dir"

	# Add the share configuration
	sudo bash -c cat >> /etc/samba/smb.conf <<EOF

	[$dir]
	path = /srv/samba/$dir
	browseable = yes
	read only = no
	guest ok = no
	valid users = $USER
	write list = $USER
	create mask = 0775
	directory mask = 0775
	public = yes
EOF

done

# Set up read-only access for everyone else
sudo bash -c cat >> /etc/samba/smb.conf <<EOF

[Public]
path = /srv/samba
public = yes
only guest = yes
browseable = yes
writable = no
guest ok = yes
create mask = 0775
directory mask = 0775
EOF
# Restart Samba services
if [[ "$init_system" == "systemd" ]]; then
	sudo systemctl restart smbd
	sudo systemctl enable smbd
else
	sudo service smbd restart
	sudo service smbd enable
fi
echo "Samba setup complete."

#}}}
#{{{>>>   Install and configure MPD and NCMPCPP
#sudo apt update && sudo apt install -y mpd ncmpcpp wildmidi pulseaudio cava
#INSTALL DEPS

# Define the directories
MUSIC_DIR="/home/$USER/Music"
PODCAST_DIR="/media/$USER/100/Podcasts"
MEDIA_DIR="/media/$USER/100/Music"

# Ensure the directories exist
mkdir -p "$MUSIC_DIR" "$PODCAST_DIR" "$MEDIA_DIR"

# Backup and configure MPD
MPD_CONF="$HOME/.config/mpd/mpd.conf"
mkdir -p "$(dirname "$MPD_CONF")"
if [ -f "$MPD_CONF" ]; then
    cp "$MPD_CONF" "$MPD_CONF.bak"
fi

cat << EOF > "$MPD_CONF"
# Define the music directory and permissions

music_directory  "/home/batan/Music"
music_directory  "/media/batan/100/Music"
music_directory  "/media/batan/100/Podcasts"

playlist_directory  "/home/batan/.config/mpd/playlists"
db_file             "/home/batan/.config/mpd/mpd.db"
log_file            "/home/batan/.config/mpd/mpd.log"
pid_file            "/home/batan/.config/mpd/mpd.pid"
state_file          "/home/batan/.config/mpd/mpdstate"
sticker_file        "/home/batan/.config/mpd/sticker.sql"

audio_output {
    type        "wildmidi"
    name        "MIDI Output (WildMIDI)"
}
audio_output {
	 type "fifo"
	 name "MPD FIFO"
	 path "/tmp/mpd.fifo"
	 format "44100:16:2" buffer_time "100000"
}

# Set bind address and port for local network access
bind_to_address     "127.0.0.1"
port                "6600"

# Enable Gapless Playback and Crossfading (optional)
audio_buffer_size   "4096"
max_connections     "10"
filesystem_charset  "UTF-8"

# Define the main audio output (PulseAudio or ALSA)
audio_output {
    type            "pulse"          # Change to "alsa" for ALSA output
    name            "My PulseAudio Output"
    mixer_type      "software"
    buffer_time     "100000"         # Sync setting for visualization
}

# FIFO output for Cava visualizer
audio_output {
    type            "fifo"
    name            "Cava Visualizer"
    path            "/tmp/mpd.fifo"
    format          "44100:16:2"     # Sample rate 44100 Hz, 16-bit, stereo
}

EOF

# Restart MPD service
#systemctl --user restart mpd
sudo service mpd restart

# Configure ncmpcpp
NCMPCPP_CONF="$HOME/.config/ncmpcpp/config"
mkdir -p "$(dirname "$NCMPCPP_CONF")"
cat << EOF > "$NCMPCPP_CONF"
# MPD host and port
mpd_host = "localhost"
mpd_port = "6600"

# Music visualizer configuration
visualizer_in_stereo = "yes"
visualizer_output_name = "Visualizer Output"
visualizer_sync_interval = "30"
visualizer_type = "spectrum"
visualizer_look = "+|"
#visualizer_fifo_path = "/tmp/mpd.fifo"
visualizer_data_source = /tmp/mpd.fifo

# User interface settings
ncmpcpp_directory = "~/.config/ncmpcpp"
lyrics_directory = "~/.config/ncmpcpp/lyrics"
EOF

# Configure PulseAudio
PULSE_CONF="$HOME/.config/pulse/default.pa"
mkdir -p "$(dirname "$PULSE_CONF")"
cat << EOF > "$PULSE_CONF"
# Default PulseAudio configuration
# Set output sink to a specific device (adjust as needed)
set-default-sink @DEFAULT_SINK@
set-default-source @DEFAULT_SOURCE@
EOF

# Enable MPD FIFO output for cava
MPD_FIFO_PATH="/tmp/mpd.fifo"
if ! grep -q "$MPD_FIFO_PATH" "$MPD_CONF"; then
    echo 'audio_output { type "fifo"; name "MPD FIFO"; path "/tmp/mpd.fifo"; format "44100:16:2"; }' >> "$MPD_CONF"
fi
mkfifo "$MPD_FIFO_PATH"

# Configure cava
CAVA_CONF="$HOME/.config/cava/config"
mkdir -p "$(dirname "$CAVA_CONF")"
cat << EOF > "$CAVA_CONF"
# Cava configuration for MPD visualization
[general]
bars = 200
framerate = 60
lower_cutoff_freq = 50
higher_cutoff_freq = 10000
sensitivity = 70

[input]
method = fifo
source = "/tmp/mpd.fifo"

[output]
method = ncurses
bar_width = 2
bar_spacing = 1

[color]
gradient = 1             # Enable gradient colors
gradient_count = 8       # Maximum gradient count for a smoother transition

# Define each color for the gradient spectrum.
color1 = "#ff0000"       # Red
color2 = "#ff8000"       # Orange
color3 = "#ffff00"       # Yellow
color4 = "#80ff00"       # Yellow-Green
color5 = "#00ff00"       # Green
color6 = "#00ff80"       # Green-Cyan
color7 = "#00ffff"       # Cyan
color8 = "#0000ff"       # Blue


EOF

# Set up permissions for directories
chmod -R 755 "$MUSIC_DIR" "$PODCAST_DIR" "$MEDIA_DIR"

# Restart services

sudo service mpd restart
#systemctl --user restart mpd
pulseaudio --kill && pulseaudio --start

echo "Installation and configuration completed."
echo "  - MPD libraries are set to $MUSIC_DIR, $MEDIA_DIR, and $PODCAST_DIR."
echo "  - ncmpcpp, PulseAudio, and cava are now configured."
echo "Run 'ncmpcpp' to start using MPD, and 'cava' for visualizations."


fi
#}}}
#{{{>>>   Install LAMP stack

# Variables
DB_NAME="nextcloud"
DB_USER="batan"
DB_PASSWORD="Ba7an?12982"
NEXTCLOUD_URL="https://download.nextcloud.com/server/releases/latest.zip"
NEXTCLOUD_DIR="/var/www/nextcloud"
ADMIN_USER="batan"
ADMIN_PASSWORD="Ba7an?12982"
DOMAIN="localhost"

# Update and Install Dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 mariadb-server libapache2-mod-php8.2 -y
sudo apt install php8.2 php8.2-gd php8.2-mysql php8.2-curl php8.2-xml php8.2-mbstring php8.2-zip php8.2-intl php8.2-bcmath php8.2-gmp php-imagick unzip wget -y

# Enable Apache Modules
sudo a2enmod rewrite headers env dir mime
sudo systemctl restart apache2

# Configure MariaDB
sudo systemctl start mariadb
sudo mysql_secure_installation <<EOF

Y
$DB_PASSWORD
$DB_PASSWORD
Y
Y
Y
Y
EOF

# Create Nextcloud Database and User
sudo mysql -uroot -p$DB_PASSWORD <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

# Download and Install Nextcloud
cd /tmp
wget $NEXTCLOUD_URL -O nextcloud.zip
unzip nextcloud.zip
sudo mv nextcloud $NEXTCLOUD_DIR
sudo chown -R www-data:www-data $NEXTCLOUD_DIR
sudo chmod -R 755 $NEXTCLOUD_DIR

# Apache Configuration for Nextcloud
sudo bash -c "cat >/etc/apache2/sites-available/nextcloud.conf" <<EOF
<VirtualHost *:80>
    ServerAdmin admin@$DOMAIN
    DocumentRoot $NEXTCLOUD_DIR
    ServerName $DOMAIN

    <Directory $NEXTCLOUD_DIR>
        Options +FollowSymlinks
        AllowOverride All

        <IfModule mod_dav.c>
            Dav off
        </IfModule>

        SetEnv HOME $NEXTCLOUD_DIR
        SetEnv HTTP_HOME $NEXTCLOUD_DIR
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo a2ensite nextcloud.conf
sudo systemctl reload apache2

# Set Permissions
sudo chown -R www-data:www-data $NEXTCLOUD_DIR

# Install Nextcloud via Command Line
sudo -u www-data php $NEXTCLOUD_DIR/occ maintenance:install \
    --database "mysql" --database-name "$DB_NAME" \
    --database-user "$DB_USER" --database-pass "$DB_PASSWORD" \
    --admin-user "$ADMIN_USER" --admin-pass "$ADMIN_PASSWORD" \
    --data-dir "$NEXTCLOUD_DIR/data"

# Set local IP to trusted domain
LOCAL_IP=$(hostname -I | awk '{print $1}')
sudo -u www-data php $NEXTCLOUD_DIR/occ config:system:set trusted_domains 1 --value=$LOCAL_IP

# Restart Apache
sudo systemctl restart apache2

echo "Nextcloud installation complete. Access it via http://$LOCAL_IP"
#}}}
#{{{###   Pipx packages
for i in $(pipx python3);
do
dpkg -s $i>/dev/null
if [[ $? != 0 ]]; then
	sudo apt install $i -y
fi
done
for package in ${PIPX_PACKAGES[@]};
do
pipx install $package
done
#}}}
#{{{>>>   Install GNOME-BOXES
clear
for i in ${DEPS_BOXES[@]};
do
	dpkg -s $i>/dev/null 2>&1
	if [[ $? == "1" ]];
	then
		sudo apt install $i -y
		fi
done
#}}}
#{{{>>>   Cubic
clear
OSDIST=$(
)
	#Install CUbic for Debian and Derivatives
if [[ $OSDIST == "Debian" ]]; then
echo "deb https://ppa.launchpadcontent.net/cubic-wizard/release/ubuntu/ noble main" | sudo tee /etc/apt/sources.list.d/cubic-wizard-release.list
curl -S "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x081525e2b4f1283b" | sudo gpg --batch --yes --dearmor --output /etc/apt/trusted.gpg.d/cubic-wizard-ubuntu-release.gpg
sudo apt update
sudo apt install --no-install-recommends cubic
	#Install Cubic for Ubuntu and Derivatives
elfi [[ $OSDIST == "Ubuntu" ]]; then
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7579F80E494ED3406A59DF9081525E2B4F1283B
sudo apt-add-repository universe
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends cubic
fi

fi
#}}}
#{{{>>>   Install Flatpak, flathub and packages
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
for package in ${FLATPAK_PACKAGES[@]};
do
flatpak install flathub $package -y
done

#}}}
#{{{###   NEOVIM CODIUM VIM-PLUG and PLUGINS
NEOVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim.appimage"

#{{{###   Update system and install prerequisites
echo "Updating system and installing prerequisites..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git python3 python3-pip \
  build-essential libfuse2 nodejs npm \
  taskwarrior ripgrep software-properties-common
#}}}
#{{{###   Install the latest Neovim
echo "Installing the latest Neovim..."
wget "$NEOVIM_URL" -O /tmp/nvim.appimage
chmod u+x /tmp/nvim.appimage
sudo mv /tmp/nvim.appimage /usr/local/bin/nvim
#}}}
#{{{###   Install Node.js (required for Neovim autocompletion plugins)
echo "Installing Node.js and npm packages for Neovim autocompletion..."
sudo npm install -g neovim
#}}}
#{{{###   Install and configure Python support for Neovim
echo "Configuring Python for Neovim..."
sudo apt-get install python3-pynvim y
#}}}
#{{{###   Clone Codeium.vim plugin into the correct directory for Neovim
echo "Cloning Codeium.vim plugin..."
git clone https://github.com/Exafunction/codeium.vim ~/.config/nvim/pack/Exafunction/start/codeium.vim
#}}}
#{{{###   Open Neovim config (init.vim) to add Codeium settings
echo "Setting up Codeium configuration in Neovim..."

cat <<EOF >~/.config/nvim/init.vim

" Enable Codeium plugin
let g:codeium_disable_bindings = 0

" Map <Tab> and <Shift-Tab> to accept/previous suggestions
inoremap <silent><expr> <Tab> codeium#Accept()
inoremap <silent><expr> <S-Tab> codeium#Previous()

" Enable Codeium when entering Insert mode
autocmd InsertEnter * call codeium#Enable()

" Optional: Check Codeium status with a custom function
function! CheckCodeiumStatus()
    let status = luaeval("vim.api.nvim_call_function('codeium#GetStatusString', {})")
    echo "Codeium Status: " . status
endfunction

" Map <Leader>cs to check Codeium status
nnoremap <Leader>cs :call CheckCodeiumStatus()<CR>

" TABLE-MODE
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'



" Common settings for Neovim

syntax on
filetype plugin indent on
set laststatus=2
set so=7
set foldcolumn=1
"#set encoding=utf8
set ffs=unix,dos
set cmdheight=1
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nobackup
set nowb
set nocp
set autowrite
set hidden
set mouse=a
set noswapfile
set nu
set relativenumber
set t_Co=256
set cursorcolumn
set cursorline
set ruler
set scrolloff=10

" netrw filemanager settings

let g:netrw_menu = 1
let g:netrw_preview = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_lifestyle = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

" Leader and other mappings

let mapleader = ","
nnoremap <Leader>te :terminal<CR>
nnoremap <Leader>tc :terminal<CR>sudo -u batan bash $HOME/check/vim.cmd.sh <CR>
nnoremap <Leader>xc :w !xclip -selection clipboard<CR>	"copy page to clipboard
nnoremap <leader>dd :Lexplore %:p:h<CR>		"open netrw in 20% of the screen to teh left
nnoremap <Leader>da :Lexplore<CR>
nnoremap <leader>vv :split $MYVIMRC<CR>		"edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>	"source vimrc
nnoremap <leader>ra :<C-U>RangerChooser<CR>
nmap <F8> :TagbarToggle<CR>				"tagbar toggle

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"###################		TEMPLATES		################################
autocmd! BufNewFile *.sh 0r ~/.config/nvim/templates/sklt.sh |call setpos('.', [0, 29, 1, 0])
autocmd! BufNewFile *popup.html 0r ~/.config/nvim/templates/popup.html
autocmd! BufNewFile *popup.css 0r ~/.config/nvim/templates/popup.css
autocmd! BufNewFile *popup.js 0r ~/.config/nvim/templates/popup.js
autocmd! BufNewFile *.html 0r ~/.config/nvim/templates/sklt.html
autocmd! BufNewFile *.txt 0r ~/.config/nvim/templates/sklt.txt
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

"##########################   TASK WIKI   ###############################
" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 15
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '

"###   STARTUP PAGE   ##############################################################

fun! Start()
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Force clear buffer
    enew
    call setline(1, []) " Clear content explicitly

    " Set buffer options
    setlocal bufhidden=wipe buftype=nofile nobuflisted nocursorcolumn nocursorline nolist nonumber noswapfile norelativenumber

    " Append task output
    let lines = split(system('task'), '\n')
    for line in lines
        call append('$', '            ' . line)
    endfor

    " Make buffer unmodifiable
    setlocal nomodifiable nomodified

    " Key mappings for convenience
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

augroup StartPage
    autocmd!
    autocmd VimEnter * call Start()
augroup END




EOF
#}}}
#{{{###   INSTALL some plugins from my old neovim lc-configs
# cloneing templates for neovim
git clone https://github.com/batann/templates.git ~/.config/nvim/templates
# Install vim-taskwarrior
echo "Installing vim-taskwarrior..."
git clone https://github.com/ribelo/taskwarrior.nvim.git ~/.config/nvim/pack/vim-taskwarrior/start/vim-taskwarrior
# Install Orig TW
git clone https://github.com/farseer90718/vim-taskwarrior /home/batan/.config/nvim/pack/plugins/start/vim-taskwarrior
# Install table-mode
git clone https://github.com/dhruvasagar/vim-table-mode.git ~/.config/nvim/pack/plugins/start/vim-table-mode
# Install vimwiki
git clone https://github.com/vimwiki/vimwiki.git  ~/.config/nvim/pack/plugins/start/vimwiki
# Install task.wiki
git clone https://github.com/tools-life/taskwiki.git --branch dev ~/.config/nvim/pack/plugins/start/taskwiki

# remove any .git directories
find ~/.config/nvim/ -maxdepth 10 -type d -name ".git" -exec rm -rf {} \;
#}}}
#{{{###   Install vim-plug (optional, in case you want to add more plugins)
echo "Installing vim-plug (optional for plugin management)..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Neovim and Codeium setup complete!"
echo "Use :call CheckCodeiumStatus() or press <Leader>cs to check Codeium status in Neovim."
#}}}
#}}}
#{{{>>>   Install neovim with codium autocompleation

# Install neovim with codium autocompleation
clear
echo -e "\033[44m\033[30mInstalling neovim with codium autocompleation\033[0m"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz

#sudo rm -rf /opt/nvim
git clone https://github.com/Exafunction/codeium.vim ~/.config/nvim/pack/Exafunction/start/codeium.vim

# Create init.vim file
cat << 'EOL' > /home/batan/.config/nvim/init.vim
source  /home/batan/.config/nvim/init.vim.codium

colorscheme moonfly
syntax on
filetype plugin indent on
set laststatus=2
set so=7
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos
set cmdheight=1
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set encoding=utf8
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nobackup
set nowb
set nocp
set autowrite
set hidden
set mouse=a
set noswapfile
set nu
set relativenumber
set t_Co=256
set cursorcolumn
set cursorline
set ruler
set scrolloff=10

let g:netrw_menu = 1
let g:netrw_preview = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_lifestyle = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

"###################		TEMPLATES		################################
autocmd! BufNewFile *.sh 0r ~/.config/nvim/templates/sklt.sh |call setpos('.', [0, 29, 1, 0])
autocmd! BufNewFile *popup.html 0r ~/.config/nvim/templates/popup.html
autocmd! BufNewFile *popup.css 0r ~/.config/nvim/templates/popup.css
autocmd! BufNewFile *popup.js 0r ~/.config/nvim/templates/popup.js
autocmd! BufNewFile *.html 0r ~/.config/nvim/templates/sklt.html
autocmd! BufNewFile *.txt 0r ~/.config/nvim/templates/sklt.txt
if has ('autocmd') " Remain compatible with earlier versions
 augroup.config/nvimrc     " Source.config/nvim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

EOL


cat << 'EOL' > /home/batan/.config/nvim/init.vim.codium
"# Codium Config
#disable default keybindings
vim.g.codeium_disable_bindings = 1
#disable codium by default
vim.g.codeium_enabled = false
#show codium in status line
vim.api.nvim_call_function("codeium#GetStatusString", {})
EOL


if [[ ! -d /home/batan/.config/nvim/templates/ ]];
then
	mkdir /home/batan/.config//nvim/templates
fi
git clone https://github.com/batann/templates.git /home/batan/.config/nvim/templates/

# ADD TEMPLATES to NEOVIM



# Add init.vim
echo "source /home/batan/.config/nvim/init.vim.codium" >> /home/batan/.config/nvim/init.vim
sudo rm -rf nvim-linux64.tar.gz
echo -e "\033[44m\033[30mInstalling neovim with codium autocompleation done\033[0m"

# Install nvim-plug
echo -e "\033[44m\033[30mInstalling nvim-plug\033[0m"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install nvim-cmp
echo -e "\033[44m\033[30mInstalling nvim-cmp\033[0m"
git clone https://github.com/hrsh7th/nvim-cmp ~/.config/nvim/pack/hrsh7th/start/nvim-cmp

# Install nvim-lspconfig
echo -e "\033[44m\033[30mInstalling nvim-lspconfig\033[0m"
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim-lspconfig/start/nvim-lspconfig

# Install nvim-treesitter
echo -e "\033[44m\033[30mInstalling nvim-treesitter\033[0m"
git clone https://github.com/nvim-treesitter/nvim-treesitter ~/.config/nvim/pack/nvim-treesitter/start/nvim-treesitter

# Install nvim-ts-autotag
echo -e "\033[44m\033[30mInstalling nvim-ts-autotag\033[0m"
git clone https://github.com/windwp/nvim-ts-autotag ~/.config/nvim/pack/nvim-ts-autotag/start/nvim-ts-autotag

# Install nvim-ts-context-commentstring
echo -e "\033[44m\033[30mInstalling nvim-ts-context-commentstring\033[0m"
git clone https://github.com/JoosepAlviste/nvim-ts-context-commentstring ~/.config/nvim/pack/nvim-ts-context-commentstring/start/nvim-ts-context-commentstring

# Install nvim-autopairs
echo -e "\033[44m\033[30mInstalling nvim-autopairs\033[0m"
git clone https://github.com/windwp/nvim-autopairs ~/.config/nvim/pack/nvim-autopairs/start/nvim-autopairs

# Install nvim-ts-rainbow
echo -e "\033[44m\033[30mInstalling nvim-ts-rainbow\033[0m"
git clone https://github.com/p00f/nvim-ts-rainbow ~/.config/nvim/pack/nvim-ts-rainbow/start/nvim-ts-rainbow

# Install nvim-ts-autotag
echo -e "\033[44m\033[30mInstalling nvim-ts-autotag\033[0m"
git clone https://github.com/windwp/nvim-ts-autotag ~/.config/nvim/pack/nvim-ts-autotag/start/nvim-ts-autotag

# Install nvim-lsp-ts-utils
echo -e "\033[44m\033[30mInstalling nvim-lsp-ts-utils\033[0m"
git clone https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils ~/.config/nvim/pack/nvim-lsp-ts-utils/start/nvim-lsp-ts-utils



#}}}
#{{{>>>   Install docker and funkwhale
# Function to display error and exit
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

# Verifying Debian and Ubuntu
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	if [ -f /etc/os-release ]; then
		# Source the os-release file to get distribution info
		. /etc/os-release
		OS=$NAME
		VER=$VERSION_ID
	elif [ -f /etc/lsb-release ]; then
		# For older systems, use lsb_release if available
		. /etc/lsb-release
		OS=$DISTRIB_ID
		VER=$DISTRIB_RELEASE
	elif [ -f /etc/debian_version ]; then
		# For Debian-based systems without os-release
		OS="Debian"
		VER=$(cat /etc/debian_version)
	else
		# Unknown Linux system
		OS=$(uname -s)
		VER=$(uname -r)
	fi
fi
echo -e "${B}Detected Linux system:$OS"
DITRIB=$OS



# Installing Docker on Ubuntu

if [[ $DITRIB == 'Ubuntu']];
then

for dependency in ${DEPS_DOCKER_UBUNTU[@]};
do
	dpkg -s $dependency >/dev/null 2>&1
	if [[ $? == '1' ]];
then
	echo -e "\033[33mInstalling $dependency\033[0m"
	sudo apt install $dependency -y
else
	echo -e "\033[33m$dependency already installed\033[0m"
	fi



elif [[ $DISTRIB == 'Debian']];
then

# Update the package list and install prerequisites
echo "Updating package list and installing prerequisites..."
sudo apt update || error_exit "Failed to update package list"
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release || error_exit "Failed to install prerequisites"

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings || error_exit "Failed to create keyring directory"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg || error_exit "Failed to add Docker's GPG key"

# Set up the Docker repository
echo "Setting up Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || error_exit "Failed to set up Docker repository"

# Update package list and install Docker
echo "Installing Docker..."
sudo apt update || error_exit "Failed to update package list"

if [[ $DITRIB == 'Debian']];
then

for dependency in ${DEPS_DOCKER_DEBIAN[@]};
do
	dpkg -s $dependency >/dev/null 2>&1
	if [[ $? == '1' ]];
then
	echo -e "\033[33mInstalling $dependency\033[0m"
	sudo apt install $dependency -y
else
	echo -e "\033[33m$dependency already installed\033[0m"
	fi

#sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || error_exit "Failed to install Docker"

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version || error_exit "Docker installation failed"

# Prompt for Funkwhale configuration
read -e -p "Enter the Funkwhale hostname (e.g., yourdomain.funkwhale): " -i 'funkwhale' FUNKWHALE_HOSTNAME
read -e -p "Enter the full path for Funkwhale data directory (e.g., /path/to/data): " -i '/media/batan/100/Music/data' DATA_DIR
read -e -p "Enter the full path for Funkwhale music directory (e.g., /path/to/music): " -i '/media/batan/100/Music/' MUSIC_DIR

if [[ ! -d "$DATA_DIR" ]]; then
	mkdir -p "$DATA_DIR"
fi


# Check if directories exist
[ ! -d "$DATA_DIR" ] && error_exit "Data directory does not exist: $DATA_DIR"
[ ! -d "$MUSIC_DIR" ] && error_exit "Music directory does not exist: $MUSIC_DIR"

# Run the Funkwhale Docker container
echo "Running Funkwhale container..."
docker run \
    --name=funkwhale \
    -e FUNKWHALE_HOSTNAME="$FUNKWHALE_HOSTNAME" \
    -e NESTED_PROXY=0 \
    -v "$DATA_DIR:/data" \
    -v "$MUSIC_DIR:/music:ro" \
    -p 3030:80 \
    thetarkus/funkwhale || error_exit "Failed to start Funkwhale container"

echo "Funkwhale is now running. Access it at http://localhost:3030 or http://$FUNKWHALE_HOSTNAME"


#}}}
#{{{>>>   Install Custom Grub

#/**
# * to add to a main install script assume following directory tree:
# * Base_Directory|-themes|-theme1-(directory for each theme defind in function select_themes)
# *  |-install.sh         |-theme2-(including all requred content)
# *  |-README.md          |-theme3
# *  |-run_test.sh
# *  |-run_linter.sh
# *
# *
# */



#THEME_DIR='/usr/share/grub/themes'
THEME_DIR='/boot/grub/themes'
THEME_NAME=''
DIR_VIMIX="/home/batan/themes/Vimix"

if [[ ! -d $DIR_VIMIX ]]; then
    mkdir -p $DIR_VIMIX
fi
megacopy -l $DIR_VIMIX -r /Root/grub/Vimix --download


function echo_title() {     echo -ne "\033[1;44;37m${*}\033[0m\n"; }
function echo_caption() {   echo -ne "\033[0;1;44m${*}\033[0m\n"; }
function echo_bold() {      echo -ne "\033[0;1;34m${*}\033[0m\n"; }
function echo_danger() {    echo -ne "\033[0;31m${*}\033[0m\n"; }
function echo_success() {   echo -ne "\033[0;32m${*}\033[0m\n"; }
function echo_warning() {   echo -ne "\033[0;33m${*}\033[0m\n"; }
function echo_secondary() { echo -ne "\033[0;34m${*}\033[0m\n"; }
function echo_info() {      echo -ne "\033[0;35m${*}\033[0m\n"; }
function echo_primary() {   echo -ne "\033[0;36m${*}\033[0m\n"; }
function echo_error() {     echo -ne "\033[0;1;31merror:\033[0;31m\t${*}\033[0m\n"; }
function echo_label() {     echo -ne "\033[0;1;32m${*}:\033[0m\t"; }
function echo_prompt() {    echo -ne "\033[0;36m${*}\033[0m "; }

function splash() {
    local hr
    hr=" **$(printf "%${#1}s" | tr ' ' '*')** "
    echo_title "${hr}"
    echo_title " * $1 * "
    echo_title "${hr}"
    echo
}

function check_root() {
    # Checking for root access and proceed if it is present
    ROOT_UID=0
    if [[ ! "${UID}" -eq "${ROOT_UID}" ]]; then
        # Error message
        echo_error 'Run me as root.'
        echo_info 'try sudo ./install.sh'
        exit 1
    fi
}

function select_theme() {
    themes=('crow' 'Cyb' 'Cyberpunk' 'CyberRe' 'minegrub-theme' 'navi' 'Shodan' 'Vimix' 'windows-11' 'Quit')


    PS3=$(echo_prompt '\nChoose The Theme You Want: ')
    select THEME_NAME in "${themes[@]}"; do
        case "${THEME_NAME}" in
            'Vimix')
                splash 'Installing Vimix Theme...'
                break;;
            'Cyberpunk')
                splash 'Installing Cyberpunk Theme...'
                break;;
            'Shodan')
                splash 'Installing Shodan Theme...'
                break;;
            'fallout')
                splash 'Installing fallout Theme...'
                break;;
            'CyberRe')
                splash 'Installing CyberRe Theme...'
                break;;
            'minegrub-theme')
                splash 'Installing Minecraft Theme...'
                break;;
            'Quit')
                echo_info 'User requested exit...!'
                exit 0;;
            *) echo_warning "invalid option \"${REPLY}\"";;
        esac
    done
}

function backup() {
    # Backup grub config
    echo_info 'cp -an /etc/default/grub /etc/default/grub.bak'
    cp -an /etc/default/grub /etc/default/grub.bak
}

function install_theme() {
    # create themes directory if not exists
    if [[ ! -d "${THEME_DIR}/${THEME_NAME}" ]]; then
        # Copy theme
        echo_primary "Installing ${THEME_NAME} theme..."

        echo_info "mkdir -p \"${THEME_DIR}/${THEME_NAME}\""
        mkdir -p "${THEME_DIR}/${THEME_NAME}"

        echo_info "cp -a ./themes/\"${THEME_NAME}\"/* \"${THEME_DIR}/${THEME_NAME}\""
        cp -a ./themes/"${THEME_NAME}"/* "${THEME_DIR}/${THEME_NAME}"
    fi
}

function config_grub() {
    echo_primary 'Enabling grub menu'
    # remove default grub style if any
    echo_info "sed -i '/GRUB_TIMEOUT_STYLE=/d' /etc/default/grub"
    sed -i '/GRUB_TIMEOUT_STYLE=/d' /etc/default/grub

    echo_info "echo 'GRUB_TIMEOUT_STYLE=\"menu\"' >> /etc/default/grub"
    echo 'GRUB_TIMEOUT_STYLE="menu"' >> /etc/default/grub

    #--------------------------------------------------

    echo_primary 'Setting grub timeout to 60 seconds'
    # remove default timeout if any
    echo_info "sed -i '/GRUB_TIMEOUT=/d' /etc/default/grub"
    sed -i '/GRUB_TIMEOUT=/d' /etc/default/grub

    echo_info "echo 'GRUB_TIMEOUT=\"60\"' >> /etc/default/grub"
    echo 'GRUB_TIMEOUT="60"' >> /etc/default/grub

    #--------------------------------------------------

    echo_primary "Setting ${THEME_NAME} as default"
    # remove theme if any
    echo_info "sed -i '/GRUB_THEME=/d' /etc/default/grub"
    sed -i '/GRUB_THEME=/d' /etc/default/grub

    echo_info "echo \"GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"\" >> /etc/default/grub"
    echo "GRUB_THEME=\"${THEME_DIR}/${THEME_NAME}/theme.txt\"" >> /etc/default/grub

    #--------------------------------------------------

    echo_primary 'Setting grub graphics mode to auto'
    # remove default timeout if any
    echo_info "sed -i '/GRUB_GFXMODE=/d' /etc/default/grub"
    sed -i '/GRUB_GFXMODE=/d' /etc/default/grub

    echo_info "echo 'GRUB_GFXMODE=\"auto\"' >> /etc/default/grub"
    echo 'GRUB_GFXMODE="auto"' >> /etc/default/grub
}

function update_grub() {
    # Update grub config
    echo_primary 'Updating grub config...'
    if [[ -x "$(command -v update-grub)" ]]; then
        echo_info 'update-grub'
        update-grub

    elif [[ -x "$(command -v grub-mkconfig)" ]]; then
        echo_info 'grub-mkconfig -o /boot/grub/grub.cfg'
        grub-mkconfig -o /boot/grub/grub.cfg

    elif [[ -x "$(command -v grub2-mkconfig)" ]]; then
        if [[ -x "$(command -v zypper)" ]]; then
            echo_info 'grub2-mkconfig -o /boot/grub2/grub.cfg'
            grub2-mkconfig -o /boot/grub2/grub.cfg

        elif [[ -x "$(command -v dnf)" ]]; then
            echo_info 'grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg'
            grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
        fi
    fi
}

function main() {
    splash 'The Matrix awaits you...'

    check_root
    select_theme

    install_theme

    config_grub
    update_grub

    echo_success 'Boot Theme Update Successful!'
}

main

#}}}
#{{{>>>   Install Custom Plymouth
if [[ ! -d /usr/share/plymouth/themes/ ]];
then
	sudo mkdir -p /usr/share/plymouth/themes
fi
	dpkg -s plymouth-x11 >/dev/null 2>&1
	if [[ $? == '1' ]];
	then
		echo -e "\033[33mInstalling plymouth-x11\033[0m ..."
		sudo apt-get install -y plymouth-x11 > /dev/null 2>&1
	fi
   git clone https://github.com/batann/plymouth.git
   cd /usr/share/plymouth/themes/
   sudo cp -r /home/batan/plymouth/anon .
  sudo sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT=/c\GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"' /etc/default/grub
  sudo plymouth-set-default-theme -R anon
# updates current kernel
#   sudo update-initramfs -u
# -c creates a new initramfs
   sudo update-initramfs -c -k $(uname -r)
   sudo update-grub2
   sudo rm -r /home/batan/plymouth
#}}}
#{{{>>>   Custom Image for Lightdm
find /usr/share/lightdm/lightdm-gtk-greeter.conf.d/ -type f -name "01_debian.conf" -exec sudo sed -i 's!background=/usr/share/images/desktop-base/login-background.svg!background=/usr/share/backgrounds/back.lc.504.png!g' {} \;
#}}}
#{{{>>>   Install Nix Package manager
curl -L https://nixos.org/nix/install | sh
sudo echo " . /home/$USER/.nix-profile/etc/profile.d/nix.sh" >> .bashrc
source .bashrc

#}}}
#{{{>>>   Exec Nautilus-Scripts
git clone https://github.com/batann/nautilus-scripts
cd nautilus-scripts
bash install.sh
cd
sudo rm -r nautilus-scripts
#}}}
#{{{>>>   Hosts File
git clone https://github.com/batann/host
touch hosts
cat /etc/hosts >> hosts
cat host/hosts >> hosts
sudo mv /etc/hosts /etc/hosts.batan
sudo chown root:root hosts
sudo mv hosts /etc/hosts
sudo rm -r host
#}}}
#{{{>>>   bashrc,aliases and navigation
git clone https://github.com/batann/lc-cd
cp lc-cd/lc-cd ~/.lc-cd
rm -r lc-cd
#}}}
#{{{>>>   GO installation
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
clear
go version
#}}}
#{{{>>>   YAD installation incl HTML support




# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
REPO_URL="https://github.com/v1cont/yad.git"
INSTALL_DIR="$HOME/yad-build"

# Update system and install dependencies
echo "Updating system and installing dependencies..."
sudo apt update && sudo apt upgrade -y

for package in ${DEPS_YAD[@]};
do
	dpkg -s $package>/dev/null 2>&1
	if [[ $? == '1' ]];
		then
		echo -e "\033[33mInstalling $package\033[0m"
  sudo apt install -y $package
	fi
done


# Clone the YAD repository
echo "Cloning the YAD repository..."
if [ -d "$INSTALL_DIR" ]; then
  echo "Directory $INSTALL_DIR already exists, removing it."
  rm -rf "$INSTALL_DIR"
fi

git clone "$REPO_URL" "$INSTALL_DIR"

# Navigate to the repository
cd "$INSTALL_DIR"

# Configure and enable HTML browser support
echo "Configuring YAD with HTML browser support..."
autoreconf -ivf && intltoolize
./configure --enable-html

# Compile and install YAD
echo "Compiling and installing YAD..."
make
sudo make install

# Verify installation
echo "Verifying YAD installation..."
yad --version


#}}}
#{{{>>>   cursor AppImage download
wget https://downloader.cursor.sh/linux/appImage/x64
#}}}
#{{{>>>   Add Repo and Install WindSurf Editor
curl -fsSL "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | sudo gpg --dearmor -o /usr/share/keyrings/windsurf-stable-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/windsurf-stable-archive-keyring.gpg arch=amd64] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
sudo apt-get update
sudo apt-get upgrade windsurf -y
#}}}
#{{{>>>   Install Windscribe VPN
DEPS_WINDSCRIBE="net-tools"

for packages in ${DEPS_WINDSCRIBE[@]}; do
	dpkg -s >/dev/null 2>&1
	if [[ $? == '1' ]];
	then
		echo -e "\033[33mInstalling $packages\033[0m"
		sudo apt-get install -y $packages > /dev/null 2>&1
	fi
done

wget https://deploy.totallyacdn.com/desktop-apps/2.12.7/windscribe_2.12.7_amd64.deb
sudo dpkg -i windscribe_2.12.7_amd64.deb
#}}}
#{{{>>>   AI Vicuma Installation
#!/bin/bash

# Exit on errors
set -e

# Define model and dependencies
MODEL_URL="https://huggingface.co/llama.cpp/models/vicuna-7b-1.1/resolve/main/vicuna-7b-1.1.ggmlv3.q8_0.bin"
MODEL_DIR="$HOME/models/vicuna-7b"
LLAMA_CPP_REPO="https://github.com/ggerganov/llama.cpp.git"

# Ensure necessary packages are installed
sudo apt update
sudo apt install -y git build-essential python3 python3-pip python3-venv cmake curl

# Install pipx for isolated Python package management
if ! command -v pipx &> /dev/null; then
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    export PATH="$HOME/.local/bin:$PATH"
fi

# Clone and build llama.cpp
if [ ! -d "$HOME/llama.cpp" ]; then
    git clone "$LLAMA_CPP_REPO" "$HOME/llama.cpp"
    cd "$HOME/llama.cpp"
    make
else
    echo "llama.cpp already installed. Skipping build."
fi

# Download the model
mkdir -p "$MODEL_DIR"
MODEL_FILE="$MODEL_DIR/vicuna-7b-1.1.ggmlv3.q8_0.bin"
if [ ! -f "$MODEL_FILE" ]; then
    echo "Downloading model to $MODEL_FILE..."
    curl -L -o "$MODEL_FILE" "$MODEL_URL"
else
    echo "Model file already exists. Skipping download."
fi

# Ensure llama.cpp binary is accessible
export PATH="$HOME/llama.cpp:$PATH"

# Install Python dependencies using pipx
pipx install transformers
pipx install bitsandbytes
pipx install sentencepiece

# Create a Python script to interface with the model
INTERFACE_SCRIPT="$MODEL_DIR/interface.py"
cat > "$INTERFACE_SCRIPT" <<EOF
import os
from subprocess import run

def main():
    model_path = os.path.expanduser("$MODEL_FILE")
    llama_binary = os.path.expanduser("$HOME/llama.cpp/main")

    if not os.path.exists(model_path):
        raise FileNotFoundError(f"Model not found at {model_path}")

    print("Starting interactive session with Vicuna-7B-1.1...")
    run([llama_binary, "--model", model_path, "--interactive"])

if __name__ == "__main__":
    main()
EOF

chmod +x "$INTERFACE_SCRIPT"

# Finish up
echo "Setup complete!"
echo "To start interacting with the Vicuna model, run:"
echo "python3 $INTERFACE_SCRIPT"

#}}}
#{{{>>>   Super File
bash -c "$(curl -sLo- https://superfile.netlify.app/install.sh)"

#}}}
#{{{>>>   CClean.sh
#!/bin/bash
tput civis

dependencies="bleachbit sweeper rename"

extentions="*.part .*.bak.* *.org *.bakup *.backup.* *.tmp.* *.tmp *.ytp.* *.st *.tmp.*.swp *.ytdl .*.part .*.bak..* .*.org .*.bakup .*.backup.* .*.tmp.* .*.tmp .*.ytp.* .*.st .*.tmp .*.swp .*.ytdl"
cleaners=" apt.autoclean apt.autoremove apt.clean apt.package_lists bash.history chromium.cache chromium.cookies chromium.dom chromium.form_history chromium.history chromium.passwords chromium.search_engines chromium.session chromium.site_preferences chromium.sync chromium.vacuum deepscan.backup deepscan.ds_store deepscan.thumbs_db deepscan.tmp deepscan.vim_swap_root deepscan.vim_swap_user filezilla.mru firefox.backup firefox.cache firefox.cookies firefox.crash_reports firefox.dom firefox.forms firefox.passwords firefox.session_restore firefox.site_preferences firefox.url_history firefox.vacuum flash.cache flash.cookies nautilus.history rhythmbox.cache rhythmbox.history sqlitet.history system.cache system.clipboard system.custom system.desktop_entry system.localizations system.memory system.recent_documents system.rotated_logs system.tmp system.trash transmission.blocklists transmission.history transmission.torrents vim.history vlc.memory_dump vlc.mru wine.tmp winetricks.temporary_files x11.debug_logs"
if [[ ! -d /home/baran/SH ]];
then
	mkdir /home/batan/SH
fi

video_move() {
	rename 's/ /_/g' /home/batan/*.mp4
	rename 's/\[.*\]//g' /home/batan/*.mp4
	rename 's/\(.*\)//g' /home/batan/*.mp4
	mv /home/batan/*.mp4 /home/batan/Videos
}
music_move() {
	rename 's/ /_/g' /home/batan/*.mp3
	rename 's/\[.*\]//g' /home/batan/*.mp3
	rename 's/\(.*\)//g' /home/batan/*.mp3
	mv /home/batan/*.mp3 /home/batan/Music
}

image_move(){
	if [[ -f  /home/batan/*.png  ]];
	then
mv *.jpg *.png *.jpeg /home/batan/Pictures>/dev/null 2>&1
	fi
}

script_move (){
if [[ -f /home/batan/*.sh ]];
then
	mkdir /home/batan/SH >/dev/null 2>&1
	mv *.sh /home/batan/SH >/dev/null 2>&1
fi
}

shred_thumb() {
tput cup 29 0
tput el
tput cup 29 0
echo -e "R) Removes S) Shreds the thumbnails"
tput cup 29 35
read -n1 ggg
if [[ $ggg == "s" ]];
then fff="shred"
fi
tput cup 29 0
tput el

for i in $(find .cache -type f -name '*.png');
	do
		aaa=$(find .cache/ -type f -name '*png' |wc -l)
		tput cup 35 0
		tput el
		tput cup 35 0
        echo -e "\033[33mShred thumbnails\033[0m         \033[32m[[ \033[37m$aaa \033[32m]]\033[0m"
		tput cup 35 38
		echo -e "\033[34m[ ]\033[0m"
		if [[ $fff == 'shred' ]];
		then
			shred -f -u -z -n1 $i
		else
			rm -f $i
		fi
	done
}
count_thumb() {
	find /home/$USER/.cache -type f -name '*.png' | wc -l
}
ytdlp_clean(){
	dpkg -s yt-dlp>/dev/null
	if [[ $? == "0" ]];
	then
		yt-dlp --rm-cache-dir
	fi
}
apt_clean(){
sudo apt-get autoclean
sudo apt-get autoremove --purge -y
sudo apt-get clean
}
NK="\033[36m[ ]\033[0m"
K="\033[36m[\033[31mx\033[36m]\033[0m"
clear
tput cup 28 0
echo -e "\033[40m\033[32m==========================================\033[0m"
tput cup 30 0
echo -e "\033[40m\033[32m==========================================\033[0m"
tput cup 31 0
echo -e "\033[33mRemove Hanging Files\033[0m"
tput cup 31 38
echo -e "$NK"
echo -e "\033[33mClean and clear apt\033[0m"
tput cup 32 38
echo -e "$NK"
echo -e "\033[33mMove and rename movies\033[0m"
tput cup 33 38
echo -e "$NK"
echo -e "\033[33mMove and rename images\033[0m"
tput cup 34 38
echo -e "$NK"
echo -e "\033[33mMove scripts to SH\033[0m"
tput cup 35 38
echo -e "$NK"
echo -e "\033[33mShred thumbnails\033[0m"
tput cup 36 38
echo -e "$NK"
echo -e "\033[33mRemove yt-dlp cache directory\033[0m"
tput cup 37 38
echo -e "$NK"
echo -e "\033[33mRemove unused flatpaks\033[0m"
tput cup 38 38
echo -e "$NK"
echo -e "\033[33mRemove firefox caches\033[0m"
tput cup 39 38
echo -e "$NK"
echo -e "\033[33mRun Sweeper\033[0m"
tput cup 40 38
echo -e "$NK"
echo -e "\033[33mRun bleachbit with custom cleaners\033[0m"
tput cup 41 38
echo -e "$NK"
echo -e "\033[33mDrop Caches 1\033[0m"
tput cup 42 38
echo -e "$NK"
echo -e "\033[33mDrop Caches 2\033[0m"
tput cup 43 38
echo -e "$NK"
echo -e "\033[33mSwap Off\033[0m"
tput cup 44 38
echo -e "$NK"
echo -e "\033[33mSwap On\033[0m"
tput cup 45 38
echo -e "$NK"
echo -e "\033[33mxxxxxxxx \033[0m"
tput cup 46 38
echo -e "$NK"
echo -e "\033[33mxxxxxxxx \033[0m"
tput cup 47 38
echo -e "$NK"
echo -e "\033[33mxxxxxxxx \033[0m"
tput cup 48 38
echo -e "$NK"
echo -e "\033[33mxxxxxxxx \033[0m"
tput cup 49 0
echo -e "\033[40m\033[32m==========================================\033[0m"

rm $extentions >/dev/null 2>&1
	aa1="x"
tput cup 31 38
echo -e "$K"
apt_clean >/dev/null 2>&1
    aa2="x"
tput cup 32 38
echo -e "$K"
	video_move >/dev/null 2>&1
	aa3="x"
tput cup 33 38
echo -e "$K"
	music_move >/dev/null 2>&1
 	aa4="x"
tput cup 34 38
echo -e "$K"
	image_move>/dev/null 2>&1
	aa5="x"
tput cup 35 38
echo -e "$K"
	script_move>/dev/null 2>&1
	aa6="x"
tput cup 36 38
echo -e "$K"
	shred_thumb
 	aa7="x"
tput cup 37 38
echo -e "$K"
	ytdlp_clean>/dev/null 2>&1
	aa8="x"
tput cup 38 38
echo -e "$K"

flatpak uninstall --unused>/dev/null 2>&1
aa10="x"
tput cup 39 38
echo -e "$K"
#du -hc /var/tmp/flatpak-cache-* | tail -1 >/dev/null 2>&1
aa11="x"
tput cup 40 38
echo -e "$K"
rm -r /home/batan/.cache/mozilla/firefox/*>/dev/null 2>&1
aa12="x"
tput cup 41 38
echo -e "$K"
sudo sweeper --automatic >/dev/null 2>&1
aa13="x"
tput cup 42 38
echo -e "$K"
sudo bleachbit -c $cleaners>/dev/null 2>&1
aa14="x"
tput cup 43 38
echo -e "$K"
echo 1|sudo tee /proc/sys/vm/drop_caches >/dev/null 2>&1
aa15="x"
tput cup 44 38
echo -e "$K"
echo 2|sudo tee /proc/sys/vm/drop_caches >/dev/null 2>&1
aa16="x"
tput cup 45 38
echo -e "$K"
sudo swapoff -a>/dev/null 2>&1
aa17="x"
tput cup 46 38
echo -e "$K"
sudo swapon -a>/dev/null 2>&1
aa18="x"
tput cup 47 38
echo -e "$K"
echo "PLACEHOLDER">/dev/null 2>&1
tput cup 48 38
echo -e "$K"

tput cup 51 0
echo -e "\033[40m\033[32m==========================================\033[0m"
tput cup 28 0
echo -e "    DONE! Script run Successsfully "
tput cup 49 0
echo -e "         \033[47m\033[30mPress [ANY] to Exit...\033[0m"
read -n1 xxx
tput cnorm

#}}}
#{{{>>>   FIN.sh

dialog --backtitle "Your friendly Postinstall Script" --title "Hi there!" --msgbox "Hold on to your heameroids and relax,
dont panic, I am here to help!" 10 60
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	#	apt-get update && sudo apt-get upgrade
	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 40 76 000)
	options=(1 "My Github" off
2 "Ranger" off
3 "Cmus" off
4 "Flatpak" off
5 "Git" off
6 "Phython3-pip" off
7 "Taskwarrior" off
8 "Timewarrior" off
9 "Sweeper" off
10 "Ungoogled Chromium" off
11 "Ip2 (aug-2000)" off
12 "" off
13 "Chromium" off
14 "Vit" off
15 "Bitwarden" off
16 "Neovim" off
17 "Mega Sync Cloud" off
18 "Tutanota" off
19 "Bleachbit" off
20 "Oolite" off
21 "Musikcube" off
22 "Browser-history" off
23 "Castero" off
24 "Rtv" off
25 "Rainbowstream" off
26 "Eg" off
27 "Bpytop" off
28 "Openssh-server" off
29 "Openssh-client" off
30 "Renameutils" off
31 "Mat2" off
32 "0ad" off
33 "Yt-dlp" off
34 "Ffmpeg" off
35 "Buku" off
36 "Megatools" off
37 "Bitwarden-cli" off
38 "YAD -html deps" off
39 "Visual Code" off
40 "Protonvpn" off
41 "N Stacer" off
42 "Links2" off
43 "W3m" off
44 "Trash-cli" off
45 "Kdeconnect" off
46 "Zsh" off
47 "Ufw" off
48 "Guake" off
49 "Tmux" off
50 "Yad" off
51 "Nodau" off
52 "Pwman3" off
53 "Bwmw-ng" off
54 "Calcurse" off
55 "Vnstat" off
56 "Vimwiki" off
57 "Vim-taskwarrior" off
58 "Taskwiki" off
59 "Tabular" off
60 "Calendar" off
61 "Tagbar" off
62 "Vim-plugin-AnsiEsc" off
63 "Table-mode" off
64 "Vimoucompleteme" off
65 "Deoplete" off
66 "Emmet-vim" off
67 "Synchronous L engine" off
68 "Html5.vim" off
69 "Surround-vim" off
70 "Vim-lsp" off
71 "Vim-lsp-ale" off
72 "Prettier" off
73 "Unite.vim" off
74 "Turtle Note" off
75 "Megasync Home" off
76 "Speedread" off
77 "Shalarm" off
78 "Speedtest-cli" off
79 "Festival" off
80 "Espeak" off
81 "Terminator" off
82 "Festvox-us-slt-hts" off
83 "Fzf" off
84 "Rofi" off
85 "Ddgr" off
86 "Tldr" off
87 "Proton VPN" off
88 "Ctags from Repo" off
89 "Stockfish and Chs" off
90 "Liferea" off
91 "Newsboat" off
92 "Install graphne Theme" off
93 "Obsidian-2-gtk-theme" off
94 "Obsidian-icon-Theme" off
95 "Falkon Browser" off
96 "Kodi" off
97 "Awsom Vim Colorschemes" off
98 "ALL VIM plugins" off
99 "ALL NVIM PLUGINS" off)

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
	case $choice in
  1)
     #Github Script
     clear
     read -e -p "Run github Script   >>>   " -i 'Yes' fff
     if [[ $fff == 'Yes' ]]; then
     	sudo -u batan bash github.sh
     else
     	clear
     	echo "Script run Successfully... exited on user request.."
     	exit 0
     fi
     ;;
  2)
     #Install Ranger
     echo "Installing Ranger"
     apt-get install ranger
     ;;
  3)
     #Install Cmus
     echo "Installing Cmus"
     apt-get install  cmus
     ;;
  4)
     #flatpak
     echo "Installing flatpak & gnome-blah-blah-blah"
     apt-get install flatpak gnome-software-plugin-flatpak
     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
     ;;
  5)
     #Install git
     echo "Installing Git, please congiure git later..."
     apt-get install git
     ;;
  6)
     #Python3-pip
     echo "Installing python3-pip"
     apt-get install python3-pip
     ;;
  7)
     #taskwarrior
     echo "Installing taskwarrior"
     apt-get install taskwarrior
     ;;
  8)
     #Timewarrior
     echo "Installing Timewarrior"
     apt-get install timewarrior
     ;;
  9)
      #sweeper
      echo "Installing sweeper"
      apt-get install sweeper
      ;;
  10)
    #Ungoogled Chromium cloned uBlock
    echo "Installing Ungoogled-Chromium"
    sudo apt-get install mesa-vulkan-drivers mesa-vulkan-drivers:i386 libvulkan1 libvulkan1:i386 -y
    flatpak install io.github.ungoogled_software.ungoogled_chromium -y
    ;;
  11)
    #Installing i2p on Debian Buster or Later
    clear
    echo "Proceed with i2p installation on Deian Buster or later or its derivatives?"
    read -n1 -p 'Enter [ANY] to continue...   >>>   ' lol
    sudo apt-get update
    sudo apt-get install apt-transport-https lsb-release curl -y
    clear
    sudo apt install openjdk-17-jre -y
   udo tee /etc/apt/sources.list.d/i2p.list
    curl -o i2p-archive-keyring.gpg https://geti2p.net/_static/i2p-archive-keyring.gpg
    gpg --keyid-format long --import --import-options show-only --with-fingerprint i2p-archive-keyring.gpg
    sudo cp i2p-archive-keyring.gpg /usr/share/keyrings
    sudo apt-get update
    sudo apt-get install i2p i2p-keyring
    ;;
  12)
    #building firefox extantion
    ;;
  13)
    #Chromiun
    echo "Installing Chromium"
    apt-get install chromium
    ;;
  14)
    #Vit
    echo "Installing Vit"
    apt-get install vit
    ;;
  15)
    #Bitwarden
    echo "Installing Bitwarden"
    flatpak install flathub com.bitwarden.desktop
    ;;
  16)
    #Install Neovim
    echo "Installing Neovim"
    apt-get install neovim
    ;;
  17)
    #MEGAsync
    echo "Installing MEGAsync"
    flatpak install flathub nz.mega.MEGAsync
    ;;
  18)
    #Tutanota
    echo "Installing Numic Icons"
    flatpak install flathub com.tutanota.Tutanota
    ;;
  19)
    #Bleachbit
    echo "Installing BleachBit"
    apt-get install bleachbit
    ;;
  20)
    #Oolite
    echo "Installing Oolite"
    wget https://github.com/OoliteProject/oolite/releases/download/1.90/oolite-1.90.linux-x86_64.tgz
    tar -xvzf oolite-1.90.linux-x86_64.tgz
    ./oolite-1.90.linux-x86_64.run
    ;;
  21)
    #Musikcube
    wget https://github.com/clangen/musikcube/releases/download/0.98.0/musikcube_standalone_0.98.0_amd64.deb
    dpkg -i musikcube_standalone_0.98.0_amd64.deb
    apt-get install -f
    ;;
  22)
    #Browser-history
    echo "Installing Browser-History"
    pip3 install browser-history
    ;;
  23)
    #Castero
    echo "Installing Castero"
    pip3 install castero
    ;;
  24)
    #RTV
    echo "Installing RTV"
    pip3 install rtv
    rtv --copy-config
    rtv --copy-mailcap
    "oauth_client_id = E2oEtRQfdfAfNQ
    oauth_client_secret = praw_gapfill
    oauth_redirect_uri = http://127.0.0.1:65000/"
    ;;
  25)
    #Rainbow Stream
    echo "Installing Rainbow Stream"
    pip3 install rainbowstream
    ;;
  26)
    #eg
    echo "Installing eg!"
    pip3 install eg
    ;;
  27)
    #bpytop
    echo "Installing btop"
    pip3 install bpytop
    ;;
  28)
    #Openssh-server
    echo "Installing opensssh-server"
    apt-get install openssh-server
    ;;
  29)
    #openssh-client
    echo "Installing openssh-client"
    apt-get install openssh-client
    ;;
  30)
    #renameutils
    echo "Installing renameutils"
    apt-get install renameutils
    ;;
  31)
    #mat2
    echo "Installing mat2"
    apt-get install  mat2
    ;;
  32)
    #0AD
    echo "Installing Oad"
    apt-get install 0ad
    ;;
  33)
    #yt-dlp
    echo -e "\033[47mInstalling yt-dlp...\033[m0"
    apt-get install yt-dlp
    ;;
  34)
    #ffmpeg
    echo "Instaling ffmpeg"
    apt-get install  ffmpeg -y
    ;;
  35)
    #Install buku
    echo "Installing buku, bookmark manager"
    pip install buku
    ;;
  36)
    #Install Megatools
    echo "Installing Megatools"
    apt-get install megatools -y
    ;;
  37)
    #Install Bitwarden-cli
    echo "Installing bitwarden-cli"
    wget https://github.com/bitwarden/cli/releases/download/v1.0.1/bw-linux-1.0.1.zip
    unzip bw-linux-1.0.1.zip
    sudo install bw /usr/local/bin/
    ;;
  38)
    #intltool,gtk-4.9.4,autoconf,webkit2.40.5
    echo "Downloading intltool,gtk-4.9.4,auto-confi,webkit-gtk2.40.5"
    wget https://launchpadlibrarian.net/199705878/intltool-0.51.0.tar.gz &&
    wget https://gnome.mirror.digitalpacific.com.au/sources/gtk/4.9/gtk-4.9.4.tar.xz &&
    wget http://ftp.gnu.org/gnu/autoconf/autoconf-latest.tar.xz &&
    wget https://webkitgtk.org/releases/webkitgtk-2.40.5.tar.xz
    								;;
  39)
    #VS Code
   o "Installing Visul Code Studio"
   t https://az764295.vo.msecnd.net/stable/6c3e3dba23e8fadc360aed75ce363ba185c49794/code_1.81.1-1691620686_amd64.deb &&
    sudo apt-get install ./code_1.81.1-1691620686_amd64.deb
    															;;
  40)
    	#protonvpn stable
    	echo "Installing Repo Proton Stable"
   t https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb &&
    sudo apt-get install https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3_all.deb &&
    sudo apt-get update &&
    sudo apt-get install protonvpn-cli
    																									;;
  41)
    #stacer
    echo "Installing stacer and getting tired off repetitive tasks"
    apt-get install  stacer -y
    ;;
  42)
    #links2
    echo "Installing links2, have mercy"
    apt-get install  links2
    ;;
  43)
    #Install w3m
    echo "Installing w3m"
    apt-get install  w3m
    ;;

  44)
    #trash-cli
    echo "Installing trash-cli"
    apt-get install  trash-cli
    ;;
  45)
    #kdeconnect
    echo "Installing kde-connect with your mom"
    apt-get install  kdeconnect
    ;;
  46)
    #zsh
    echo "Installing more software you still dont know how to use, ZSH!"
    apt-get install  zsh
    ;;
  47)
    #ufw
    echo "WIth your browsing habits it will not make a difference, Installing ufw!"
    apt-get install  ufw
    ;;
  48)
    #guake
    echo "Installing guake"
    apt-get install  guake
    ;;
  49)
    #tmux
    echo "Installing yet another app you dont know how to use, tmux"
    apt-get install  tmux
    ;;
  50)
    #yad
    echo "It feels like, Installing the entire software repository, I mean yad"
    apt-get install  yad
    ;;
  51)
    #Nodau
    echo "Installing nodau"
    apt-get install nodau
    ;;
  52)
    #pwman3
    echo "Installing pwman3"
    apt-get install pwman3
    ;;
  53)
    #bwm-ng
    echo "Installing network monitor BWN-NG"
    apt-get install bwn-ng
    ;;
  54)
    #calcurse
    echo "Yet another fking calendar"
    apt-get install calcurse
    ;;
  55)
      #vnstat monitor
      echo :"Installing vnstat"
      apt-get install vnstat
      ;;

  56)
   #Install Vimwiki
   echo "Installing Vimwiki"
   mkdir /home/batan/.config/nvim/pack
   mkdir /home/batan/.config/nvim/pack/plugins/
   mkdir /home/batan/.config/nvim/pack/plugins/start
   git clone https://github.com/vimwiki/vimwiki.git /home/batan/.config/nvim/pack/plugins/start/vimwiki
   nvim -c 'helptags home/batan/.config/nvim/pack/plugins/start/vimwiki/doc' -c quit
   ;;
  57)
   #Install Vim-taskwarrior
   echo "Installing Vim-taskwarrior"
   git clone https://github.com/farseer90718/vim-taskwarrior ~/.config/nvim/pack/plugins/start/vim-taskwarrior
   ;;
  58)
   #Install Taskwiki
   echo "Installing Taskwiki"
   git clone https://github.com/tools-life/taskwiki.git /home/batan/.config/nvim/pack/plugins/start/taskwiki --branch dev
   nvim -c 'helptags /home/batan/.config/nvim/pack/plugins/start/taskwiki/doc' -c quit
   ;;
  59)
   #Install Tabular
   echo "Installing tagbar"
   git clone https://github.com/godlygeek/tabular.git /home/batan/.config/nvim/pack/plugins/start/tabular
   nvim -c 'helptags ~/.config/nvim/pack/plugins/start/vim-tabular/doc' -c quit
   ;;
  60)
   #Install Calendar
   echo "Installing Calendar-vim"
   git clone https://github.com/mattn/calendar-vim.git /home/batan/.config/nvim/pack/plugins/start/calendar-vim
   nvim -c 'helptags ~/.config/nvim/pack/plugins/start/calendar/doc' -c quit
   ;;
  61)
   #Install Tagbar
   echo "Installing Tagbar"
   git clone https://github.com/majutsushi/tagbar /home/batan/.config/nvim/pack/plugins/start/tagbar
   nvim -c 'helptags ~/.config/nvim/pack/plugins/start/tagbar/doc' -c quit
   ;;
  62)
   #Install Vim-plugin-AnsiEsc
   echo "Not sure why but am installing Vim-plugin-AmsiEsc"
   git clone https://github.com/powerman/vim-plugin-AnsiEsc /home/batan/.config/nvim/pack/plugins/start/vim-plugin-AnsiEsc
   nvim -c 'helptags /home/batan/.config/nvim/pack/plugins/start/vim-plugin-AnsiEsc/doc' -c quit
   ;;
  63)
   #Install table-mode
   echo "Installing Table-Mode"
   git clone https://github.com/dhruvasagar/vim-table-mode.git /home/batan/.config/nvim/pack/plugins/start/table-mode
   nvim -c 'helptags /home/batan/.config/nvim/pack/plugins/start/vim-table-mode/doc' -c quit
   ;;
  64)
   #vimoucompletme
   apt-get install vimoucompleteme -y
   ;;
  65)
   #deoplete
   echo "cloning a sheep deoplete"
   git clone https://github.com/Shougo/deoplete.nvim.git /home/batan/.config/nvim/pack/plugins/start/deoplete
   ;;
  66)
   #emmet-vim
   echo "Installing emmet-vim"
   git clone https://github.com/mattn/emmet-vim.git /home/batan/.config/nvim/pack/plugins/start/emmet-vim
   ;;
  67)
   #ale
   echo "Installing ALE"
   git clone https://github.com/dense-analysis/ale.git /home/batan/.config/nvim/pack/plugins/start/ale
   ;;
  68)
   #html5.vim
   echo "Installing html5.vim"
   git clone https://github.com/othree/html5.vim.git /home/batan/.config/nvim/pack/plugins/start/html5.vim
   ;;
  69)
   #surround-vim
   echo "installing surround-vim"
   git clone https://github.com/tpope/vim-surround.git /home/batan/.config/nvim/pack/plugins/start/surround-vim
   ;;
  70)
   #vim-lsp
   echo "Installing Vim-Lsp"
   git clone https://github.com/prabirshrestha/vim-lsp /home/batan/.config/nvim/pack/plugin/start/vim-lsp.git
   ;;
  71)
   #vim-lsp
   echo "Installing Vim-Lsp-Ale"
   git clone https://github.com/rhysd/vim-lsp-ale.git /home/batan/.config/nvim/pack/plugin/start/vim-lsp-ale.git
   ;;
  72)
   #Prettier
   echo "Installing Prettier"
   git clone https://github.com/prettier/prettier.git ~/.config/nvim/pack/plugins/start/prettier/
   ;;
  73)
   #Unite.vim
   echo "Installing Unite.vim"
   git clone https://github.com/Shougo/unite.vim.git ~/.config/nvim/pack/plugins/start/unite.vim
   ;;
  74)
   #Turtle Note
   echo "Downloading Turtle Note. Dont forget to install manually"
   ;;
  75)
   #Megasync
   echo "Downloading Megasync from homepage"
   wget https://mega.nz/linux/repo/xUbuntu_23.04/amd64/megasync-xUbuntu_23.04_amd64.deb && sudo apt-get install "$PWD/megasync-xUbuntu_23.04_amd64.deb"
   ;;
  76)
   	#speedread
   	echo "Cloning text reader for dyslexic linux users"
   	git clone https://github.com/pasky/speedread.git
   	;;
  77)
   	#shalarm
   	echo "Cloning shalarm"
   	git clone https://github.com/jahendrie/shalarm.git
   	;;
  78)
   	#speedtest-cli
   	echo "Installing speedtest-cli, you are with telstra, only god knows why you need this tool!"
   	apt-get install speedtest-cli
   	;;
  79)
   	#festival
   	echo "Installing festival"
   	apt-get install festival
   	;;
  80)
   	#Espeak
   	echo "Installing espeak"
   	apt-get install espeak
   	;;
  81)
     #Terminor
     echo "Installing Terminator"
     apt-get install festvox-us-slt-hts
     ;;
  82)
  	#Festvox-us-slt-hts
  	echo "Installing Festvox-us"
  	sudo apt-get install festvox-us-slt-hts
  	;;
  83)
  	#fzf
  	echo "Installing fzf"
  	sudo apt-get install fzf
  	;;
  84)
  	#rofi
  	echo "Installing rofi"
  	sudo apt-get install rofi
  	;;
  85)
  	#ddgr
  	echo "Installing ddgr"
  	sudo apt-get install ddgr
  	;;
  86)
  	#tldr
  	echo "Installing tldr"
  	sudo apt-get install tldr
  	;;
  87)
  	#Protovpn Stable
  	echo "installing ProtonVPN-stable"
  	wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-2_all.deb
  	sudo apt-get install ./protonvpn-stable-release_1.0.3-2_all.deb
  	;;
  88)
  	#Ctags
  	echo "Installing Exuberant Ctags"
  	sudo apt-get install exuberant-ctags
  	;;
  89)
  	#Chs and Stockfish
  	echo "Installing stockfish and chs"
  	pip3 install chs
  	sudo apt-get install stockfish
  	pipx install chs
  	;;
  90)
  	#Liferea
  	echo "Installing Liferea"
  	sudo apt instlal liferea
  	;;
  91)
  	#Newsboat
  	echo "Installing Liferera"
  	sudo apt-get install newboat
  	;;
  92)
  	#Install Graphne Theme
  	git clone https://github.com/vinceliuice/Graphite-gtk-theme.git
  	cd Graphite-gtk-theme
  	./install.sh
  	cd
  	;;
  93)
  	#Obsidian Theme
  	echo "Installing Obsidian Theme...!"
  	apt-get install obsidian-2-gtk-theme
  	;;
  94)
  	#Obsidian Icon Theme
  	echo "Installing Obsidian-Icon-Theme"
  	apt-get install obsidian-icon-theme
  	;;
  95)
  	#Falkon
  	echo "Installing falkon browser"
  	apt-get install falkon
  	;;
  96)
  	#Kodi
  	echo "Installing Kodi and Repos"
  	apt-get install kodi kodi-repository-kodi
  	;;
  97)
 	 #Awsom Vim COlorschemes
 	 echo "Cloning Awsom VIm Colorscheems"
 	 git clone https://github.com/rafi/awesome-vim-colorschemes.git /home/batan/.config/nvim/pack/plugins/start/awsome-vim-colorschemes
  	;;
  98)
 	 #VIM PLUGINS
 	 echo "Installing all VIM Plugins"
 	 git clone https://github.com/vimwiki/vimwiki.git /home/batan/.vim/pack/plugins/start/vimwiki
 	 git clone https://github.com/farseer90718/vim-taskwarrior /home/batan/.vim/pack/plugins/start/vim-taskwarrior
 	 git clone https://github.com/tools-life/taskwiki.git /home/batan/.vim/pack/plugins/start/taskwiki --branch dev
 	 git clone https://github.com/godlygeek/tabular.git /home/batan/.vim/pack/plugins/start/tabular
 	 git clone https://github.com/mattn/calendar-vim.git /home/batan/.vim/pack/plugins/start/calendar-vim
 	 git clone https://github.com/majutsushi/tagbar /home/batan/.vim/pack/plugins/start/tagbar
 	 git clone https://github.com/powerman/vim-plugin-AnsiEsc /home/batan/.vim/pack/plugins/start/vim-plugin-AnsiEsc
 	 git clone https://github.com/dhruvasagar/vim-table-mode.git /home/batan/.vim/pack/plugins/start/table-mode
 	 git clone https://github.com/Shougo/deoplete.nvim.git /home/batan/.vim/pack/plugins/start/deoplete
 	 git clone https://github.com/mattn/emmet-vim.git /home/batan/.vim/pack/plugins/start/emmet-vim
 	 git clone https://github.com/dense-analysis/ale.git /home/batan/.vim/pack/plugins/start/ale
 	 git clone https://github.com/othree/html5.vim.git /home/batan/.vim/pack/plugins/start/html5.vim
 	 git clone https://github.com/tpope/vim-surround.git /home/batan/.vim/pack/plugins/start/surround-vim
 	 git clone https://github.com/prabirshrestha/vim-lsp /home/batan/.vim/pack/plugin/start/vim-lsp.git
 	 git clone https://github.com/rhysd/vim-lsp-ale.git /home/batan/.vim/pack/plugin/start/vim-lsp-ale.git
 	 git clone https://github.com/prettier/prettier.git /home/batan/.vim/pack/plugins/start/prettier/
 	 git clone https://github.com/Shougo/unite.vim.git /home/batan/.vim/pack/plugins/start/unite.vim
 	 git clone https://github.com/rafi/awesome-vim-colorschemes.git /home/batan/.vim/pack/plugins/start/awsome-vim-colorschemes
  	;;
  99)
     #NVIM PLUGINS
     echo "Installing all NVIM Plugins"
     git clone https://github.com/vimwiki/vimwiki.git /home/batan/.config/nvim/pack/plugins/start/vimwiki
     git clone https://github.com/farseer90718/vim-taskwarrior /home/batan/.config/nvim/pack/plugins/start/vim-taskwarrior
     git clone https://github.com/tools-life/taskwiki.git /home/batan/.config/nvim/pack/plugins/start/taskwiki --branch dev
     git clone https://github.com/godlygeek/tabular.git /home/batan/.config/nvim/pack/plugins/start/tabular
     git clone https://github.com/mattn/calendar-vim.git /home/batan/.config/nvim/pack/plugins/start/calendar-vim
     git clone https://github.com/majutsushi/tagbar /home/batan/.config/nvim/pack/plugins/start/tagbar
     git clone https://github.com/powerman/vim-plugin-AnsiEsc /home/batan/.config/nvim/pack/plugins/start/vim-plugin-AnsiEsc
     git clone https://github.com/dhruvasagar/vim-table-mode.git /home/batan/.config/nvim/pack/plugins/start/table-mode
     git clone https://github.com/Shougo/deoplete.nvim.git /home/batan/.config/nvim/pack/plugins/start/deoplete
     git clone https://github.com/mattn/emmet-vim.git /home/batan/.config/nvim/pack/plugins/start/emmet-vim
     git clone https://github.com/dense-analysis/ale.git /home/batan/.config/nvim/pack/plugins/start/ale
     git clone https://github.com/othree/html5.vim.git /home/batan/.config/nvim/pack/plugins/start/html5.vim
     git clone https://github.com/tpope/vim-surround.git /home/batan/.config/nvim/pack/plugins/start/surround-vim
     git clone https://github.com/prabirshrestha/vim-lsp /home/batan/.config/nvim/pack/plugin/start/vim-lsp.git
     git clone https://github.com/rhysd/vim-lsp-ale.git /home/batan/.config/nvim/pack/plugin/start/vim-lsp-ale.git
     git clone https://github.com/prettier/prettier.git /home/batan/.config/nvim/pack/plugins/start/prettier/
     git clone https://github.com/Shougo/unite.vim.git /home/batan/.config/nvim/pack/plugins/start/unite.vim
     ;;


																														esac
																													done
	fi


#}}}
#{{{>>>   lc-snapshot

for packages in ${DEPS_LC_SNAPSHOT[@]}; do

dpkg -s $packages >/dev/null 2>&1
if [[ $? == '1' ]];then
echo -e "Missing dependency \033[31m${packages}\033[0m being installed..."
sudo apt install $packages > /dev/null 2>&1
fi
done

#   Add New User
sudo useradd $newuser -m -r
sudo echo $newuser:$password | sudo chpasswd
$(groups|sed 's/ /,/g'|sed 's/^/sudo usermod -aG /g'|sed 's/$/ $newuser/g')
echo "$newuser ALL=(ALL:ALL) NOPASSWD:ALL"|sudo EDITOR='tee -a' visudo

#   Create ISO with Newly created user
su - $newuser -c "sudo mx-snapshot --cli -o -z lz4 -l -Xhc -x Desktop -x Documents -x Downloads -x Music -x Networks -x Pictures -x Steam -x Videos -x VirtualBox -d /home/lc-back -f $iiso"


#}}}
#{{{>>>   fin.github.sh
#}}}


