
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

" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w

" Find merge conflict markers
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 

" reload nvim 的配置文件
nnoremap <leader>r :source $MYVIMRC<CR>

" terminal mode
tnoremap <C-W> <C-\>

" Search
map <C-F> :Ag<CR>
map <C-O> :Files<CR>
"--------- Fugitive ---------
"https://www.reddit.com/r/vim/comments/21f4gm/comment/cgcwh5d/?utm_source=share&utm_medium=web2x&context=3
nnoremap <Leader>gb :Git blame<CR>

" to the start/end of line
nnoremap ;h 0
nnoremap ;l $
