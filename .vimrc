set nocompatible
filetype off

" Set up vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Vundle managed bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'

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

" Ctrl-j/k deletes blank line below/above, and Shift-Ctrl-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><S-C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><S-C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
