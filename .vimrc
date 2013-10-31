execute pathogen#infect()
call pathogen#incubate()
call pathogen#helptags()
autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino
filetype plugin on
filetype indent on 

set history=700
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set wildmenu 
set ignorecase
set smartcase
set hlsearch
syntax enable
set expandtab
set smarttab
set lbr
"set tw=500
set wrap
set ai
set laststatus=2 
set statusline+=%F

set updatetime=10000
augroup DisableInsert
        autocmd!
        autocmd Focuslost,TabLeave,CursorHoldI * call feedkeys("\<C-\>\<C-n>")
augroup END

augroup SaveState
        autocmd!
        autocmd BufWinLeave * silent! mkview
        autocmd BufWinEnter * silent! loadview
augroup END

augroup InsertHighlight
        autocmd!
        autocmd InsertEnter * set cul
        autocmd InsertLeave * set nocul
augroup END

map <C-J> :bnext<CR>
map <C-K> :bprev<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>
