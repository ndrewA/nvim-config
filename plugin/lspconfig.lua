require'lspconfig'.clangd.setup{
    cmd = {
        "clangd",
        "--background-index",
        "--log=error",
    },

    init_options = {
        clangdFileStatus = true,
        clangTidy = true,
        clangTidyChecks = "-*,modernize-*",
        fallbackFlags = { "-std=c++20" }
    },
}

-- custom diagonstic symbols
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true
})

vim.o.updatetime = 250

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- signature help

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- go to declaration
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- find references
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- show hover
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename symbol
keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code action
