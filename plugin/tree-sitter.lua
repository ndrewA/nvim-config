return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
            },
            ensure_installed = {"cpp", "lua"},
        }
    end,
    event = "BufRead", -- This will load treesitter when you open a buffer
    run = ":TSUpdate" -- This command is run after install/update
}
