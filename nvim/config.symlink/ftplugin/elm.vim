let g:ycm_semantic_triggers = {'elm' : ['.']}
let g:elm_setup_keybindings = 1
let g:elm_syntastic_show_warnings = 1
let g:elm_syntastic_auto_loc_list = 1
let g:elm_always_populate_loc_list = 1
let g:elm_format_autosave = 0
let g:elm_make_output_file = "elm.js"
let g:elm_detailed_complete = 1
let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 1
let g:elm_format_fail_silently = 0

noremap <F8> :ElmMake<CR>

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
