let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

augroup SetBlockCursor
au!
autocmd VimEnter * silent !echo -ne '\e[2 q'
augroup END

set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set nu
set clipboard=unnamed
set cindent
set autoindent
set smartindent
set relativenumber

nnoremap <C-h> gT
nnoremap <C-l> gt

syntax on
