" Source defaults
source $VIMRUNTIME/defaults.vim

map , <Nop>
let mapleader = ","

" Highlight colors (ensured to not be overridden by colorscheme changes)
function! HiColors() abort
  highlight ExtraWhitespace ctermbg=red guibg=red
  " Better color for line numbers
  highlight LineNr guifg=#adadad ctermfg=gray
  " Better error color for Spelling mistakes
  highlight SpellBad cterm=bold ctermbg=1
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call HiColors()
augroup END

colorscheme elflord

" ''' Plugins '''
" Use Pathogen for runtime management, if available (for Vim version < 8)
" silent! execute pathogen#infect()

" use ctrlp fuzzy search
" Map to ctrlp in this dir (better than in root all the time)
" TODO: Verify that this works consistently
map <leader>t :CtrlP %:p:h<cr>
" Disable ctrlp's auto find root
let g:ctrlp_working_path_mode = 0
" Custom ignore for ctrlp; node_modules and Java classes
let g:ctrlp_custom_ignore = 'node_modules\|.*\.class'
" Open multiple ctrlp files in new tabs
let g:ctrlp_open_multiple_files = 't'

" LAck for the current word (expression map could be used here, but I don't
" use K that much anyway.)
nnoremap K :LAck! "<cword>"<CR>:lwindow<CR>
" Close quickfix after Acking
let g:ack_autoclose = 1

" Use ag for grep-er (and Ack-er) and ctrlP
if executable('ag')
  set grepprg=ag\ --vimgrep
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ''' Highlighting match groups '''
" Always highlight trailing whitespace
let esMatch = '\s\+$'
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

" Toggle a reasonbly wide local fold column
function! ToggleFoldCol() abort
  if &foldcolumn == 0
    setlocal foldcolumn=8
  else
    set foldcolumn&
  end
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
autocmd FileType gitcommit setlocal spell cc=+1

" ''' Folding options '''
let g:markdown_folding=1

" ''' Maps '''
" Function calls
map <leader>w :call StripTrailingWhitespaces()<cr>

" Faster tab opening, opens pwd
map <leader>e :Texplore<cr>
" Faster tab switching
map <leader>f gt
map <leader>a gT
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
" Quickly toggle fold column of 8
map <leader>j :call ToggleFoldCol()<cr>
