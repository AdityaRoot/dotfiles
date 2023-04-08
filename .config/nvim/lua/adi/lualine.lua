require('lualine').setup {
    options = {
        theme = 'kanagawa'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'encoding', 'branch', 'diff', 'diagnostics', {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
        } },
        lualine_c = { 'filename',
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
