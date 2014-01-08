" Python specific settings
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
set foldmethod=indent
set omnifunc=pythoncomplete#Complete
set completefunc=pythoncomplete#Complete
noremap <buffer> <F8> :w<CR> :! python % <CR>
