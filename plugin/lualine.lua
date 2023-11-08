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
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {''},
        lualine_y = {''},
        lualine_z = {''},
    }
}
