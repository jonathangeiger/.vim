set nocompatible

set number
set ruler
syntax on

" Visual things
set linespace=5
set guifont=Menlo:h12
set cursorline

" Common tweaks
set history=1000
let mapleader = ","
nnoremap ; :
inoremap jj <ESC>
set spell
set autowrite

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set autoindent
set copyindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" Nice invisibles
set list listchars=tab:·\ ,trail:•

" Searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <esc> :noh<return><esc>
nnoremap / /\v
vnoremap / /\v

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Status bar
set laststatus=2

" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
endfunction

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

" Map .twig files as jinja templates
au BufRead,BufNewFile *.{twig} set ft=htmljinja

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Make these filetypes follow my personal standards
au FileType php,css,html,javascript setlocal noexpandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Ruby
au FileType ruby,yaml setlocal expandtab shiftwidth=2 softtabstop=2

" make uses real tabs
au FileType make setlocal noexpandtab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Command-T configuration
let g:CommandTMaxHeight=20

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
color solarized
set background=dark

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Show (partial) command in the status line
set showcmd

" Flush cache when focus is regained
autocmd FocusGained * CommandTFlush

" Bindings
map  <Leader>/ <plug>NERDCommenterToggle
nmap <Leader>w :w<CR>
nmap <Leader>f :Ack<space>''<Left>
nmap <Leader>m :ZoomWin<CR>
vmap <Leader>] >gv
vmap <Leader>[ <gv
