return {
    "nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",
	event = "bufWinEnter",

    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"cpp", "lua"},

            sync_install = false,
			auto_install = true,

            modules = {},
            ignore_install = {},

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }

    end,
}
