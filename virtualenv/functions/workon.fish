function workon --description "activate the virtualenv with the given name"
    set venvpath (__virtualenvwrapper_venv_path $argv[1])
    if not test -d "$venvpath"
        __vew_error "Virtualenv does not exist: $venvpath"
        return 1
    end
    echo "activate virtualenv $venvpath"
    source "$venvpath/bin/activate.fish"
end
