-- remove trailing spaces after a file save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- make background ( possibly ) transparent
vim.cmd[[ autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE ]]

-- save cursor position when formating, after a file save
_G.clang_format = function()
    local style_path = vim.fn.stdpath('config') .. "/config/.clang-format"
    local cmd = string.format("%%!clang-format -style=file:%s", style_path)

    -- Save cursor position
    local winview = vim.fn.winsaveview()

    -- Execute clang-format
    vim.cmd(cmd)

    -- Restore cursor position
    vim.fn.winrestview(winview)
end

-- format using clang when save
vim.api.nvim_exec([[
augroup clang_format
    autocmd!
    autocmd BufWritePre *.cpp,*.h,*.c,*.hpp lua clang_format()
augroup END
]], false)

-- add #pragma once to every header file
vim.api.nvim_exec([[
augroup auto_pragma_once
  autocmd!
  autocmd BufNewFile *.h,*h.in,*.hpp silent! 0put =['#pragma once', '']
augroup END
]], false)

-- update lsp every time file is saved
vim.cmd [[
    autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})
    autocmd BufWritePost * lua vim.diagnostic.show()
]]

-- save every 5 minutes
vim.fn.timer_start(300000, function()
    vim.cmd('wa')
    vim.cmd('echo "(Autosaved)"')
end, {['repeat'] = -1})

