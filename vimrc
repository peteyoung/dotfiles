set nocompatible
filetype off

" Set up vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Vundle managed bundles
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wting/rust.vim'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

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

" Tabs and spaces by filetype
if has("autocmd")
  filetype on
  autocmd FileType ruby           setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python         setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html           setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css            setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript     setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType make           setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml           setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType bash,sh,zsh    setlocal ts=2 sts=2 sw=2 noexpandtab

  "autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction





