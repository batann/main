!/bin/bash
# vim:fileencoding=utf-8:foldmethod=marker


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

DEPS_FORM="xdotool dialog yad zenity wmctrl smenu megatools git curl wget"

DEPS_FLUX="fluxbox idesk mx-fluxbox gkrellm mxfb-docs   mx-fluxbox-data mxfb-accessories wmalauncher  lxappearance  rofi-calc custom-toolbox roxterm feh"

DEPS_BOXES="gnome-boxes qemu-system-x86 libvirt-daemon-driver-lxc libvirt-daemon-driver-vbox libvirt-daemon-driver-xen netcat-openbsd tracker-miner-fs qemu-system-gui qemu-utils ovmf ibverbs-providers"

DEPS_LAMP="apache2 apache2-utils curl mariadb-server mariadb-client php libapache2-mod-php php-mysql php-common php-cli php-common php-opcache php-xml php-yaml php-readline php-fpm php-gd php-mbstring php-curl php-zip"

DEPS_CODIUM="apt-transport-https codium"
#https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium/main amd64 codium amd64 1.95.2.24313

DEPS_NVIM="wget curl git build-essential libtool libtool-bin autoconf cmake g++ pkg-config unzip ninja-build gettext libncurses5-dev libgnome2-dev libgnomecanvas2-dev libx11-dev libxt-dev python3-dev ruby-dev lua5.1.0-dev liblua5.1-0-dev python3-pynvim"

DEPS_i3="i3 i3status i3lock dunst picom cava xfce4-terminal stterm suckless-tools rofi surf thunar xterm pavucontrol sox libsox-fmt-all alsa-utils i3status wmctrl xdotool xorg xinit x11-xserver-utils pulseaudio pulseaudio-utils network-manager network-manager-gnome fonts-font-awesome arandr feh lxappearance xarchiver lightdm lightdm-gtk-greeter policykit-1-gnome software-properties-gtk apt-transport-https curl wget git firefox-esr thunar-archive-plugin thunar-volman thunar-media-tags-plugin gvfs gvfs-backends xbacklight acpi acpid notification-daemon libnotify-bin volumeicon-alsa vim htop neofetch python3-pip nmcli arj lbzip2 lhasa liblz4-tool lrzip lzip lzop ncompress pbzip2 pigz plzip rar unar"

DEPS_TREES="clang libclang-dev cmake make nodejs python3-setuptools python3-pynvim"

DEPS_DOCKER="docker.io"

DEPS_MPD="mpd ncmpcpp wildmidi pulseaudio cava"

PIPX_PACKAGES="edge-tts pynvim pyxtermjs casero eg browser-history rtv rainbowstream yt-dlp"

FLATPAK_PACKAGES="io.github.ungoogled_software.ungoogled_chromium"

DEPS_MEGA="megatools"

DEPS_SURF="build-essential git intel-media-va-driver libcairo2-dev libfreetype-dev libfribidi-dev libgcr-3-dev libgdk-pixbuf2.0-dev libgles2-mesa libgtk-3-dev libharfbuzz-dev libpango1.0-dev libsqlite3-dev libvpx-dev libwebkit2gtk-4.0-dev libxml2-dev pkg-config x11-utils"

DEPS_DOCKER_UBUNTU="docker.io docker-compose docker-clean docker-buildx docker-doc docker
ca-certificates curl gnupg lsb-release"

