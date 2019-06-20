#!/bin/bash

# Not the real virtualenvwrapper - I home-rolled it since I really only need the basics.
# If I *really* need to have a full-blown solution I'll figure it out later.

function err() {
  echo "[ERROR]: $@" >&2
}

function workon() {
    # Activate the virtualenv with the given name.
    VENVPATH=$(virtualenvwrapper::_virtualenv_path $1)

    if [[ ! -d "$VENVPATH" ]]; then
        err "Virtualenv does not exist: $VENVPATH"
        return 1
    fi
    echo "activate virtualenv $VENVPATH"
    source "$VENVPATH/bin/activate"
}

function mkvirtualenv() {
    venvname="$1"
    if [[ $# -gt 0 ]]; then
        shift 1
    fi
    ARGS=""
    if [[ $1 == "--" ]]; then
        shift 1
        ARGS="$@"
    fi

    # Create a virtualenv with the given name.
    VENVPATH=$(virtualenvwrapper::_virtualenv_path $venvname)

    if [[ -d "$VENVPATH" ]]; then
        err "Virtualenv already exists: $VENVPATH"
        return 1
    fi

    mkdir -p $VENVPATH
    echo "Creating virtualenv in $VENVPATH"
    if [[ ! -z "$ARGS" ]]; then
        echo virtualenv "$ARGS" "$VENVPATH"
        virtualenv "$ARGS" "$VENVPATH"
    else
        echo virtualenv "$VENVPATH"
        virtualenv "$VENVPATH"
    fi
    source "$VENVPATH/bin/activate"
}

function virtualenvwrapper::_virtualenv_path() {
    # Create the path to the virtualenv with name $1. Otherwise,
    # infer the virtualenv using the name of the current directory.
    VENVNAME="$1"
    if [[ -z $VENVNAME ]]; then
        VENVNAME="${PWD##*/}"
    fi
    if [[ $VIRTUALENVWRAPPER_DIR == '' ]]; then
        echo "$HOME/.venvs/$VENVNAME"
        return
    fi
    echo "$VIRTUALENVWRAPPER_DIR/$VENVNAME"
}
