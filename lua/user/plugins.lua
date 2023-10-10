require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'savq/melange-nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'tpope/vim-fugitive' -- git

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'mfussenegger/nvim-dap'

    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use 'sbdchd/neoformat'

end)
