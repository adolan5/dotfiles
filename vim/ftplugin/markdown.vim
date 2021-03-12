" Highlight double white spaces for markdown
let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
highlight DoubleSpace ctermbg=blue guibg=blue
augroup mdgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.md call matchadd('DoubleSpace', dsMatch)
  autocmd BufWinEnter *.md setlocal tw=80
  autocmd BufWinEnter *.md setlocal nonumber
  autocmd BufWinEnter *.md setlocal spell
  autocmd BufWinEnter *.md setlocal cc=+1
  autocmd BufWinEnter *.md setlocal nojoinspaces
augroup END
