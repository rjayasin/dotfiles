"Sane defaults
filetype plugin indent on
set encoding=utf-8
set tabstop=4 
set shiftwidth=4
set noexpandtab 
set softtabstop=0
set relativenumber
set number
set ruler
set dictionary+=/usr/share/dict/words
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
colorscheme koehler

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
