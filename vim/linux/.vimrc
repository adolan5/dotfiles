" Source defaults
source $VIMRUNTIME/defaults.vim

map , <Nop>
let mapleader = ","
colorscheme elflord

" ''' Plugins '''
" Use Pathogen for runtime management, if available
silent! execute pathogen#infect()

" use ctrlp fuzzy search
" Map to ctrlp in this dir (better than in root all the time)
" TODO: This should be revised
map <leader>t :CtrlP %:h<cr>
if exists("loaded_ctrlp")
  " Disable ctrlp's auto find root
  let g:ctrlp_working_path_mode = 0
  " Custom ignore for ctrlp; node_modules and Java classes
  let g:ctrlp_custom_ignore = 'node_modules\|.*\.class'
endif

" LAck for the current word (expression map could be used here, but I don't
" use K that much anyway.)
nnoremap K :LAck! "<cword>"<CR>:cw<CR>
if exists("g:loaded_ack")
  " Close quickfix after Acking
  let g:ack_autoclose = 1
endif

" Use ag for grep-er (and Ack-er) and ctrlP
if executable('ag')
  set grepprg=ag\ --vimgrep
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ''' Highlighting match groups '''
" Always highlight trailing whitespace
let esMatch = '\s\+$'
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter,BufEnter,InsertLeave * call matchadd('ExtraWhitespace', esMatch)
autocmd BufWinLeave,BufLeave,BufRead,InsertEnter * call clearmatches()
autocmd FileType netrw call clearmatches()

" ''' Functions '''
" Remove trailing whitespace
function! StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction

" ''' General settings '''
" Incremental searching
set incsearch
" Set highlight search
set hlsearch
" Font settings
set guifont=Courier\ New:h11
" Don't create messy extra files
set nobackup
set noundofile
set noswapfile
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
" General indentation
set shiftwidth=2 tabstop=2 expandtab

" ''' ftplugin  '''
filetype plugin on
" Smart indentation!
set autoindent
filetype indent on
" Specific file type settings
autocmd FileType sql setlocal shiftwidth=4 tabstop=4


" ''' Maps '''
" Function calls
map <leader>w :call StripTrailingWhitespaces()<cr>

" Faster tab opening, opens pwd
map <leader>e :Texplore<cr>
" Faster tab switching
map <leader>f :tabnext<cr>
map <leader>a :tabprevious<cr>
" Map to quickly open the current directory in a vspit
map <leader>c :Vexplore<cr>
" Map to set the current vsplit to be a lil' fatter
map <leader>v :vertical resize 150<cr>
" vsplit mappings
map <leader>s <c-w>h
map <leader>d <c-w>l
map <leader>b <c-w>=
" This map is AMAZING for your pinkies :)
map <Space> :
" Immediately open a DOS file with dos endings (yuck!)
map <leader>4 :e ++ff=dos<cr>
" Replacing lost comma backwards search
noremap <leader>g ,
