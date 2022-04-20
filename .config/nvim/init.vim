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
nnoremap <silent> <C-i> :Neoformat<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header	= '/usr/lib/clang'

let g:ale_linters = {
  \ 'c': ['clang']
\}

" custom setting for clangformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 2}"']
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'
call plug#end()

lua require'plug-colorizer'

autocmd vimenter * 
  \ colorscheme gruvbox |
  \ hi Normal guibg=NONE ctermbg=NONE |
  \ hi CursorLineNr guibg=NONE