DEPS_DOCKER_DEBIAN="docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin ca-certificates curl gnupg lsb-release"

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
#{{{>>>   Add MX,Cubic,Libewolf,Liqorix,I2p,Docker - REPO
sudo tar vfcz /home/$USER/apt-conf-backup.tar.gz /etc/apt/*
git clone https://github.com/batann/lc-repo.git
sudo rm lc-repo/images lc-repo/README.md
sudo cp -r lc-repo/* /etc/apt/
sudo rm -rf lc-repo
fi
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
#{{{>>>   Setup MEGACLOUD Dot Config and Bin files
BASEMEGADIR="/home/batan/.config"
for i in ${DEPS_MEGA[@]};
do
	dpkg -s $i>/dev/null
	if [[ $? !== "0" ]];
	then
		sudo apt install $i -y
	fi

cat<< 'EOL'>/home/batan/.megarc
[Login]
Username=tel.petar@gmail.com
Password=Ba7an?12982
EOL
mkdir $BASEMEGADIR/dot
mkdir $BASEMEGADIR/bin
mkdir $BASEMEGADIR/homepage
mkdir $BASEMEGADIR/vimwiki
DOTDIR="/home/batan/.config/dot"
BINDIR="/home/batan/.config/bin"
megacopy -l $BASEMEGADIR/dot -r /Root/dot --download
megacopy -l $BASEMEGADIR/bin -r /Root/bin --download
megacopy -l $BASEMEGADIR/homepage -r /Root/homepage --download
megacopy -l $BASEMEGADIR/vimwiki -r /Root/vimwiki --download
clear
# apply the downlaoded dot files
for i in $(ls /home/batan/.config/dot);
do
	if [[ -d /home/batan/.$i ]];
	then
		mv /home/batan/.$i /home/batan/.$i.bak
	fi
	cp /home/batan/.config/dot/$i /home/batan/.$i
echo -e "\033[33mCopied /home/batan/.config/dot/$i to /home/batan/.$i"
done
echo -e"\033[34m===========================================\033[0m"
#apply new bin files systemwide
for i in $(ls /home/batan/.config/bin);
do
	sudo cp /home/batan/.config/bin/$i /usr/bin/$i
echo -e "\033[33mCopied /home/batan/.config/bin/$i to /usr/bin/$i"
done
echo -e"\033[34m===========================================\033[0m"

fi




#}}}
#{{{###   Setup a Desktop Environments i3,feg,xfce4

if [[ $DESKT == 'i3' ]]; then

# Silently check if any dependencies are installed and install them if not
for dep in $DEPS_i3; do
	if ! dpkg -s $dep >/dev/null 2>&1; then
		echo "Installing \033[34m$dep...\033[0m"
		sudo apt-get install -y $dep
	fi
done

# modify bash_profile after checking if it has already been modified
grep -qxF "exec startx" ~/.bash_profile || echo "if [[ -z \$DISPLAY ]] && [[ \$(tty) = /dev/tty1 ]]; then exec startx; fi" >> ~/.bash_profile

	clear
elif [[ $DESKT == 'Fluxbox' ]]; then
	clear
	echo "In Progress"
elif [[ $DESKT == 'xfce4' ]]; then
clear
echo "In Progress"
fi


#}}}
#{{{###   Setup Distrobox

fi

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

fi
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
NEXTCLOUD_DIR="/var/www/html/nextcloud"
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

fi
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

fi
#}}}
#{{{>>>   Install GNOME-BOXES
clear
for i in ${DEPS_BOXES[@]};
do
	dpkg -s $i>/dev/null
	if [[ $? != "0" ]];
	then
		sudo apt install $i -y
		fi
done

fi
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

fi
#}}}
#{{{###   Clone surf Giithub repo and build surf

sudo apt install $DEPS_SURF
clear
git clone https://github.com/batann/surf.git
cd surf
for i in $(ls patches); do patch -p1 patches/$i ;done

fi
#}}}
#{{{>>>   Install neovim with codium autocompleation

# Install neovim with codium autocompleation
clear
echo -e "\033[44m\033[30mInstalling neovim with codium autocompleation\033[0m"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
git clone https://github.com/Exafunction/codeium.vim ~/.config/nvim/pack/Exafunction/start/codeium.vim

# Create init.vim file

cat << 'EOL' > /home/batan/.config/nvim/init.vim.codium
"# Codium Config
#disable default keybindings
vim.g.codeium_disable_bindings = 1
#disable codium by default
vim.g.codeium_enabled = false
#show codium in status line
vim.api.nvim_call_function("codeium#GetStatusString", {})
EOL

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

elif [[ $DISTRO == "Arch" ]]; then


fi


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

fi

fi
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

fi
#}}}
#{{{>>>   Install Custom Plymouth
DIR_ANON="/home/batan/anon"

if [[ ! -d $DIR_ANON ]];
	them
	mkdir -p $DIR_ANON
	megacopy -l $DIR_ANON -r /Root/anon --download
	cd /home/batan/
if [[ ! -d /usr/share/plymouth/themes/ ]];
then
	mkdir -p /usr/share/plymouth/themes
fi
sudo mv anon /usr/share/plymouth/themes/
cd /usr/share/plymouth/themes
sudo plymouth-set-default-theme -R anon
sudo update-initramfs -u
sudo update-grub2

fi
#}}}
#{{{>>>   Install Nix Package manager
curl -L https://nixos.org/nix/install | sh
sudo echo " . /home/$USER/.nix-profile/etc/profile.d/nix.sh" >> .bashrc
source .bashrc

fi
#}}}








#{{{   TO ADD TO 2.main 
#CLEAEN UP FUNCTION
#CREATE ISO FUNCTION
#BACKUP CRITICAL DIRECTORIES


#!/bin/bash
#Ultimate lceaner for Linux by batan
# vim:fileencoding=utf-8:foldmethod=marker
tput civis

#{{{###   VARIABLES
dependencies="bleachbit sweeper rename"

extentions="*.part .*.bak.* *.org *.bakup *.backup.* *.tmp.* *.tmp *.ytp.* *.st *.tmp.*.swp *.ytdl .*.part .*.bak..* .*.org .*.bakup .*.backup.* .*.tmp.* .*.tmp .*.ytp.* .*.st .*.tmp .*.swp .*.ytdl"
cleaners=" apt.autoclean apt.autoremove apt.clean apt.package_lists bash.history chromium.cache chromium.cookies chromium.dom chromium.form_history chromium.history chromium.passwords chromium.search_engines chromium.session chromium.site_preferences chromium.sync chromium.vacuum deepscan.backup deepscan.ds_store deepscan.thumbs_db deepscan.tmp deepscan.vim_swap_root deepscan.vim_swap_user filezilla.mru firefox.backup firefox.cache firefox.cookies firefox.crash_reports firefox.dom firefox.forms firefox.passwords firefox.session_restore firefox.site_preferences firefox.url_history firefox.vacuum flash.cache flash.cookies nautilus.history rhythmbox.cache rhythmbox.history sqlitet.history system.cache system.clipboard system.custom system.desktop_entry system.localizations system.memory system.recent_documents system.rotated_logs system.tmp system.trash transmission.blocklists transmission.history transmission.torrents vim.history vlc.memory_dump vlc.mru wine.tmp winetricks.temporary_files x11.debug_logs"
if [[ ! -d /home/baran/SH ]];
then
	mkdir /home/batan/SH
fi




#}}}
#{{{###   FUNCTIONS
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
#}}}
#{{{###   DRAW A TODO LIST
#!/bin/bash
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



#tput cup 53 0
#for i in $(seq 29 47)
#do
#	sleep 0.5
#	tput cup $(( i += 1 )) 38
#	echo -e $K
#done

#}}}
#{{{###   MAIN SCRIPT


#for i in ${extentions[@]}; do rm $i;done >/dev/null 2>&1

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
tput cup 29 0
echo -e "    DONE! Script run Successsfully "
tput cup 50 0
echo -e "         \033[47m\033[30mPress [ANY] to Exit...\033[0m"
read -n1 xxx
tput cnorm

#}}}




#}}}
