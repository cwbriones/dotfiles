" vim-go provides convenient mappings to goimports, gofmt, staticcheck, etc.
" since coc is used for completion disable gopls and its vim-go mappings
let g:go_gopls_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled = 0
let g:go_imports_autosave = 0
let g:go_fmt_command = "gofmt"
au FileType go nmap <leader>i :GoImports<cr>
