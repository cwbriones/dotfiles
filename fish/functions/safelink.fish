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
            set overwrite true
          case O
            set -g overwrite_all true
          case b
            set backup true
          case B
            set -g backup_all true
          case s
            set skip true
          case S
            set -g skip_all true
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
