set nocompatible              " be iMproved, required
set number relativenumber     " relative line numbers, with absolute line number for current line

" enable syntax highlighting
syntax on

" enable incremental search
set incsearch

" enable highlighting of matches
set hlsearch

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

" download plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" remap Leader to space
let mapleader = "\<Space>"

call plug#begin('~/.vim/bundle')

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Quote/Bracket replacement
Plug 'tpope/vim-surround'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Async Linting Engine
Plug 'w0rp/ale'
let g:ale_change_sign_column_color = 1
let g:ale_completion_enabled = 1
let g:ale_linters = {'ruby': ['rubocop'], 'javascript': ['eslint'], 'python': ['flake8', 'pylint']}
let g:ale_fixers = {'ruby': ['rubocop'], 'javascript': ['eslint'], 'python': ['black', 'isort']}
let g:ale_sh_shellcheck_options = '-x'
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 200

" Molokai colorscheme
Plug 'tomasr/molokai'

" Rust plugin
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" enable molokai colorscheme
colorscheme molokai

" Language specific syntax settings
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
