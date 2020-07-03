let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

augroup SetBlockCursor
au!
autocmd VimEnter * silent !echo -ne '\e[2 q'
augroup END

"Auto save
"autocmd FocusLost * wa
"autocmd TabLeave * wa

set timeoutlen=1
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
set updatetime=300
set shortmess+=c
set termguicolors

nnoremap <silent> <A-h> :tabp<CR>
nnoremap <silent> <A-l> :tabn<CR>
nnoremap <silent> <A-S-h> :tabm -1<CR>
nnoremap <silent> <A-S-l> :tabm +1<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

call plug#begin('~/.vim/plugged')
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
call plug#end()

lua require'plug-colorizer'

nnoremap <silent> <F1> :NERDTreeToggle<CR>
