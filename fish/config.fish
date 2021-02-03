# =========================================================
# Bindings
# =========================================================
bind \ck history-search-backward
bind \cj history-search-forward

set -gx MANPATH "$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/share/man/:"

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
