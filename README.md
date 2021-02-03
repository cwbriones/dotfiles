dotfiles
=========

Excuse the mess, this has been long overdue.

Somewhat a fork of [Zach Holman's](https://github.com/holman/dotfiles) popular dotfiles, mainly for structure.

Working on getting this useable myself, let alone for others.

## Organization

- If a __file__ or __directory__ ends in `.symlink`, it will be symlinked to the home directory.
  - Example: `foo/foo.symlink` will end up at `~/.foo`
- If a __directory__ is named `config.symlink`, it will be symlinked to `~/.config/<parent>`
  - Example: `alacritty/config.symlink` will end up at `~/.config/alacritty`
- All scripts named `install.fish` will be executed alphabetically by parent.
- All directions named `*/functions` will be added to fish's function path.

## Caveats

It's very important that any installation that modifies or introduces a universal variable should be idempotent.
This means that anything appending or prepending to a variable should not add duplicates each run.

Of course, this doesn't guarantee cleanup of variables between changes to these files, but it does ensure there's
at least a fixed point when run in succession.
