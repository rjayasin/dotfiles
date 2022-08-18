"Sane defaults
filetype plugin indent on
set dictionary+=/usr/share/dict/words
set encoding=utf-8
set hlsearch
set ignorecase
set incsearch
set expandtab 
set number
set relativenumber
set ruler
set shiftwidth=4
set showcmd
set smartcase
set softtabstop=0
set tabstop=4 
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
colorscheme default

"More intuitive window handling
set splitbelow
set splitright
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"set relativenumber
"set cursorline
syntax enable
set encoding=utf-8

"Leader Commands
let mapleader = ","

function! Prose()
    set wrap
    set linebreak
    set nolist
    set number!
    set relativenumber!
endfunction
