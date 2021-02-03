#!/usr/bin/fish

abbr own 'sudo chown -R $USER:$USER-GROUP'
abbr lsdir 'ls -d */'
abbr tmux 'tmux -2'
abbr hist 'history | rg'
abbr now 'gdate +"%s%3N"'
abbr datetime 'gdate -Ru'
abbr vi 'nvim'
abbr weather 'curl http://wttr.in/98107\?0Q'
abbr forecast 'curl http://wttr.in/98107'
abbr moon 'curl http://wttr.in/Moon'
abbr vi nvim

abbr grep 'grep --color auto'
abbr fgrep 'fgrep --color auto'
abbr egrep 'egrep --color auto'

set -Ux EDITOR 'nvim'
set -Ux HOMEBREW_NO_ANALYTICS 1
set -Ux NVIM_TUI_ENABLE_TRUE_COLOR 1
set -Ux DEP_OPENSSL_INCLUDE /usr/local/opt/openssl/include
set -Ux OPENSSL_INCLUDE_DIR /usr/local/opt/openssl/include
set -Ux PYTHONDONTWRITEBYTECODE 1
set -Ux VIRTUAL_ENV_DISABLE_PROMPT 1
set -Ux PROMPT_EOL_MARK ""
set -Ux BAT_THEME "gruvbox"
set -Ux PROJECTS "$HOME/dev"
set -Ux GOPATH "$PROJECTS/go"
set -Ux FZF_DEFAULT_COMMAND "rg --files"
set -U virtualenv_wrapper_dir "$HOME/.venvs"

ulimit -n 4096

set -Up fish_user_paths /usr/local/bin\
    # Homebrew executables
    # The output of this (slow) command:
    # $(brew --prefix coreutils)/libexec/gnubin
    #
    # Disabled due to some mac command line tool collisions
    # /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/bin\
    /usr/local/sbin\
    # Standard locations
    $DOTFILES/bin\
    $HOME/bin\
    $HOME/.local/bin\
    # Rust executables
    $HOME/.cargo/bin\
    # Go executables
    $GOPATH/bin\
    # JS executables
    $HOME/.config/yarn/global/node_modules/.bin\
    # Python executables
    $HOME/.poetry/bin

# dedupe on reinstall
set -U fish_user_paths (printf '%s\n' $fish_user_paths | awk '!x[$0]++')

# Manpath has some issues with how fish processes ':'. It *MUST* end with a colon.
# set -Ux MANPATH (printf '%s\n' $MANPATH | uniq)
# MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
