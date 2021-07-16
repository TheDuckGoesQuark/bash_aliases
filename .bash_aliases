alias matlab='matlab -nodesktop -nosplash';
alias python='python3';
alias latexmk='latexmk -pdf -pvc';
alias copy_template='cp -r ~/Templates/report .';
alias stfuintellij='ibus-daemon -rd';
alias ll='ls -l -a';

MACHINE_TYPE_MAC='MacOS';
MACHINE_TYPE_LINUX='Linux';
MACHINE_TYPE_OTHER='Other';

function getMachineType() {
    case "$(uname -s)" in
       Darwin)
         echo ${MACHINE_TYPE_MAC}
         ;;

       Linux)
           echo ${MACHINE_TYPE_LINUX}
         ;;

       *)
         echo ${MACHINE_TYPE_OTHER}
         return -1;
         ;;
    esac

    return 0
}

function ytdl() {
	url=$1
	flags="${@:2}"
	youtube-dl $url --cookies ~/Downloads/cookies.txt $flags
}

function pipInstallSave() {
    pip install $1 && pip freeze | grep $1 >> requirements.txt
}

function files() {
    machine="$( getMachineType )"
    case ${machine} in 
        $MACHINE_TYPE_MAC)
            command='open'
            ;;

        $MACHINE_TYPE_LINUX)
            command='xdg-open'
            ;;
        *)
            command=''
            ;;
    esac

    if [ -z "$1" ]
    then
    	eval "${command} . " > /dev/null 2>&1 &
    else
    	eval "${command} $1" > /dev/null 2>&1 &
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

function printTarContents() {
	tar -tf $1
}

