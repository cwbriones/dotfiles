rgvi() {
    # CHOICE=$(rg -il $@ | fzf -0 -1 --ansi --preview "bat --color=always --style='numbers,header' {} | rg $@ --context 3" )
    CHOICE=$(rg -il $@ | fzf -0 -1 --ansi --preview "cat {} | rg $@ --context 3" )
    if [[ ! -z $CHOICE ]]; then
        /usr/local/bin/nvim "+/$@" $CHOICE
    fi
}

export FZF_DEFAULT_COMMAND='rg --files --hidden'
