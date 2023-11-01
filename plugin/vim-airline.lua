vim.cmd [[
    let g:airline#extensions#nvimlsp#enabled = 1

    let g:airline_theme = 'powerlineish'

    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'

    let g:airline#extensions#nvimlsp#error_symbol = ' '
    let g:airline#extensions#nvimlsp#warning_symbol = ' '

    let g:airline#extensions#default#layout = [
        \ [ 'a', 'b', 'c', 'error', 'warning', '' ],
        \ [ 'x', 'y', '' ]
        \ ]
]]
