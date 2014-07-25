execute pathogen#infect()
syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set nocompatible      " We're running Vim, not Vi!

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype erb setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"
set t_Co=256
colorscheme wombat256mod
" sets scroll off
set so=5


let g:vimroom_background="white"
let g:vimroom_guibackground = "black"
let g:vimroom_ctermbackground="black"
let g:vimroom_width=100
let NERDTreeDirArrows=0
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
map <C-n> :tabnext<cr>
map <C-t><C-n> :tabnew<cr>
" in visual mode, applies last command to everyline in selection
map <C-d> :normal .<cr>
nmap ` :shell<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

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

augroup OpenNerdTree
    autocmd!
    autocmd VimEnter * NERDTree 
    autocmd VimEnter * wincmd l
augroup END
