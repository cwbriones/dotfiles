" Python specific settings
set foldmethod=indent
set foldlevel=99

" Running mypy
setlocal makeprg=mypy-daemon
command! -nargs=* Mypy silent make! --plugin=vim <q-args> | redraw! | cw
noremap <F8> :Mypy<CR>
