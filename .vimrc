execute pathogen#infect()
execute pathogen#helptags()
" Automatically open NERDTree if no files specified
" autocmd vimenter * if !argc() | NERDTree | endif

" clang_complete settings
let g:clang_user_options='|| exit 0'
let g:clang_auto_user_options = 'path, .clang_complete'
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/'
let g:clang_auto_select = 1

" Disables auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 1
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"

" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

"Complete options (disable preview scratch window)
set completeopt = menu,menuone,options
" Limit popup menu height
let pumheight = 15
" colors: colo molokai, codeschool, mustang, midnight, github
" Appearance
set foldmethod=syntax
set foldlevel=99
set colorcolumn=80
syntax on
filetype on
set t_Co=256
set ruler
set number
colo molokai
set guifont=Inconsolata\ 11

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
map <leader>j : RopeGoToDefinition<CR>
map <leader>r : RopeGoToDefinition<CR>
nnoremap <leader>w <C-w>v<C-w>l
" nnoremap <tab> %v
noremap % v%
" vnoremap <tab> %v
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>j
noremap <c-h> <c-w>h
noremap <F3> :NERDTreeToggle <CR>

inoremap jj <ESC>

" File specific mappings
filetype plugin indent on
au FileType python set foldmethod=indent
au FileType python set omnifunc=pythoncomplete#Complete
" Allow for execution directly from the editor by <F10>
au FileType python noremap <buffer> <F11> :w<CR> :! python % <CR>
au FileType ruby noremap <buffer> <F11> : w<CR> :! ruby % <CR>


set rtp+=/usr/local/go/misc/vim
