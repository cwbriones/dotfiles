set lines=60
set columns=100

if has("Mac")
    set guifont=Inconsolata\ for\ Powerline:h18
else
    set guifont=Inconsolata\ for\ Powerline\ Bold\ 12
endif
colorscheme base16-ocean
set guioptions=aegimrLtT
"Put gvim into fullscreen"
map <silent> <F11> :call ToggleFullScreen()<CR>

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
