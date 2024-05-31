setlocal tw=80
setlocal nonumber norelativenumber
setlocal spell
setlocal cc=+1
setlocal nojoinspaces

" Syntax highlighting for fenced code blocks
let g:markdown_fenced_languages=["sh", "conf", "yaml", "dockerfile"]

" Highlight double white spaces for markdown
if !exists("dsMatch")
  let dsMatch = '\v[^ |>]\zs[ ]{2,}\ze[^ |]'
endif

highlight DoubleSpace ctermbg=blue guibg=blue
augroup mdgroup
  autocmd!
  autocmd BufEnter,InsertLeave *.md call matchadd('DoubleSpace', dsMatch)
augroup END
