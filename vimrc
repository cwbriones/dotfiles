execute pathogen#infect()
execute pathogen#helptags()

" Custom Function Definitions
function! ToggleToolbars()
    if &guioptions == 'aegimrLtT'
        set guioptions=aci
    else
        set guioptions=aegimrLtT
        set lines=50 columns=100
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

" colors: colo molokai, codeschool, mustang, midnight, github
" Appearance
syntax on
filetype on
set hidden
set foldmethod=syntax
set foldlevel=99
set colorcolumn=80
set t_Co=256
set ruler
set number
set bg=dark
" For use with airline status bar
set laststatus=2
" gui-specific font and colorscheme settings
if has("gui_running")
    if has("win32")
        set guifont=Consolas:h11
    elseif has("Mac")
        set guifont=Inconsolata:h13
    else
        " set guifont=Inconsolata\ 12
        set guifont=Terminus\ 12
    endif
    colorscheme molokai
    set guioptions=aegimrLtT
    "Put gvim into fullscreen"
    map <silent> <F11> :call ToggleFullScreen()<CR>
else
    colorscheme molokai
endif

" Tab and indentation settings
set tabstop=4
set softtabstop=4
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
map <leader>td <Plug>TaskList
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
noremap <F9> :!ctags -R --fields=+iaS --c++-kinds=+vfp --extra=+q . --language-force=C++<CR>
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

" clang_complete settings
" let g:clang_user_options='|| exit 0'
" let g:clang_auto_user_options='path, .clang_complete'
" let g:clang_use_library=1
" let g:clang_library_path='/usr/lib/'
" let g:clang_auto_select=2
" " Disables auto popup, use <Tab> to autocomplete
" let g:clang_complete_auto=1
" " Show clang errors in the quickfix window
" let g:clang_complete_copen=1
" " Close preview after complettion
" let g:clang_close_preview=1
" " Snippets settings for clang
" let g:clang_snippets=1
" " Jump to next snippet
" imap <c-j> <ESC><TAB>di
" set completeopt=menuone,longest
" ",options
" " Limit popup menu height
" let pumheight=15

"vim-jedi Settings
let g:jedi#popup_select_first=1
let g:jedi#auto_vim_configuration=1
let g:jedi#show_function_definition=1
let g:jedi#goto_command="<leader>g"
let g:jedi#get_definition_command="<leader>d"
let g:jedi#pydoc="K"
let g:jedi#rename_command="<leader>r"
"
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "context"
" File specific mappings
filetype plugin indent on
au FileType python set foldmethod=indent
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set completefunc=pythoncomplete#Complete
" Allow for execution directly from the editor by <F8>
au FileType python noremap <buffer> <F8> :w<CR> :! python % <CR>
au FileType ruby noremap <buffer> <F8> : w<CR> :! ruby % <CR>

set rtp+=/usr/local/go/misc/vim
