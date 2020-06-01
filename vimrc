" Turn off vi compatibility
set nocompatible

"Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'janko-m/vim-test', { 'for': 'java' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'blueshirts/darcula' 
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'WolfgangMehner/c-support'
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
call plug#end()

" Turn on filetype recognition, highlighting, theme, and encoding
filetype plugin indent on
syntax enable
colorscheme darcula
set t_Co=256
set encoding=utf-8
let mapleader = ","
let g:rainbow_active = 1 
let g:deoplete#enable_at_startup = 1

" Improved search and deoplete settings 
set ignorecase
set hlsearch
set smarttab

""use TAB as the mapping
inoremap <silent><expr> <TAB>
    \ pumvisible() ?  "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "" {{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "" }}}

noremap <space><cr> :nohlsearch<cr>

set scrolloff=3
set sidescrolloff=5

set visualbell
set noerrorbells

set clipboard=unnamedplus

" Copy previous indentation when autoindenting
set autoindent
set backspace=indent,eol,start
set smarttab

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

set laststatus=2
set ruler
set wildmenu

" Powerline helpful settings
set showtabline=2
set noshowmode

set display+=lastline

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set fillchars+=stl:\ ,stlnc:\

" Delete comment character when joining commented lines
set formatoptions+=j

setglobal tags-=./tags tags-=./tags; tags^=./tags;

set shell=/usr/bin/env\ bash

" Airline, enable smarter tab line, fonts and theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:airline_extensions = ['quickfix', 'netrw', 'term', 'hunks', 'branch', 'fugitiveline', 'ale', 'whitespace', 'po', 'wordcount', 'keymap']

" Unix file format
" Do not increment numbers in octal
set nrformats-=octal
set ffs=unix

" ,l to show hidden characters
nmap <leader>l :set list!<CR>

" ,, to switch between current buffer and previous
nnoremap <leader><leader> <c-^>

" Make netrw look like NERDTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

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
set sessionoptions-=options
set completeopt=menu,longest,preview

"Ale Configuration
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" I have some custom icons for errors and warnings but feel free to change them.
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0


" Setup compilers for languages

let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac']
      \ }

" Required for vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType java JCEnable

" Add all missing imports
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" Remove unused imports
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-IMports-RemoveUnused)

"Tagbar
nmap <C-b> :TagbarToggle<cr>

" Toggle nerdtree
nmap <C-d> :NERDTreeToggle<CR>


