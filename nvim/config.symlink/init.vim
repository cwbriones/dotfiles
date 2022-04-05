"vim: set syntax=vim"
"
"use hyper:
" Plugins managed by vim-plug
"======================================================================
call plug#begin('~/.vim/bundle')
let mapleader = ","

let g:python3_host_prog = expand('~/.venvs/neovim/bin/python')
let g:python_host_skip_check=1

" General Niceities
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'simnalamburt/vim-mundo'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', {'do' : { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-startify'

" Completion
Plug 'neoclide/coc.nvim', {'branch' : 'release'}
Plug 'honza/vim-snippets'

" Additional language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Language syntax support
Plug 'dag/vim-fish'
Plug 'leafgarland/typescript-vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-python/python-syntax'
Plug 'cespare/vim-toml'
Plug 'udalov/kotlin-vim'

" Colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

call plug#end()

" Python
let python_highlight_all = 1

" vim-go provides convenient mappings to goimports, gofmt, staticcheck, etc.
" since coc is used for completion disable gopls and its vim-go mappings
let g:go_gopls_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_imports_autosave = 0
let g:go_fmt_command = "gofmt"
au FileType go nmap <leader>i :GoImports<cr>

"======================================================================
" Completion
"======================================================================
" See https://github.com/neoclide/coc.nvim#example-vim-configuration

set cmdheight=2
set updatetime=300
set shortmess+=c
" C-Space: summon autocompletion
inoremap <silent><expr> <C-Space> coc#refresh()
" selection completion using tab
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" confirm completion with <cr>.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>gt <Plug>(coc-type-definition)
nmap <silent> <leader>r <Plug>(coc-rename)
nmap <silent> <leader>a <Plug>(coc-codeaction)
nmap <silent> <leader>f <Plug>(coc-fix-current)

nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)

nmap <C-K> <Plug>(coc-showSignatureHelp)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif coc#float#has_float()
    call coc#float#close_all()
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight link CocHighlightText IncSearch
highlight Cursor guifg=white guibg=black

au BufRead,BufNewFile *.vue set filetype=html
au BufRead,BufNewFile *.svelte set filetype=html

"======================================================================
" Primary Settings
"======================================================================

set mouse=a

" Limit syntax highlighting
set synmaxcol=150
let g:matchparen_timeout = 2
let g:matchparen_insert_timeout = 2

set encoding=utf-8
set fileformat=unix
set hidden

" Basic Appearance
set nowrap
set ruler
set number
set bg=dark
set splitright
set splitbelow
set title
" set cursorline
set laststatus=2
set foldenable
set foldlevel=99
set foldmethod=syntax

set completeopt=menuone,preview
let pumheight=15

" Global tab and indentation settings
set textwidth=120

set listchars="eol:$,tab:»"
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
set smartcase
set ignorecase
" Remember lots
set history=1000
set undolevels=1000

" I have git for this.
set nobackup
set noswapfile
set wildignore+=*.swp,*.back,*.pyc,*.class,*.beam
set noerrorbells

"======================================================================
" Appearance
"======================================================================

let g:indentLine_char='┊'
let g:indentLine_enabled=0
let g:indentLine_setColors=1

let fullcolor_colorscheme="gruvbox"
let g:gruvbox_constrast_dark="hard"
if has("Mac")
    let system_theme = trim(system('defaults read -g AppleInterfaceStyle'))
    if system_theme == 'Dark'
        set bg=dark
    else
        set bg=dark
    endif
endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
execute "colorscheme ".fullcolor_colorscheme

" Visual indicator of extraneous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
command! Clean execute "%s/\\s\\+$//g"

function! ToggleRules()
    if &colorcolumn == 101
        set colorcolumn=0
        execute ':IndentLinesDisable'
    else
        set colorcolumn=101
        execute ':IndentLinesEnable'
    endif
endfunction
command! Rules execute 'call ToggleRules()'

