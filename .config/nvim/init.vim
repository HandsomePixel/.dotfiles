call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'maxboisvert/vim-simple-complete'
Plug 'ap/vim-css-color'
Plug 'fremff/vim-css-syntax'
Plug 'kchmck/vim-coffee-script'
call plug#end()

" Disable automatic commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Disable default status line
set noshowmode

" Fix Clipboard
set clipboard=unnamed

" Color Scheme
set termguicolors
syntax on
set background=dark
colorscheme molokai

" Line numbers
set number relativenumber

" Jump to mouse on click
set mouse=a

" Indentation
filetype plugin indent on
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces

" Keybinds
" Disable arrow keys in normal mode, due to habit ¯\_(ツ)_/¯
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Remap keys to move between splits faster
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Vim simple complete customizations
set complete-=t
set complete-=i

" Ale Customizations
let g:ale_linters = {'javascript': ['eslint'], 'ruby': ['ruby']}
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Closetag Customizations
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_shortcut = '>'

" Lightline Customizations
let g:lightline = {
      \  'colorscheme': 'molokai',
      \  'component_expand': {
      \    'linter_checking': 'lightline#ale#checking',
      \    'linter_warnings': 'lightline#ale#warnings',
      \    'linter_errors': 'lightline#ale#errors',
      \    'linter_ok': 'lightline#ale#ok'
      \ },
      \  'component_type': {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left'
      \ },
      \  'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \
      \  'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \             [ 'percent' ],
      \             [ 'gitbranch' ] ]
      \ },
      \  'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
      \ }
