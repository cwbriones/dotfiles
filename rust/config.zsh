RUST_ROOT="$(rustc --print sysroot)"

manpath+="$RUST_ROOT/share/man"

export RUST_SRC_PATH="$RUST_ROOT/lib/rustlib/src/rust/src"
export MANPATH
