#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/christian.briones/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='nvim'
export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk

path=(
    $(pyenv root)/shims
    $(brew --prefix coreutils)/libexec/gnubin
    /usr/local/bin
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $path
)

export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export DEP_OPENSSL_INCLUDE=/usr/local/opt/openssl/include
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_GITHUB_API_TOKEN="8b80e1ef79514232371552dce1c686c51754764d"
export PYTHONDONTWRITEBYTECODE=1
export GIT_PS1_SHOWDIRTYSTATE=1

ulimit -n 4096

alias clip='xclip -selection c'
alias own='sudo chown -R ${USER}:${USER-GROUP}'
alias lsdir='ls -d */'
alias tmux='tmux -2'
alias archey='archey --color'
alias hist='history | grep'
alias alldirs='tree -fdi'
alias spot='mdfind -onlyin .'
alias now='gdate +"%s%3N"'
alias datetime='gdate -Ru'
alias vi='nvim'
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'
alias weather='curl http://wttr.in/98107?0'
alias moon='curl http://wttr.in/Moon'
alias git='noglob git'

alias ls='ls --color=tty'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export VIRTUAL_ENV_DISABLE_PROMPT=1
function cd {
    builtin cd "$@"
    if [ -d "venv" ] ; then
        source venv/bin/activate
    fi
}

eval "$(jenv init -)"
export JAVA_HOME="$(jenv javahome)"

APPENGINE_HOME=/Users/christian.briones/Snapchat/appengine-java-sdk-1.9.49/
GOOGLE_CLOUD_SDK=/Users/christian.briones/Snapchat/Dev/google-cloud-sdk
export GAE_SDK_ROOT="$GOOGLE_CLOUD_SDK/platform/google_appengine"
export PYTHONPATH="$GAE_SDK_ROOT:.:$PYTHONPATH"

MANPATH=/usr/local/opt/coreutils/libexec/gnuman:

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/christian.briones/Snapchat/Dev/google-cloud-sdk/path.zsh.inc' ]; then
    source '/Users/christian.briones/Snapchat/Dev/google-cloud-sdk/path.zsh.inc';
fi

