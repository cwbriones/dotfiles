#!/usr/bin/env fish

set -Ux RUST_ROOT "(rustc --print sysroot)"
set -Ux RUST_SRC_PATH "$RUST_ROOT/lib/rustlib/src/rust/src"

# set -Uxa manpath "$RUST_ROOT/share/man"
