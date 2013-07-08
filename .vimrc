execute pathogen#infect()
execute pathogen#helptags()
" Automatically open NERDTree if no files specified
" autocmd vimenter * if !argc() | NERDTree | endif

" clang_complete settings
let g:clang_user_options='|| exit 0'
let g:clang_auto_user_options='path, .clang_complete'
let g:clang_use_library=1
let g:clang_library_path='/usr/lib/'
let g:clang_auto_select=1
" Disables auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=1
" Show clang errors in the quickfix window
let g:clang_complete_copen=1
"Complete options (disable preview scratch window)
set completeopt=menuone,longest
",options
" Limit popup menu height
let pumheight=15

"vim-jedi Settings
let g:jedi#auto_vim_configuration=1
let g:jedi#show_function_definition=0

"syntastic error checker settings
let g:syntastic_error_symbol='!!'
let g:syntastic_style_error_symbol='S!'

let g:syntastic_warning_symbol='>>'
let g:syntastic_style_warning_symbol='S>'

" colors: colo molokai, codeschool, mustang, midnight, github
" Appearance
syntax on
filetype on
set foldmethod=syntax
set foldlevel=99
set colorcolumn=80
set t_Co=256
set ruler
set number
set guifont=Inconsolata\ 11
set bg=dark
colo gruvbox

" Tab and indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set smartindent

" Search settings
set incsearch
set hlsearch
set smartcase
set ignorecase

" Key mappings
let mapleader = ","
map <leader>td <Plug>TaskList
nnoremap <leader>w <C-w>v<C-w>l
noremap % v%
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>j
noremap <c-h> <c-w>h
noremap <F2> :Errors <CR>
noremap <F3> :NERDTreeToggle <CR>
inoremap jj <ESC>

" Put gvim into fullscreen
map <silent> <F11>
\   :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<C-X><C-U>"
" File specific mappings
filetype plugin indent on
au FileType python set foldmethod=indent
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set completefunc=pythoncomplete#Complete
" Allow for execution directly from the editor by <F10>
au FileType python noremap <buffer> Shift+<F11> :w<CR> :! python % <CR>
au FileType ruby noremap <buffer> Shift+<F11> : w<CR> :! ruby % <CR>

set rtp+=/usr/local/go/misc/vim

if !has('gui_running')
    let g:solarized_termcolors=&t_Co
    let g:solarized_termtrans=1
endif
