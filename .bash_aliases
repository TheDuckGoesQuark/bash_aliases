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

function mysqlswitch() {
	if [ -z "$1" ]
	then
		echo "Options are either 'start', 'stop', or 'restart'"
		return 1
	else
		service mysql "$1"
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
	[ -d ".git" ] || git rev-parse --git-dir > /dev/null 2>&1
	if [ $? -ne 0  ]; then
		echo "Not in git repository!"
		return 1
	fi

	commitMessage="$1"
	if [[ -z "${commitMessage}" ]]; then
		echo "No commit message supplied!"
		return 1
	fi

	# Commit with message
	git add .
	git commit -a -m "${commitMessage}"
	# Add tag if present
	[[ ! -z "$2" ]] && git tag "$2"
	# Push
	git push
}