augroup disableCocInDiff
  autocmd!
  autocmd DiffUpdated * let b:coc_enabled=0
  autocmd DiffUpdated * execute ':CocDisable'
augroup END

function! CocToggle()
    if !exists('b:coc_enabled')
        let b:coc_enabled = 1
    endif
    if b:coc_enabled == 1
        let b:coc_enabled = 0
        call coc#float#close_all()
        execute ':CocDisable'
    else
        let b:coc_enabled = 1
        execute ':CocEnable'
    endif
endfunction

" For easy editing of plain text
autocmd Filetype python setlocal fo+=r

" Disabled for now. Toggle relativenumber when in normal mode.
" set number relativenumber
"
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" ===================================================================
" Key Mappings
" ===================================================================
" Quick access to this configuration.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Buffer management.
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprev<CR>
nnoremap <leader><leader> <C-^>

" Shortcut for closing all other open buffers.
"
" Explanation:
" %bd - delete all buffers
"  e# - open last buffer
" bd# - delete [no name] buffer that %bd creates
"  '" - keep cursor position
command! BufOnly silent! execute "%bd|e#|bd#|'\""

nmap <leader>a: :Tabularize /:<CR>
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a: :Tabularize /:<CR>
vmap <leader>a= :Tabularize /=<CR>
vmap <leader>a; :Tabularize /::<CR>
vmap <leader>a- :Tabularize /-><CR>

" Clear recent search.
nnoremap <silent> <ESC><ESC> :nohls<CR>

" Quickly move between splits.
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" File search.
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
noremap \ :Rg 
map  <leader>td :Rg (TODO\|FIXME\|XXX)\(cbriones\)<CR>

" <F1> is mapped to vim help by the OS
function! ToggleLocationList()
  let g:wi = getloclist(2, {'winid' : 1})
  if g:wi != {}
    lclose
  else
    lopen
  endif
endfunction

noremap <F2> :CocDiagnostics<CR>
noremap <F3> :NERDTreeToggle<CR>
noremap <F4> :Buffers<CR>
noremap <F6> :call ToggleRules()<CR>
noremap <F7> :MundoToggle<CR>
" inoremap jj <ESC>

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

noremap <leader>fi :lope<CR>
noremap <leader>cc :set cursorline!<CR>
noremap <leader>x :Explore<CR>

" See https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
" nnoremap <M-j> :m .+1<CR>==
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv
" vnoremap <M-k> :m '<-2<CR>gv=gv<Paste>

command! -nargs=* Plain set wrap linebreak nolist showbreak=…
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^

" ===================================================================
" Additional Plugin Settings
" ===================================================================

let NERDTreeIgnore = ['\.pyc$']

" Airline
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
    let g:airline_left_sep = ' '
    let g:airline_left_alt_sep = '|'
    let g:airline_right_sep = ' '
    let g:airline_right_alt_sep = '|'
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.linenr = ''
    let g:airline_symbols.maxlinenr = ''
endif
let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#enabled = 0

" There's currently a bug in airline that doesn't play well with fugitive
" when both are enabled, and I'd much rather have diff still around.
" if has("nvim")
" let g:airline#extensions#branch#enabled = 0
" endif

" Load bindings that aren't synced to .dotfiles (e.g. work config)
let local_vimrc = expand('~/.localvimrc')

if filereadable(local_vimrc)
    exe 'source' local_vimrc
endif

let g:ascii = [
   \ '          ___           ___           ___           ___                       ___',
   \ '         /\__\         /\  \         /\  \         /\__\          ___        /\__\',
   \ '        /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |',
   \ '       /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |',
   \ '      /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__',
   \ '     /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\',
   \ '     \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /',
   \ '         |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /',
   \ '         |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /',
   \ '         /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /',
   \ '         \/__/         \/__/         \/__/                                   \/__/',
   \]
let g:startify_custom_header =
    \ 'startify#pad(g:ascii + startify#fortune#boxed())'
