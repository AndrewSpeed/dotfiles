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

" file linting
Plug 'vim-syntastic/syntastic'

" Syntastic vim-go settings
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

" Molokai colorscheme
Plug 'tomasr/molokai'

" Completions
Plug 'Shougo/neocomplete.vim'

" Go plugin
Plug 'fatih/vim-go'

" go plugin bindings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" docs for word under cursor
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)

" interaces the word under the cursor implements
au FileType go nmap <leader>s <Plug>(go-implements)

" rename word under cursor
au FileType go nmap <leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

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

" Language specific syntax settings
au FileType python setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
