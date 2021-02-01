# Defined in /var/folders/j2/v5s4xyw521b8ktyvhl131vx80000gn/T//fish.3SVaTz/rgvi.fish @ line 2
function rgvi
    rg --files $argv | fzf --multi --preview='bat --style=numbers --color=always {} | head -n100' | xargs -o nvim
end
