vim.cmd [[
    let g:airline#extensions#branch#enabled = 1

    let g:airline_theme = 'minimalist'

    let g:airline#extensions#nvimlsp#error_symbol = ' '
    let g:airline#extensions#nvimlsp#warning_symbol = ' '

    let g:airline#extensions#default#layout = [
        \ [ 'a', 'b', 'c', 'error', 'warning', '' ],
        \ [ 'x', 'y', 'z' ]
        \ ]
]]
