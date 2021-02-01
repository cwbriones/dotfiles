# =========================================================
# Aliases
# =========================================================
alias vi="nvim"

function man --description "wrap the 'man' manual page opener to use color in formatting"
  # based on this group of settings and explanation for them:
  # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
  # converted to Fish shell syntax thanks to this page:
  # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

  # start of bold:
  set -x LESS_TERMCAP_md (set_color --bold red)
  # end of all formatting:
  set -x LESS_TERMCAP_me (set_color normal)

  # start of standout (inverted colors):
  set -x LESS_TERMCAP_so (set_color --reverse)
  # end of standout (inverted colors):
  set -x LESS_TERMCAP_se (set_color normal)

  # start of underline:
  set -x LESS_TERMCAP_us (set_color --underline)
  # end of underline:
  set -x LESS_TERMCAP_ue (set_color normal)

  command man $argv
end

function otp --description "generate a OTP from your yubikey"
    ykman oath code (ykman oath list | fzf) | tr -s ' ' | cut -d ' ' -f2 | pbcopy
end

bind \ck history-search-backward
bind \cj history-search-forward

# =========================================================
# Path
# =========================================================

# =========================================================
# Prompt
# =========================================================

function prompt_hostname
  set hostname_short (echo $hostname | string split '.')[1]
  echo $hostname_short
end
set -g tide_prompt_char_icon λ
set -g tide_left_prompt_items context $tide_left_prompt_items
set -g tide_context_always_display true
set -g __fish_git_prompt_showupstream verbose

# For prompt "rainbow", minty
# set --global tide_prompt_char_success_color cyan
# set --global tide_context_bg_color brcyan
# set --global tide_context_default_color black
# set --global tide_git_prompt_bg_color brwhite
# set --global tide_time_bg_color brcyan
# set --global tide_cmd_duration_bg_color yellow
# set --global tide_time_color black
# set --global tide_pwd_color_anchors 2d2d2d
# set --global tide_pwd_color_dirs black

# For prompt "pure"
set -g tide_right_prompt_items time
# set -g tide_rust_color magenta
# set -g tide_rust_icon ⚙
set -g tide_prompt_char_success_color cyan
set -g tide_context_default_color cyan
set -g tide_pwd_color_dirs blue
