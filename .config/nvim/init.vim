set nocompatible
filetype off

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'Yggdroot/indentLine'
Plug 'frazrepo/vim-rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug 'mhinz/vim-startify'
Plug 'ms-jpq/chadtree'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'

call plug#end()

filetype plugin indent on
syntax on
colorscheme onedark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:vim_svelte_plugin_load_full_syntax = 1
let g:indentLine_char = '⎸'
let g:airline_theme = 'onedark'

set number
"set statusline+=W%{winnr()}
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
"set cursorline
set fillchars+=vert:│
set nowrap
set sidescroll=1
"set termguicolors
set ignorecase
set smartcase
set wildignore+=*/__pycache__/*,*.pyc
set noswapfile
set mouse=a
set wildmenu
set wildmode=list:longest,full
set hidden
set nobackup
set cmdheight=2
set updatetime=100
set shortmess+=c
