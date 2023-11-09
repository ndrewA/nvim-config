return {
    "nvim-telescope/telescope.nvim",
    config = function()
        require('telescope').setup{
            defaults = {
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case'
                },
            }
        }

        -- Keymaps are set directly in the config function to ensure they are only
        -- registered after Telescope is loaded.
        local opts = { noremap = true, silent = true }
        local keymap = vim.api.nvim_set_keymap

        keymap('n', '<leader>f', ':Telescope find_files<CR>', opts)
        keymap('n', '<leader>g', ':Telescope live_grep<CR>', opts)
    end,
    cmd = {"Telescope"}, -- This ensures that Telescope is only loaded when you use a Telescope command
    requires = { {'nvim-lua/plenary.nvim'} } -- Required dependency for Telescope
}
