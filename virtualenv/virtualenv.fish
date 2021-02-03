#!/usr/bin/env/fish

# Not the real virtualenvwrapper - I home-rolled it since I really only need the basics.
# If I *really* need to have a full-blown solution I'll figure it out later.
function __vew_error
  echo "[ERROR]: $argv" >&2
  return 1
end
funcsave __vew_error

function workon --description "activate the virtualenv with the given name"
    set venvpath (__virtualenvwrapper_virtualenv_path $argv[1])
    if not test -d "$venvpath"
        __vew_error "Virtualenv does not exist: $venvpath"
        return 1
    end
    echo "activate virtualenv $venvpath"
    source "$venvpath/bin/activate.fish"
end
funcsave workon

function mkvirtualenv --description "create a new virtualenv"
    set ARGS ""
    # everything after -- gets passed to virtualenv
    if test (count $argv) -gt 0
        for i in (seq (count $argv))
            if test $argv[$i] = "--"
                set ARGS $argv[(math $i + 1)..-1]
                set argv $argv[1..(math $i - 1)]
                break
            end
        end
    end
    set venvname $argv[1]

    # Create a virtualenv with the given name.
    set venvpath (__virtualenvwrapper_virtualenv_path $venvname)
    if test -d "$venvpath"
        __vew_error "Virtualenv already exists: $venvpath"
        return 1
    end

    mkdir -p $venvpath
    echo "Creating virtualenv in $venvpath"
    if not test -z "$ARGS"
        echo python3 -m venv "$ARGS" "$venvpath"
        python3 -m venv "$ARGS" "$venvpath"
    else
        echo python3 -m venv "$venvpath"
        python3 -m venv "$venvpath"
    end
    if not $status
        __vew_error "failed to create virtualenv"
    end
    source "$venvpath/bin/activate.fish"
end
funcsave mkvirtualenv

function __virtualenvwrapper_virtualenv_path
    # Create the path to the virtualenv with name $1. Otherwise,
    # infer the virtualenv using the name of the current directory.
    set venvname $argv[1]
    if test -z $venvname
        set venvname (basename (pwd))
    end
    if test -z $VIRTUALENVWRAPPER_DIR
        echo "$HOME/.venvs/$venvname"
        return
    end
    echo "$VIRTUALENVWRAPPER_DIR/$venvname"
end
funcsave __virtualenvwrapper_virtualenv_path
