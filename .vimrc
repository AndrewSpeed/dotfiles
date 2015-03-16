" enable powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" file linting
Plugin 'Syntastic'

" Molokai colorscheme
Plugin 'molokai'

" Markdown syntax highlighting
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'

" Highlight trailing spaces
Plugin 'bronson/vim-trailing-whitespace'

" Unite file manager, requires vimproc
" go to `~/.vim/bundle/vimproc.vim` and run `./make`
Plugin 'Shougo/vimproc'
Plugin 'Shougo/unite.vim'

let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry

" search files for text
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'
" --- type * to search the word in all files in the current dir
nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

