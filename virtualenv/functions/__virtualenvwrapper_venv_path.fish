function __virtualenvwrapper_venv_path
    # Create the path to the virtualenv with name $1. Otherwise,
    # infer the virtualenv using the name of the current directory.
    set venvname $argv[1]
    if test -z "$venvname"
        set venvname (basename (pwd))
    end
    if test -z "$virtualenv_wrapper_dir"
        echo "$HOME/.venvs/$venvname"
        return
    end
    echo "$virtualenv_wrapper_dir/$venvname"
end
