require('lualine').setup {
    options = {
        theme = 'nightfly',
        section_separators = "",
		component_separators = "",
        always_divide_middle = true,
		globalstatus = true,
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'diagnostics'},
        lualine_x = {''},
        lualine_y = {''},
        lualine_z = {''},
    }
}
