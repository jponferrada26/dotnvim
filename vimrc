""""""""""""""""""
"" Welcome to the VIM configuration
"" by jponferrada
"""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" INITIAL SETTINGS

set nocompatible

""" make comma the leader key
let mapleader = ',' 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""" manager plugins
Plugin 'gmarik/Vundle.vim'

""" searches for files within current folder
Plugin 'kien/ctrlp.vim'

""" opens files menu
Plugin 'scrooloose/nerdtree'

""" toggles commenT
Plugin 'scrooloose/nerdcommenter'

""" shows status bar
Plugin 'vim-airline/vim-airline'

""" theme color
Plugin 'morhetz/gruvbox'

""" adds shortcuts for calling git commands
Plugin 'tpope/vim-fugitive'

""" package icons for dev
Plugin 'ryanoasis/vim-devicons'

""" draws changes git
Plugin 'airblade/vim-gitgutter'

""" linter
Plugin 'w0rp/ale'

""" syntax pug files
Plugin 'digitaltoad/vim-pug'

""" syntax vue files
Plugin 'posva/vim-vue'

""" syntax ES6 
Plugin 'isRuslan/vim-es6'

""" autocomplete code
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

""" search texts inside files
Plugin 'gabesoft/vim-ags'

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS SETTINGS

""" [CtrlP]
let g:ctrlp_custom_ignore = 'node_modules\|client/node_modules\|.git'

""" [Nerdtree]
let NERDTreeShowHidden=1

""" [Nerdcommenter]
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" let g:gruvbox_termcolors=16
""" [Vim-colors-solarized]
" let g:solarized_termcolors=16

""" [Ale]
let g:ale_linters = {
\   'javascript': ['eslint']
\}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'

""" [Coc.nvim]
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VISUAL SETTINGS

syntax enable

""" themes
set background=dark
colorscheme gruvbox

set cursorline "crosshair: X
set cursorcolumn "crosshair: Y
set number "line numbers
set belloff=all "no bells
set laststatus=2 "make airline always visible
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" EDITOR SETTINGS

set mouse=a

""" set characters limit
set cc=100

""" seach settings
set hlsearch "Highlight search
set incsearch "search as you type
set ignorecase "search ignoring case
set smartcase "but if we type an upcase letter, then search with case

""" indentation settings
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

""" auto read a file when changed from outside vim
set autoread

""" fix backspace
set backspace=indent,eol,start

""" stop swap files!
set noswapfile

""" shares clipboard system
set clipboard=unnamedplus
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEYBOARD SHORTCUTS

""" swith between .pug and .js
nnoremap <Leader>a :e %:p:s,.js$,.X123X,:s,.pug$,.js,:s,.X123X$,.pug,<CR>
nnoremap <Leader>va :vs %:p:s,.js$,.X123X,:s,.pug$,.js,:s,.X123X$,.pug,<CR>
nnoremap <Leader>sa :split %:p:s,.js$,.X123X,:s,.pug$,.js,:s,.X123X$,.pug,<CR>
nnoremap <Leader>ta :tabnew %:p:s,.js$,.X123X,:s,.pug$,.js,:s,.X123X$,.pug,<CR>

""" change windows easily
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

""" resize windows easily
noremap <F5> 10<C-w><
noremap <F6> 10<C-w>>

""" disable highlighted last search words
nnoremap <leader><space> :noh<CR>

""" duplicate line
nmap <C-d> YP<CR>

""" back cursor
map w b

""" toogle [NerdTree]
noremap <C-e> :NERDTreeToggle<CR>

""" call [Ags] (ignore node_modules)
noremap <Leader>f :Ags --ignore-dir=node_modules<Space>
noremap <Leader><Leader>f :AgsQuit<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
