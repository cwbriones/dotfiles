execute pathogen#infect()

execute pathogen#helptags()
" Custom Function Definitions
function! ToggleToolbars()
    if &guioptions == 'aegimrLtT'
        set guioptions=aci
    else
        set guioptions=aegimrLtT
        set lines=60 
        set columns=80
    endif
endfunction

function! ToggleFullScreen()
    call ToggleToolbars()
    call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
    redraw
endfunction

" Automatically open NERDTree if no files specified
" autocmd vimenter * if !argc() | NERDTree | endif

"syntastic error checker settings
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_error_symbol='!!'
let g:syntastic_style_error_symbol='S!'
let g:syntastic_warning_symbol='>>'
let g:syntastic_style_warning_symbol='S>'

" Appearance
filetype on
" File specific mappings, found in ~/.vim/ftplugin
filetype plugin on
" Enable language specific indentation settings
filetype plugin indent on
syntax on
set hidden
set foldmethod=syntax
set foldlevel=99
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
set ruler
set number
set bg=dark
" For use with airline status bar
set laststatus=2
" gui-specific font and colorscheme settings
if has("gui_running")
    set lines=60 
    set columns=80

    if has("win32")
        set guifont=Consolas:h11
    elseif has("Mac")
        set guifont=Inconsolata:h13
    else
        set guifont=Inconsolata\ \Bold\ 12
    endif
    colorscheme codeschool
    set guioptions=aegimrLtT
    "Put gvim into fullscreen"
    map <silent> <F11> :call ToggleFullScreen()<CR>
else
    colorscheme jellybeans
endif

" Visual indicator of more than 80 columns changed to red
highlight ColorColumn ctermbg=red
highlight ColorColumn guibg=red
" Highlights the char if it is in column 81
call matchadd('ColorColumn', '\%81v', 100)

" Global tab and indentation settings
" How many spaces a tab counts for
set tabstop=4
" how many columns to use when a tab is inserted
set softtabstop=4
" how many columns are indented with >> and <<, auto indent
set shiftwidth=4
set expandtab

set autoindent
set smarttab
set smartindent

" Allow backspaces in insert mode
set backspace=indent,eol,start

" Search settings
set incsearch
set hlsearch
set smartcase
set ignorecase
set history=1000 " Remember lots
set undolevels=1000

" I have git for this.
set nobackup
set noswapfile

set wildignore=*.swp,*.back,*.pyc,*.class
set title " change the title of the window
" set visualbell " don't beep
" set noerrorbells " don't beep

" Key mappings
let mapleader = ","
map  <leader>td <Plug>TaskList
nmap  <leader>a: :Tabularize /:<CR>
nmap  <leader>a= :Tabularize /=<CR>
vmap  <leader>a: :Tabularize /:<CR>
vmap  <leader>a= :Tabularize /=<CR>
nmap <silent> <leader>ff :CtrlP<CR>
nmap <silent> <leader>fb :CtrlPMRU<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>w <C-w>v<C-w>l
" <F1> is mapped to vim help by the OS"
noremap <F2> :Errors<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TlistToggle<CR>
" Clear recent search
noremap <F5> :set hlsearch!<CR>
" <F8> is mapped to 'run interpreter'
inoremap jj <ESC>
" I have git for this.
set nobackup
set noswapfile

" taglist settings
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Win_Width=50
let Tlist_Exit_Only_Window = 1
" let Tlist_Show_One_File = 1
" let Tlist_Display_Prototype=1

imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

let g:SuperTabDefaultCompletionType = "context"
"YCM Settings"
let g:ycm_filetype_whitelist = { 'cpp' : 1, 'python' : 1, 'rb' : 1}
let g:ycm_global_ycm_extra_conf = '~'

let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~', '.', '../']
let g:ycm_add_preview_to_completeopt=1
set completeopt=menuone,preview
let pumheight=15

let g:EclimCompletionMethod = "omnifunc"
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1
