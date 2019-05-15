" Highlight double white spaces for Latex
let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
highlight DoubleSpace ctermbg=blue guibg=blue
augroup texgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.tex call matchadd('DoubleSpace', dsMatch)
augroup END

setlocal tw=80
setlocal spell
