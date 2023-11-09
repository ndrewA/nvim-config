return {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'buffer' },
                { name = 'path' },
            },
            mapping = {
                ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-d>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.close(),
                ['<C-q>'] = cmp.mapping.close(),
            },
        })
    end,
    event = "InsertEnter", -- You might want to load the completion plugin as you enter insert mode
    requires = {
        "hrsh7th/cmp-nvim-lsp", -- and any other sources you might have
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
    },
    after = "nvim-lspconfig", -- Make sure to load after LSP config if it's providing sources
}
