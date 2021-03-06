" Turn off vi compatibility
set nocompatible

"Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'powerline/powerline'
Plug 'dense-analysis/ale'
Plug 'sjl/gundo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'blueshirts/darcula'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
call plug#end()

" Turn on filetype recognition, highlighting, theme, and encoding
filetype plugin indent on
syntax enable
colorscheme darcula
set t_Co=256
set encoding=utf-8
let mapleader = ","

" Improved search, highlight search, search as typing 
" and remove hightlight with space+return
set ignorecase
set hlsearch
set incsearch
noremap <space><cr> :nohlsearch<cr>

" Fix tabs to always use 4 spaces
set tabstop=4
set softtabstop=4
set expandtab

" enable folding
" space key opens and closes folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
nnoremap <space> za

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" use menu to cycle through matches
set wildmenu

set showmatch

set scrolloff=3
set sidescrolloff=5
set splitbelow
set splitright
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

let b:ale_linters = ['flake8']

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

"Loc List
map <leader>e :lopen<CR>
map <leader>E :lclose<CR>

" Show line numbers
set number

" Do not redraw screen during macros
set lazyredraw

set history=500
set tabpagemax=25

" Improve menu completion
set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Toggle nerdtree
nmap <C-d> :Vexplore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

