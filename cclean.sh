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

