let mapleader = ","
colorscheme elflord
" Always highlight trailing whitespace
let esMatch = '\s\+$'
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter,InsertLeave  * let b:es = matchadd('ExtraWhitespace', esMatch)
autocmd InsertEnter * call matchdelete(b:es)

" Highlight double white space for markdown and Latex
let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
highlight DoubleSpace ctermbg=blue guibg=blue
autocmd BufWinEnter,BufCreate,InsertLeave *.tex,*.md let b:ds = matchadd('DoubleSpace', dsMatch)
autocmd InsertEnter *.tex,*.md call matchdelete(b:ds)

" Always clear machtes on exit
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespace
function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

map <leader>w :call StripTrailingWhitespaces()<cr>

" Faster tab opening, opens pwd
map <leader>e :tabe %:h<cr>

" Faster tab switching
map <leader>f :tabnext<cr>
map <leader>a :tabprevious<cr>

" Set highlight search
set hlsearch

" Font settings
set guifont=Courier\ New:h11
" Don't create messy extra files
set nobackup
set noundofile
set noswapfile
" General indentation
set shiftwidth=2 tabstop=2 expandtab
" File-type specific settings
autocmd FileType sql setlocal shiftwidth=4 tabstop=4
autocmd FileType markdown setlocal tw=80 nonumber spell
autocmd FileType tex setlocal tw=80 spell

" Smart indentation!
set autoindent
filetype indent on

" Incremental searching
set incsearch

" Show line numbers
set number
highlight LineNr guifg=#adadad ctermfg=gray
" Better error color for Spelling mistakes
highlight SpellBad cterm=bold ctermbg=1
" Don't have lines wrap (looks v messy)
set nowrap
" Always use unix-style formatting
set ffs=unix
" Use smart case for searching
set ignorecase
set smartcase
" Map to quickly open the current directory in a vspit
map <leader>c :vsplit <bar> :Ex<cr>
" Map to set the current vsplit to be a lil' fatter
map <leader>v :vertical resize 150<cr>
" vsplit mappings
map <leader>s <c-w>h
map <leader>d <c-w>l
map <leader>b <c-w>=

" use ctrlp fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Map to ctrlp in this dir (better than in root all the time)
map <leader>t :CtrlP %:h<cr>
" Disable ctrlp's auto find root
let g:ctrlp_working_path_mode = 0
" Custom ignore for ctrlp; node_modules and Java classes
let g:ctrlp_custom_ignore = 'node_modules\|.*\.class'

" This map is AMAZING for your pinkies :)
map <Space> :

" Immediately open a DOS file with dos endings (yuck!)
map <leader>4 :e ++ff=dos<cr>

