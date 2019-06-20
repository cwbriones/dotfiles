# Controlling light/dark theme based on OS theme
if defaults read -g AppleInterfaceStyle &> /dev/null; then
    export DARK_MODE=1
elif [[ $ITERM_PROFILE = "darktheme" ]]; then
    export DARK_MODE=1
else
    export DARK_MODE=0
fi

dark() {
    export DARK_MODE=1
    echo -e '\033]50;SetProfile=darktheme\a'
}

lightmode() {
    export DARK_MODE=0
    echo -e '\033]50;SetProfile=lighttheme\a'
}
