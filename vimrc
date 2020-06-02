" Turn off vi compatibility
set nocompatible

"Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test', { 'for': 'java' }
Plug 'blueshirts/darcula'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
call plug#end()

" Turn on filetype recognition, highlighting, theme, and encoding
filetype plugin indent on
syntax enable
colorscheme darcula
set t_Co=256
set encoding=utf-8
let mapleader = ","
let g:rainbow_active = 1

" Improved search, and smarter tab
set ignorecase
set hlsearch
set smarttab

noremap <space><cr> :nohlsearch<cr>

set scrolloff=3
set sidescrolloff=5

set visualbell
set noerrorbells

set clipboard=unnamedplus

" Copy previous indentation when autoindenting
set autoindent
set backspace=indent,eol,start

" Turn on swap files
set swapfile
set directory^=~/.vim/swap//

" Prevent crash-during-write, but delete backup after write.
set writebackup
set nobackup
set backupdir^=/.vim/backup//

" Persistent undo
set undolevels=100
set undofile
set undodir^=~/.vim/undodir//

" Fast is good right?
set ttyfast

" Set title, turn off bells, color column 72
set title
set colorcolumn=100

" setup powerline and display the status bar
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode

set ruler

set display+=lastline

set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,nbsp:␣
set fillchars+=stl:\ ,stlnc:\

" Delete comment character when joining commented lines
set formatoptions+=j

set shell=/usr/bin/env\ bash

" Unix file format
" Do not increment numbers in octal
set nrformats-=octal
set ffs=unix

" ,l to show hidden characters

" ,, to switch between current buffer and previous
nnoremap <leader><leader> <c-^>

" ,f list all opened buffers and wait for input to switch buffer
nnoremap <leader>f :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

" Disable arrow keys in Normal Mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <leader>y "*y
noremap <leader>Y "*Y
noremap <leader>p "*p
noremap <leader>P "*P

nmap <leader>h <c-w>h
nmap <leader>l <c-w>l
nmap <leader>k <c-w>k
nmap <leader>j <c-w>j
nmap <leader>w <C-w><C-w>

nmap zj o<Esc>k
nmap zk o<Esc>j

" Easy compile java in vim
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#

"Loc List
map <leader>e :lopen<CR>
map <leader>E :lclose<CR>

" Show line numbers
set number

set lazyredraw
set autoread
set history=500
set tabpagemax=25
set viminfo^=!
set completeopt=longest,menuone

"Tagbar
nmap <C-b> :TagbarToggle<cr>

" Toggle nerdtree
nmap <C-d> :NERDTreeToggle<CR>

" vim-test bindings
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

