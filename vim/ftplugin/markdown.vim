" Highlight double white spaces for markdown
let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
highlight DoubleSpace ctermbg=blue guibg=blue
augroup mdgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.md call matchadd('DoubleSpace', dsMatch)
augroup END

setlocal tw=80
setlocal nonumber
setlocal spell
