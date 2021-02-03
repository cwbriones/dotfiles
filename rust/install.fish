#!/usr/bin/env fish
if not test (which rustup)
    echo "rustup not found - installing."
    sh "(curl -fsSL https://sh.rustup.rs)"
else
    echo "updating rustup."
    rustup self update
end

echo "updating rust toolchains."
rustup update stable
rustup update nightly

rustup completions fish > $__fish_config_dir/completions/rustup.fish
