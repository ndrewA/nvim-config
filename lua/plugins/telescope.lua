return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_config = {
					width = 0.80,
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = { mirror = false },
					vertical = { mirror = false },
				},
                find_command = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case'
                },


                prompt_prefix = "  ",
				selection_caret = "  ",
				entry_prefix = "  ",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",

                mappings = {
                    i = {
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                        ["<esc>"] = actions.close,
                        ["<CR>"] = actions.select_default + actions.center,
                    },
                    n = {
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                    },
                },
            },
        })

        -- Key mappings
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', opts)
        vim.api.nvim_set_keymap('n', '<leader>g', ':Telescope live_grep<CR>', opts)
    end,
}
