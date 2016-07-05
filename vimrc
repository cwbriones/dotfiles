execute pathogen#infect()

execute pathogen#helptags()
" Custom Function Definitions
function! TogglePaste()
    if &paste == 1
        set nopaste
    else
        set paste
    endif
endfunction

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
    if has("Mac")
        if &fu == 1
            set nofu
            set lines=50
            set columns=80
        else
            set fu
        endif
    else
        call ToggleToolbars()
        call system("wmctrl -i -r ".v:windowid." -b toggle,fullscreen")
   endif
    redraw
endfunction

" call matchadd('ColorColumn', '\%81v', 100)
function! ToggleColorColumn()
    if &colorcolumn == 101
        set colorcolumn=0
    else
        set colorcolumn=101
    endif
endfunction

" For easy editing of plain text
command! -nargs=* Plain set wrap linebreak nolist showbreak=…
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^

" The Silver Searcher
let g:ctrlp_cmd="CtrlPCurWD"
if executable('ag')
    " Use ag in Ctrl-P for listing files and over grep.
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
    let g:ctrlp_user_caching=1
endif

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Automatically open NERDTree if no files specified
" autocmd vimenter * if !argc() | NERDTree | endif

"syntastic error checker settings
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_compiler = 'g++-4.8'
let g:syntastic_cpp_compiler_options='-std=c++11'
let g:syntastic_style_error_symbol='S!'
let g:syntastic_warning_symbol='>>'
let g:syntastic_style_warning_symbol='S>'
let g:syntastic_style_warning_symbol='S>'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_popular_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Appearance
filetype on
" File specific mappings, found in ~/.vim/ftplugin
filetype plugin on
" Enable language specific indentation settings
filetype plugin indent on
syntax on
set hidden
set foldenable
set foldlevel=99
let g:erlang_folding=1
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
set nowrap
set ruler
set number
set bg=dark
set splitright
set splitbelow
" For use with airline status bar
if !exists("g:airline_symbols") && !has("gui_running")
    let g:airline_symbols = {}
    let g:airline_left_sep = '»'
    let g:airline_right_sep = '«'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
    let g:airline_powerline_fonts = 0
endif
set laststatus=2
let fullcolor_colorscheme="colorsbox-material"
" gui-specific font and colorscheme settings
if has("gui_running")
    set lines=60
    set columns=80

    if has("win32")
        set guifont=Consolas:h11
    elseif has("Mac")
        set guifont=Inconsolata\ for\ Powerline:h18
    else
        set guifont=Inconsolata\ for\ Powerline\ Bold\ 12
    endif
    execute "colorscheme ".fullcolor_colorscheme
    set guioptions=aegimrLtT
    "Put gvim into fullscreen"
    map <silent> <F11> :call ToggleFullScreen()<CR>
elseif has("nvim")
    execute "colorscheme ".fullcolor_colorscheme
else
    colorscheme jellybeans
endif

" Visual indicator of more than 80 columns changed to red
highlight ColorColumn ctermbg=red
highlight ColorColumn guibg=red

" Visual indicator of extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
command! Clean execute "%s/\\s\\+$//g"
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" Global tab and indentation settings
" Show tabs with `list` attribute enabled
set lcs=tab:>-
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

set wildignore+=*.swp,*.back,*.pyc,*.class,*.beam
set title " change the title of the window
set visualbell " don't beep
set noerrorbells " don't beep

" Key mappings
let mapleader = ","
map  <leader>td <Plug>TaskList
nmap  <leader>a: :Tabularize /:<CR>
nmap  <leader>a= :Tabularize /=<CR>
vmap  <leader>a: :Tabularize /:<CR>
vmap  <leader>a= :Tabularize /=<CR>
vmap  <leader>a; :Tabularize /::<CR>
vmap  <leader>a- :Tabularize /-><CR>
nmap <silent> <leader>ff :CtrlP<CR>
nmap <silent> <leader>fb :CtrlPMRU<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>F :CtrlPCurWD<CR>
nnoremap <leader>w <C-w>v<C-w>l
" <F1> is mapped to vim help by the OS"
noremap <F2> :Errors<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :TlistToggle<CR>
" Clear recent search
noremap <F5> :set hlsearch!<CR>
noremap <F6> :call ToggleColorColumn()<CR>
noremap <F7> :GundoToggle<CR>
" Execute the current file
noremap <F8> :!chmod +x % && ./% <CR>
noremap <F9> :call TogglePaste()<CR>
inoremap jj <ESC>

" ===================================================================
" Completion plugin settings
" ===================================================================

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
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~', '.', '../']
let g:ycm_add_preview_to_completeopt=1
let g:ycm_semantic_triggers = {'haskell' : ['.']}
set completeopt=menuone,preview
let pumheight=15

let g:EclimCompletionMethod = "omnifunc"
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_rails = 1
let g:ycm_rust_src_path=$RUST_SRC_PATH
autocmd BufRead *.cql set syntax=cql
