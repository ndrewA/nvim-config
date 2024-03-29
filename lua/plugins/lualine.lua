return {
   "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                -- theme = 'catppuccin',
                section_separators = "",
                component_separators = "",
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diagnostics'},
                lualine_c = {{'filename', path = 1}},
                lualine_x = {''},
                lualine_y = {''},
                lualine_z = {'filetype'},
            }
        }
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    event = "VimEnter",
}
