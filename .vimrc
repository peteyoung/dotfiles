set nocompatible
filetype off

execute pathogen#infect()

syntax on

if has("autocmd")
  filetype plugin indent on
end

set autoindent
set smartindent

set paste

set title
set number
set ruler
set scrolloff=3

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

nmap <Enter> :nohlsearch<Enter>/<BS>

let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

