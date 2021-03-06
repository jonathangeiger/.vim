set nocompatible
filetype off

set number
set ruler
set colorcolumn=80
syntax on

" Visual things
set linespace=5
set guifont=Menlo:h12
set cursorline

" Common tweaks
set history=1000
let mapleader = ","
inoremap jj <ESC>
set spell

" Share the system clipboard with vim
set clipboard=unnamed

" Context-dependent cursor in the terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set encoding=utf-8

" Whitespace stuff
set nowrap
set textwidth=79
set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Nice invisibles
set list listchars=tab:·\ ,trail:•
set fileformats=unix

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <silent> <esc> :set hlsearch!<CR><esc>
nnoremap / /\v
vnoremap / /\v

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,*/vendor/gems/*
set wildignore+=*.pyc,*.pyo,*.egg-info,*.egg,*/env/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Per-project settings
set exrc
set secure

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'mileszs/ack.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-git'
Bundle 'pangloss/vim-javascript'
Bundle 'ddollar/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/ZoomWin'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/Jinja'
Bundle 'ocim/htmljinja.vim'
Bundle 'jonathangeiger/Vim-PHP-Doc'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'groenewege/vim-less'
Bundle 'scrooloose/syntastic'
Bundle 'juvenn/mustache.vim'
Bundle 'vim-scripts/EasyGrep'

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" add json syntax highlighting
au BufRead,BufNewFile *.json set ft=javascript

" Map .twig files as jinja templates
au BufRead,BufNewFile *.{twig} set ft=htmljinja

" Add .less highlighting
au BufRead,BufNewFile *.{less} set ft=less

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4

" PHP and more
au FileType php,css,html,htmljinja,javascript setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4

" Yaml files in symfony use four spaces
au FileType yaml setlocal expandtab shiftwidth=4 softtabstop=4

" Don't wrap HTML
au FileType html,htmljinja setlocal textwidth=0

" Ruby
au FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Default color scheme
color solarized
set background=dark

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

" Disable ctrlp's working path detection
let g:ctrlp_working_path_mode = ''

" Set defaults for EasyGrep
let g:EasyGrepRecursive = 1
let g:EasyGrepAllOptionsInExplorer = 1
let g:EasyGrepEveryMatch = 1
let g:EasyGrepCommand = 1

" Use ack for grepping
set grepprg=ack

" Ignore cached files
set wildignore+=*.cache.php,*.php.meta

" Auto save files
autocmd CursorHold,CursorHoldI * silent! wa

" Balance window sizes automatically
autocmd VimResized,BufNew * wincmd =

" Fast resizing of splits
map <C-=> <C-w>=

" New splits
map <Leader>v :botright vnew<CR><C-W>l
map <Leader>s :belowright new<CR><C-W>j

" Split movement
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" New tab
map <Leader>t :tabnew<CR>

" Fast writing and quitting
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Bindings
map  <Leader>/ <plug>NERDCommenterToggle
nmap <Leader>f :Ack<space>
nmap <Leader>r :Replace<space>
nmap <Leader>m :ZoomWin<CR>
vmap <Leader>> >gv
vmap <Leader>< <gv

" Fugitive
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gdiff<CR>
