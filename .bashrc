# Color defines to use elsewhere
Reset='\e[0m\]'            # Text Reset
# High Intensty
Black='\e[0;90m'       # Black
Red='\e[0;91m'         # Red
Green='\e[0;32m'       # Green
Yellow='\e[0;93m'      # Yellow
Blue='\e[0;94m'        # Blue
Purple='\e[0;95m'      # Purple
Cyan='\e[0;96m'        # Cyan
White='\e[0;97m'       # White

export EDITOR='vim'

# huge history!
export HISTFILESIZE=1000000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%F %T "
export TERM=xterm-color
shopt -s cmdhist
shopt -s histappend

# Local binaries built will be in ~/usr
if [[ -d ~/usr/bin ]]; then
    export PATH=~/usr/bin:$PATH
fi

if [[ -d ~/usr/local/bin ]]; then
    export PATH=~/usr/local/bin:$PATH
fi

# Source a platform specific bashrc
if [[ -f .bashrc.$(uname) ]]; then
    source .bashrc.$(uname)
fi

# IF the local system has bashrc changes include them
if [[ -f .bashrc.local ]]; then
    source .bashrc.local
fi

# Convenient way to view $PATH
function path () {
    echo $PATH | tr : '\n'
}

# For __git_ps1
if [[ -f ~/.git-prompt.sh ]]; then
    source ~/.git-prompt.sh
fi

export PS1="\[$Green\]\u@\h \[$Blue\]\w\[$Purple\]\$(__git_ps1)\[$White\] $ "
