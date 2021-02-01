# Defined in /var/folders/j2/v5s4xyw521b8ktyvhl131vx80000gn/T//fish.9K3GJD/gd.fish @ line 2
function gd --description 'search through git changes with fzf'
  git rev-parse HEAD > /dev/null 2>&1
  if test "$status" != "0"
      echo "error: not a git repo"
      return 1
  end
  git -c color.status=always status --short |
    fzf -m --multi --ansi --nth 2..,.. \
        --preview-window 'up:70%'\
        --preview 'git diff {-1} | delta' |
        cut -c4-
end
