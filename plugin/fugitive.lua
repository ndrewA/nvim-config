local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>gs', ':Gstatus<CR>', opts)
keymap('n', '<leader>gc',
    ':lua ' ..
    'local msg = vim.fn.input("Commit message: "); ' ..
    'if msg ~= "" then ' ..
    '  vim.cmd(":Gcommit " .. vim.fn.shellescape(msg)) ' ..
    'end' ..
    '<CR>',
    opts
)
keymap('n', '<leader>ps', ':Gpush<CR>', opts)
