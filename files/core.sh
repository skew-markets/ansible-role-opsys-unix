# --------------------------------
# ansible managed bash include file
# --------------------------------

set -o vi
export LC_COLLATE=C # treat A and a differently as only right and proper

dirs="${HOME}/bin"
for dir in $dirs; do
	if  [[ -d "$dir" ]]; then
		export PATH=${PATH}:${dir}
	fi
done

# --------------------------------

fname=~/.Xmodmap
if [[ -r "$fname" ]]; then
	xmodmap $fname 2> /dev/null
	alias keys="xmodmap $fname"
fi

alias  _ls='/bin/ls -C --color'
alias   ls='_ls'
alias   l1='_ls -1'
alias   la='_ls -a'
alias   ll='_ls -l'
alias   LL='_ls -lL'
alias  lla='_ls -la'
alias llrt='_ls -lrt'

# unalias rm
alias     c='cat'
alias    ch='cat handy'
alias   cls='clear'
alias   dfs='df | grep -v /dev/loop'
alias  senv='env | sort'
alias     h='history'
alias     m='less'
alias   psa='/bin/ps -elf'
alias    rm='/bin/rm'
alias     v='vim'
alias    vh='vim handy'
alias    ro='vim -R'
alias    xt='xterm > /dev/null 2>&1 &'
 
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
 
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias  grep='grep  --color=auto'
alias igrep='grep -i'
alias vgrep='grep -v'
alias     g='grep'

function gralias {
    alias | grep -i ${1:-"NotOnYourNelly"} | sort
}

function gralias2 {
    alias | sed 's/=/ /' | grep -i ${1:-'NotOnYourNelly'} | sort
}

function grenv {
    env | grep -i ${1:-'NotOnYourNelly'} | sort
}

function grenv2 {
    env | sed 's/=/ /' | grep -i ${1:-'NotOnYourNelly'} | sort
}

function xgrep {
    defpath=$(pwd)
    if [[ -n "$1" ]]; then
        grep -i --exclude-dir=.git --exclude-dir=venv -r "$1" "${2:-$defpath}"
    else
        echo "Usage: xgrep 'string' [path]"
    fi
}

function sshgrep {
	grep -v '^#' ~/.ssh/config | grep -i -A4 $1
}

# --------------------------------

alias  qbin='cd ~/bin'
alias  qetc='cd ~/etc'
alias  qsrc='cd ~/src'
alias   qcc='cd ~/src/codecommit'
alias qwork='cd ~/work'
alias  qvar='cd ~/var'

# --------------------------------

alias m1='_m1=$(pwd)'
alias m2='_m2=$(pwd)'
alias m3='_m3=$(pwd)'
alias j1='cd ${_m1:-.}'
alias j2='cd ${_m2:-.}'
alias j3='cd ${_m3:-.}'

# --------------------------------

function xpand {
	echo $1 | tr ':' '\n'
}

function mighandy {
    mkdir -p ~/etc/handy.d/
	if [[ -r ~/etc/misc/handy ]]; then
		mv ~/etc/misc/handy ~/etc/handy.d/default.txt
	else
    	touch ~/etc/handy.d/default.txt
	fi
}

function handy {
    seek=${1:-'.*'}
    grep -i "$seek" ~/etc/handy.d/*.txt
}

function vhandy {
	fname=~/etc/handy.d/${1:-'default'}.txt
	vi $fname
}


# --------------------------------

alias genpass='makepasswd --chars=16 --crypt'

# --------------------------------
