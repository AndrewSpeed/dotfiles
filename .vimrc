set exrc
set nocompatible              " be iMproved, required
set number relativenumber     " relative line numbers, with absolute line number for current line
set backspace=indent,eol,start "fix backspace

" enable syntax highlighting
syntax on

" enable incremental search
set incsearch

" enable highlighting of matches
" set hlsearch

" enable cindent
set cindent

" show unicode glyphs
set encoding=utf-8

" insert 4 spaces when <tab> is hit
set shiftwidth=4
set tabstop=4
set expandtab

filetype off                  " required

if !isdirectory($HOME.'/.vim/undodir')
    call mkdir($HOME.'/.vim/undodir', 'p')
endif
set undofile
set undodir=~/.vim/undodir    " file history that persists across sessions

if !isdirectory($HOME.'/.vim/swpdir')
    call mkdir($HOME.'/.vim/swpdir', 'p')
endif
set directory=~/.vim/swpdir

" download plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" remap Leader to space
let mapleader = "\<Space>"

" remap Escape to jj
imap jj <Esc>

call plug#begin('~/.vim/bundle')

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Rails, Rubocop & Rspec
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby'] }

" JSX
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript'] }
let g:jsx_ext_required = 0

Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
" autoformat before save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.json, PrettierAsync

" Rust
Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
let g:rustfmt_autosave = 1

" Jenkinsfile
au BufNewFile,BufRead Jenkinsfile setf groovy

" Async Linting Engine
Plug 'w0rp/ale'
let g:ale_change_sign_column_color = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {'ruby': ['rubocop'], 'javascript': ['eslint'], 'python': ['pyflakes']}
let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['eslint'], 'python': ['black']}
let g:ale_sh_shellcheck_options = '-x'
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 200

" Indent highlighting
"Plug 'Yggdroot/indentLine'

" Molokai colorscheme
Plug 'tomasr/molokai'

" Completions
Plug 'Shougo/neocomplete.vim'

Plug 'alfredodeza/pytest.vim', { 'for': ['python'] }
" Pytest
au FileType python nmap <silent><Leader>f <Esc>:Pytest file<CR>
au FileType python nmap <silent><Leader>c <Esc>:Pytest class<CR>
au FileType python nmap <silent><Leader>m <Esc>:Pytest method<CR>

" Rust plugin
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

" js syntax highlighting
Plug 'pangloss/vim-javascript'

" jsx syntax highlighting
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" fuzzy searching
Plug '~/.fzf'

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" enable molokai colorscheme
colorscheme molokai

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Language specific syntax settings
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
au FileType javascript.jsx setl sw=2 sts=2 et

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" disable unsafe commands in project specific config
set secure
