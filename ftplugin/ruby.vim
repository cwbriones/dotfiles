" Ruby and Rails
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
let omnifunc='rubycomplete'
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
noremap <buffer> <F8> : w<CR> :! ruby % <CR>
