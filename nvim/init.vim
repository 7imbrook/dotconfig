set nocompatible              " be iMproved, required
set splitright
call plug#begin('~/.config/nvim/autoload/plugged')

" let Vundle manage Vundle, required
Plug 'tpope/vim-sleuth'
Plug 'kristijanhusak/vim-hybrid-material' 
Plug 'jacoborus/tender'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'neovimhaskell/haskell-vim'
Plug 'enomsg/vim-haskellConcealPlus'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Twinside/vim-hoogle'
Plug 'mpickering/hlint-refactor-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'maksimr/vim-jsbeautify'
Plug 'msanders/cocoa.vim'
Plug 'rking/ag.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'neomake/neomake'
call plug#end()            " required

syntax on
colorscheme tender 

" Absolute and relative line numbers
set number
set relativenumber
set numberwidth=2
hi CursorLineNR cterm=bold ctermfg=White

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Move visual block
vnoremap J :m '>+1<CR>gv=gv vnoremap K :m '<-2<CR>gv=gv

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" Y yanks from cursor on
map Y y$

" Reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" Indent on tab
inoremap <S-Tab> <C-O><LT><LT>
nnoremap <Tab> >>
nnoremap <S-Tab> <LT><LT>
vnoremap <Tab> >gv
vnoremap <S-Tab> <LT>gv


" Window Navigation with Alt
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Tab navigation with Ctrl-Tab
tnoremap <M-[> <C-\><C-n>:tabprevious<CR>
tnoremap <M-]> <C-\><C-n>:tabnext<CR>
tnoremap <M-n> <C-\><C-n>:tabnew term://zsh<CR>
nnoremap <M-[> :tabprevious<CR>
nnoremap <M-]> :tabnext<CR>
nnoremap <M-n> :tabnew term://zsh<CR>

" Escape works in terminal
tnoremap <Esc><Esc> <C-\><C-n>

" Automatically enter insert mode on terminals
autocmd BufWinEnter,WinEnter term://* startinsert

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
autocmd FileType * set tabstop=2|set shiftwidth=2|set expandtab

" Automatically open nerdtree
map <M-e> :NERDTreeToggle % <CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto check syntax
autocmd! BufWritePost * Neomake

" OS X copy buffers
set clipboard=unnamed

