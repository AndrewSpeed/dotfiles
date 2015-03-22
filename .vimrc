" enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set nocompatible              " be iMproved, required
filetype off                  " required

" download plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/bundle')

" The following are examples of different formats supported.
" Keep Plug commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" file linting
Plug 'Syntastic'

" Molokai colorscheme
Plug 'molokai'

" Markdown syntax highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" Highlight trailing spaces
Plug 'bronson/vim-trailing-whitespace'

" Unite file manager, requires vimproc
" go to `~/.vim/bundle/vimproc.vim` and run `./make`
Plug 'Shougo/vimproc'
Plug 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

" search files for text
Plug 'ggreer/the_silver_searcher'
Plug 'rking/ag.vim'
" --- type * to search the word in all files in the current dir
nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

" enable molokai colorscheme
colorscheme molokai

" enable syntax highlighting
syntax on

" enable incremental search
set incsearch

" enable highlighting of matches
set hlsearch

" enable cindent
set cindent

" smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_ddO"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" enable status line for powerline
set laststatus=2

" show unicode glyphs
set encoding=utf-8

" insert 4 spaces when <tab> is hit
set expandtab
set tabstop=4

" highlight column 80
if (exists('+colorcolumn'))
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

