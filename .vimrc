set nocompatible
set noerrorbells
set novisualbell
set t_vb=
set hidden
set title
set hlsearch
set incsearch
set incsearch
set wildmode=list:longest
runtime macros/matchit.vim
syntax on
let mapleader = ","
nnoremap ' `
nnoremap ` '
set ignorecase
set smartcase
set title
set scrolloff=3
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set cindent
set autoindent

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
nmap <silent> <leader>n :silent :nohlsearch<CR>
" set listchars=tab:>-,trail:eol:$
nmap <silent> <leader>s :set nolist!<CR>
set shortmess=atI
set ruler

colorscheme desert
