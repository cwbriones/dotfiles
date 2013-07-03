force_color_prompt=yes
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/games/bin

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias own='sudo chown ${USER}:${USER-GROUP}'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# clear; echo -e "This terminal is\n         FABULOUS" | toilet -f small --gay

clear
date +%H:%M:%S | figlet -c | lolcat
fortune | cowsay | lolcat
