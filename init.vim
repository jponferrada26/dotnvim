""""""""""""""""""
"" Welcome to the NEOVIM configuration
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
call plug#begin()

""" opens files menu
Plug 'scrooloose/nerdtree'

""" toggles commenT
Plug 'scrooloose/nerdcommenter'

""" shows status bar
Plug 'vim-airline/vim-airline'

""" theme color
Plug 'morhetz/gruvbox'

""" adds shortcuts for calling git commands
Plug 'tpope/vim-fugitive'

""" package icons for dev
Plug 'ryanoasis/vim-devicons'

""" draws changes git
Plug 'airblade/vim-gitgutter'

""" syntax code files
Plug 'sheerun/vim-polyglot'

""" autocomplete code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" search texts inside files
Plug 'gabesoft/vim-ags'

""" pretty format
Plug 'sbdchd/neoformat'

""" search files and texts
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS SETTINGS

""" use 'ag' for ignore directories [fzf.vim]
let $FZF_DEFAULT_COMMAND='ag -g "" --ignore-dir node_modules --ignore-dir dist --ignore-dir .git'

""" [Nerdtree]
let NERDTreeShowHidden=1

""" [Nerdcommenter]
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

""" [Coc.nvim]
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-eslint', 
  \ 'coc-vetur', 
  \ 'coc-css', 
  \ 'coc-jest', 
  \ ]
let g:coc_user_config = {
	\ 'diagnostic.errorSign': '❌',
  \ 'diagnostic.warningSign': '⚠️',
  \ 'typescript.preferences.importModuleSpecifier': 'project-relative',
  \ 'jest.watch': 0,
  \ 'jest.terminalPosition': 'bottom'
\ }

""" [neoformat(pretty)]
" local version .node_modules
let g:neoformat_try_node_exe = 1
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
set colorcolumn=100 "Show line at 100 characters
set listchars=tab:\|\ 
set list
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

""" apply changes on save [neoformat(pretty)]
autocmd BufWritePre *.{js,ts,tsx,vue} Neoformat 

""" add support for scss
autocmd FileType scss setl iskeyword+=@-@

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEYBOARD SHORTCUTS

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

""" toggle [NerdTree]
noremap <C-e> :NERDTreeToggle<CR>

""" find actual file [NerdTree]
noremap <C-f> :NERDTreeFind<CR>

""" go to definition module. [Coc.nvim]
nmap <silent> gd :vs<CR><Plug>(coc-definition)

""" go to references module. [Coc.nvim]
nmap <silent> gf <Plug>(coc-references)

""" Remap keys for applying codeAction to the current buffer. [Coc.nvim]
nmap <leader>ac  <Plug>(coc-codeaction)

""" Apply AutoFix to problem on the current line. [Coc.nvim]
nmap <leader>qf  <Plug>(coc-fix-current)

""" Symbol renaming.[Coc.nvim]
nmap <leader>rn <Plug>(coc-rename)

""" open new tab using current file
nmap <Leader>t :tabnew %<CR>

""" open new tab using current file
nmap <Leader>s :split %<CR>

""" set absolute path file in to clipboard
nnoremap <leader>y :let @+=expand('%:p')<CR>

""" search only files [fzf.vim]
nmap <C-p> :Files<CR>

""" Run jest for current test
nnoremap <leader>to :call CocAction('runCommand', 'jest.singleTest')<CR>

""" Run jest for all tests of current file
nnoremap <leader>te :call CocAction('runCommand', 'jest.fileTest', ['%'])<CR>

""" search texts [fzf.vim]
noremap <Leader>f :Ags --ignore-dir=node_modules --ignore-dir=dist --ignore-dir=.git<Space>
noremap <Leader><Leader>f :AgsQuit<CR>

""" open new tab with file selected [fzf.vim]
nnoremap <silent> <C-t> :tabe <C-R>=fnameescape(fzf#vim#selected())<CR><CR>

""" always suppress the newline after I select a suggestion with the Enter key
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

""" Use K to show documentation in preview window. [Coc.nvim]
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
