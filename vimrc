" Turn off vi compatibility
set nocompatible

"Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'janko-m/vim-test', { 'for': 'java' }
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'AlessandroYorba/Alduin'
call plug#end()

filetype plugin indent on
syntax enable
colorscheme alduin 
set encoding=utf-8

" Copy previous indentation when autoindenting
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Turn on swap files
set swapfile
set directory^=~/.vim/swap//

" Protect against crash-during-write
set writebackup

" But do not persist backup after successful write
set nobackup

" Persistent undo
set undofile
set undodir^=~/.vim/undo//

" Fast is good right?
set ttyfast
set updatetime=2000

" Set title, turn off bells, color column 72
set title
set colorcolumn=72

" Improved search, turn off highlighting with <C-L>
set ignorecase
set smartcase
set incsearch
set hlsearch

" Do not increment numbers in octal
set nrformats-=octal

set laststatus=2
set ruler
set wildmenu

" Powerline helpful settings
set showtabline=2
set noshowmode

set scrolloff=1
set sidescrolloff=5

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
let g:airline_theme='alduin'
let g:airline_extensions = ['quickfix', 'netrw', 'term', 'hunks', 'branch', 'fugitiveline', 'ale', 'whitespace', 'po', 'wordcount', 'keymap']

" Unix file format
set ffs=unix

" Remap Leader to , and increase timeout
let mapleader = ","
set ttimeout
set ttimeoutlen=100

" ,w to switch windows
noremap <silent> <leader>w <C-w><C-w>

" ,l to show hidden characters
nmap <leader>l :set list!<CR>

" ,, to switch between current buffer and previous
nnoremap <leader><leader> <c-^>

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" ,f list all opened buffers and wait for input to switch buffer
nnoremap <leader>f :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Show line numbers
set number

set lazyredraw
set autoread
set history=1000
set tabpagemax=50
set viminfo^=!
set sessionoptions-=options
set completeopt=menu,longest,preview
set t_Co=16

inoremap <C-U> <C-G>u<C-U>

" Load matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Required for vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" Ask for import option
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" Add all missing imports
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" Remove unused imports
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-IMports-RemoveUnused)

