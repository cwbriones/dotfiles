alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

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
alias weather='curl http://wttr.in\?1q'
alias moon='curl http://wttr.in/Moon'
alias git='noglob git'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
