if exists('+termguicolors')
  set termguicolors
  let &t_8f = '\<esc>[38;2;%lu;%lu;%lum' " text color
  let &t_8b = '\<esc>[48;2;%lu;%lu;%lum' " background color
endif

set background=dark
hi LineNr guibg=NONE
hi SignColumn guibg=NONE
hi VertSplit guibg=#63707e guifg=#162131
hi Normal guibg=NONE ctermbg=NONE
