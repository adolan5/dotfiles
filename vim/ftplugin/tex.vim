setlocal tw=80
setlocal spell
setlocal nojoinspaces

" Highlight double white spaces for Latex
if !exists("dsMatch")
  let dsMatch = '\v[^ ]\zs[ ]{2,}\ze[^ ]'
endif

highlight DoubleSpace ctermbg=blue guibg=blue
augroup texgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.tex call matchadd('DoubleSpace', dsMatch)
augroup END
