" Don't beep
set visualbell

" Start without the toolbar, scrollbars, etc
set guioptions=aAce
set colorcolumn=85

if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert

  " Free up <D-t>
  macmenu &File.New\ Tab key=<D-T>

  " Command-Return for fullscreen
  macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
endif
