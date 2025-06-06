
let mapleader = ' '
let maplocalleader = ',' " The default local leader is ','

nnoremap <Leader>q :q<CR>

"Tabs
nmap te :tabedit<CR>
nmap tq :tabclose<CR> 
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

"Buffers
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
noremap <leader>w :b#<CR>

"Easier moving in splited panes vim ctrl-hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move in screen line
noremap j gj
noremap k gk

" Find merge conflict markers
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 

" terminal mode
tnoremap <C-W> <C-\>
"--------- Fugitive ---------
"https://www.reddit.com/r/vim/comments/21f4gm/comment/cgcwh5d/?utm_source=share&utm_medium=web2x&context=3
nnoremap <Leader>gb :Git blame<CR>

" to the start/end of line
nnoremap ;h 0
nnoremap ;l $

" auto close bracket
inoremap (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap " ""<left>
inoremap ' ''<left>
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap [ []<left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap { {}<left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap {<CR> {<CR>}<ESC>O

"disable cmd history shortcut
map q: <nop>

" go forword and backword
noremap <C-;> <C-o>
noremap <C-'> <C-i>
