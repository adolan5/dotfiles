" Highlight double white spaces for markdown
let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
highlight DoubleSpace ctermbg=blue guibg=blue
augroup mdgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.md call matchadd('DoubleSpace', dsMatch)
  autocmd BufEnter *.md setlocal tw=80
  autocmd BufEnter *.md setlocal nonumber
  autocmd BufEnter *.md setlocal spell
augroup END
