vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.cmd[[ autocmd VimEnter * highlight Normal guibg=NONE ctermbg=NONE ]]

vim.cmd [[ autocmd BufWritePre *.cpp,*.hpp,*.h silent Neoformat ]]
