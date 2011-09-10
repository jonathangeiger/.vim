" Don't beep
set visualbell

" Start without the toolbar, scrollbars, etc
set guioptions=aAce
set colorcolumn=85

" Flush CommandT when focus is regained
autocmd FocusGained * CommandTFlush

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Command-T for CommandT
  macmenu &File.New\ Tab key=<D-T>
  nmap <D-t> :CommandT<CR>
  imap <D-t> <ESC>:CommandT<CR>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
endif

" Command-Shift-F for Ack
nmap <D-F> :Ack<space>''<Left>
imap <D-F> <ESC>:Ack<space>''<Left>

" ConqueTerm
nmap <D-e> :call StartTerm("ConqueTermVSplit")<CR>
nmap <D-E> :call StartTerm("ConqueTermSplit")<CR>
imap <D-e> <ESC>:call StartTerm("ConqueTermVSplit")<CR>
imap <D-E> <ESC>:call StartTerm("ConqueTermSplit")<CR>

" ConqueTerm wrapper
function StartTerm(command)
  execute a:command . ' ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
nmap <Leader>n :NERDTreeToggle<CR>

" Command-][ to increase/decrease indentation
map <D-]> >gv
map <D-[> <gv

" Movement around splits
nmap <D-J> <C-W>j
nmap <D-K> <C-W>k
nmap <D-L> <C-W>l
nmap <D-H> <C-W>h
imap <D-J> <ESC><C-W>ji
imap <D-K> <ESC><C-W>ki
imap <D-L> <ESC><C-W>li
imap <D-H> <ESC><C-W>hi

" New vertical window
nmap <D-d> :botright vnew<CR><C-W>l
imap <D-d> <ESC>:botright vnew<CR><C-W>li

" New horizontal window
nmap <D-D> :belowright new<CR><C-W>j
imap <D-D> <ESC>:belowright new<CR><C-W>li

" Balance window sizes
nmap <D-+> <C-w>=
imap <D-+> <ESC><C-w>=i

" Zoomwin config
nmap <D-M> :ZoomWin<CR>
imap <D-M> <ESC>:ZoomWin<CR>i
