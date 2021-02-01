# Defined in /var/folders/j2/v5s4xyw521b8ktyvhl131vx80000gn/T//fish.DaaRrU/gb.fish @ line 2
function gb --description 'search through git branches with fzf preview'
  git rev-parse HEAD > /dev/null 2>&1
  if test "$status" != "0"
      echo "error: not a git repo"
      return 1
  end
  git branch --format='%(refname:short)' |
    fzf --preview-window 'up:70%'\
        --preview 'git log -20 --color=always {}'
end
