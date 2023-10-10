require'lspconfig'.clangd.setup{
    init_options = {
        compilationDatabaseDirectory = "build",
        clangdFileStatus = true,
        clangTidy = true,
        clangTidyChecks = "-*,modernize-*",
        fallbackFlags = { "-std=c++20" }
    }
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- go to definition
keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts) -- go to declaration
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- find references
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) -- go to implementation
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- show hover
keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- signature help
keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- rename symbol
keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- code action
keymap('n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts) -- show line diagnostics
keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts) -- go to previous diagnostic
keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts) -- go to next diagnostic
keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) -- set location list
