" New error pattern without the underscore
syn match markdownError "\w\@<=\w\@="

" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

syn match highlight_code '`[^`].\{-}`'
syn region highlight_code start='```' end='```'
hi link highlight_code Function
