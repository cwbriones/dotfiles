#!/usr/bin/env fish

function info
	echo [(set_color --bold) ' .. ' (set_color normal)] $argv
end

function success
	echo [(set_color --bold green) ' OK ' (set_color normal)] $argv
end

function fail
	echo [(set_color --bold red) 'FAIL' (set_color normal)] $argv
	exit 1
end

function safelink -a src dst
  set -q overwrite_all || set overwrite_all "false"
  set -q backup_all || set backup_all "false"
  set -q skip_all || set skip_all "false"

  if test -f "$dst" -o -d "$dst" -o -L "$dst"
    if test "$overwrite_all" = "false" -a "$backup_all" = "false" -a "$skip_all" = "false"
      set currentSrc "(readlink $dst)"

      if test "$currentSrc" = "$src"
        set -l skip true
      else
        set -l bn (basename "$src")
        echo "file already exists: $dst (from $bn), what do you want to do?
[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        switch "$action"
          case o
            set -l overwrite true
          case O
            set overwrite_all true
          case b
            set -l backup true
          case B
            set backup_all true
          case s
            set -l skip true
          case S
            set skip_all true
        end
      end
    end

    set -q overwrite || set -l overwrite $overwrite_all
    set -q backup || set -l backup $backup_all
    set -q skip || set -l skip $skip_all

    if test "$overwrite" = "true"
      rm -rf "$dst"
      success "removed $dst"
    end

    if test "$backup" = "true"
      mv "$dst" "$dst.backup"
      success "moved $dst to $dst.backup"
    end

    if test "$skip" = "true"
      success "skipped $src"
    end
  end

  if test "$skip" != "true" # "false" or empty
    ln -s "$src" "$dst"
    success "linked $src to $dst"
  end
end
funcsave safelink

set_color yellow
echo "   ___              __"
echo " /'___\ __         /\ \\"
echo "/\ \__//\_\    ____\ \ \___"
echo "\ \ ,__\/\ \  /',__\\\\ \  _ `\\"
echo " \ \ \_/\ \ \/\__, `\\\\ \ \ \ \\"
echo "  \ \_\  \ \_\/\____/ \ \_\ \_\\"
echo "   \/_/   \/_/\/___/   \/_/\/_/"
set_color normal

set -Ux DOTFILES (dirname (pwd)/(status --current-file))

# Run all the installers.
for install in $DOTFILES/**/install.fish
    info $install
    if fish $install
        success $install
    else
        fail $install
    end
end

for f in $DOTFILES/**/functions
    set -p fish_function_path $f
end
set -p fish_function_path $__fish_config_dir/functions
set fish_function_path (printf '%s\n' $fish_function_path | awk '!x[$0]++')
