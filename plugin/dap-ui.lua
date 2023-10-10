require("dapui").setup()

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>dua', ':lua require("dapui").toggle()<CR>', opts) -- toggle dap-ui
keymap('n', '<leader>de', ':lua require("dapui").eval()<CR>', opts) -- evaluate expression
