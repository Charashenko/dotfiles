" --- General --- "
set clipboard=unnamedplus
set encoding=UTF-8
set hls is
set spelllang=en_us
set hlsearch
set ignorecase
set linebreak
set wrap
set ruler
set wildmenu
set mouse=a
set backspace=indent,eol,start
set nu rnu
set incsearch
set autoindent
syntax on
set showmatch
set sts=4
set ts=2

" --- Mapping --- "
let mapleader=" "
map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W
map <leader>rc :source ~/.vimrc
map <leader>x :wq
map <leader>rr :%s/
map <leader>r :s/
map <leader>s /
map <leader>q :q
map <leader>w :w
