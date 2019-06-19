path=(
    # Homebrew executables
    # The output of this (slow) command:
    # $(brew --prefix coreutils)/libexec/gnubin
    # /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/bin
    /usr/local/sbin
    # Standard locations
    $DOTFILES/bin
    $HOME/bin
    $HOME/.local/bin
    # Rust executables
    $HOME/.cargo/bin
    # Go executables
    $GOPATH/bin
    # JS executables
    $HOME/.config/yarn/global/node_modules/.bin
    $HOME/.poetry/bin
    $path
)

# de-dupe
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
