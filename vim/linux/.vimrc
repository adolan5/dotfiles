let mapleader = ","
colorscheme elflord
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
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

" Set highlight search
set hlsearch

" Font settings
set guifont=Courier\ New:h11
" Don't create messy extra files
set nobackup
set noundofile
set noswapfile
" File-type specific settings
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType eruby setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType java setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType sql setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType sh setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab

" Smart indentation!
set autoindent
filetype indent on

" Show line numbers
set number
highlight LineNr guifg=#adadad ctermfg=gray
" Don't have lines wrap (looks v messy)
set nowrap
" Always use unix-style formatting
set ffs=unix
" Map to quickly open the current directory in a vspit
map <leader>c :vsplit <bar> :Ex<cr>
" Map to set the current vsplit to be a lil' fatter
map <leader>v :vertical resize 150<cr>
