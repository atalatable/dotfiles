set number relativenumber
syntax on

set tabstop=4
set shiftwidth=4
set expandtab

set autoindent

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
