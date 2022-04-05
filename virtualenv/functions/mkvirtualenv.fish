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
    set venvpath (__virtualenvwrapper_venv_path $venvname)
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
