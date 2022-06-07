
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  },
   sections = {
    lualine_a = {'mode'},
    lualine_b = {'encoding', 'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
