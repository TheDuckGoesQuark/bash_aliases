alias uni='cd ~/Documents/Uni; ls -1;';
alias matlab='matlab -nodesktop -nosplash';
alias python='python3';
alias sshuni='ssh jm354@jm354.host.cs.st-andrews.ac.uk';

function metasploitswitch() {
	if [ -z "$1" ]
	then
		echo "Options are either 'start', 'stop', or 'restart'"
		return 1
	else
		sudo bash /opt/metasploit/ctlscript.sh "$1"
	fi
}

function files() {
	if [ -z "$1" ]
	then
		xdg-open .
	else
		xdg-open $1
	fi
}

function aptEverything() {
	sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
	sudo apt-get autoremove && sudo apt-get autoclean
}

function lazygit() {
	# Commit with message
	git add .
	git commit -a -m "$1"
	# Add tag if present
	[[ ! -z "$2" ]] && git tag "$2"
	# Push
	git push
}

