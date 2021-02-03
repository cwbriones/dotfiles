# Explicitly symlink to the config dir since we don't want to
# be responsible for managing all of config/*
safelink $DOTFILES/fish/config.fish $__fish_config_dir/config.fish
