require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'savq/melange-nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        "folke/lsp-trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
end)
