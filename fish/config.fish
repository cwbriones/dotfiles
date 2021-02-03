# =========================================================
# Bindings
# =========================================================
bind \ck history-search-backward
bind \cj history-search-forward

set -gx MANPATH "$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/share/man/:"

# function man -w man --description "wrap the 'man' manual page opener to use color in formatting"
#   # based on this group of settings and explanation for them:
#   # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
#   # converted to Fish shell syntax thanks to this page:
#   # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192
#
#   # start of bold:
#   set -x LESS_TERMCAP_md (set_color --bold red)
#   # end of all formatting:
#   set -x LESS_TERMCAP_me (set_color normal)
#
#   # start of standout (inverted colors):
#   set -x LESS_TERMCAP_so (set_color --reverse)
#   # end of standout (inverted colors):
#   set -x LESS_TERMCAP_se (set_color normal)
#
#   # start of underline:
#   set -x LESS_TERMCAP_us (set_color --underline cyan)
#   # end of underline:
#   set -x LESS_TERMCAP_ue (set_color normal)
#
#   command man $argv
# end

# =========================================================
# Prompt
# =========================================================

set -g tide_prompt_char_icon λ
set -g tide_left_prompt_items context pwd git_prompt rust cmd_duration newline virtual_env prompt_char
set -g tide_context_always_display true
set -g __fish_git_prompt_showupstream verbose

# For prompt "pure"
set -g tide_right_prompt_items time
set -g tide_rust_color red
set -g tide_rust_icon ⚙
set -g tide_prompt_char_success_color cyan
set -g tide_context_default_color cyan
set -g tide_pwd_color_dirs blue

# Local non-public configuration.
if test -e ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
