set backspace=indent,eol,start
set tabstop=2 shiftwidth=2 expandtab
if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


set nocompatible              " be iMproved, required
" --------------------
" Syntax and indent
" --------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them
" ---------------------
" Basic editing config
" ---------------------
" Settings Newly Added
" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
set autoindent 
set nu " number lines
set rnu " relative line numbering
set shortmess+=I " disable startup message
set mouse+=a " enable mouse mode (scrolling, selection, etc)
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set lbr " line break
" Permanent undo
set undodir=~/.vimdid
set undofile
filetype off                  " required
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
"Plug 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" All of your Plugins must be added before the following line
" Newly installed plugins
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'fboender/bexec'
Plug 'majutsushi/tagbar'
Plug 'joshdick/3dglasses'
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdtree'
call plug#end()            " required
colorscheme 3dglasses
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
:map <C-n> :NERDTree
:map<C-d> :%s/
" when running at every change you may want to disable quickfix
let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.rb,*.sh PrettierAsync
