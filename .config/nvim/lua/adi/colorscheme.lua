-- Set style to dark/night
vim.g.tokyonight_style = "night"
vim.g.tokyonight_transparent = true

require("no-clown-fiesta").setup({
  transparent = false, -- Enable this to disable the bg color
  styles = {
    -- You can set any of the style values specified for `:h nvim_set_hl`
    comments = {},
    keywords = {},
    functions = {},
    variables = {},
    type = { bold = true },
    lsp = { underline = true }
  },
})

-- configure catppuccin
require("catppuccin").setup({
    transparent_background = false,
    which_key = true,
    indent_blankline = {
        enabled = true,
        colored_indent_levels = true,
    },
})

require('rose-pine').setup({
    --- @usage 'main' | 'moon'
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = true,
    disable_float_background = false,
    disable_italics = false,
    --- @usage string hex value or named color from rosepinetheme.com/palette
    groups = {
        background = 'base',
        panel = 'surface',
        border = 'highlight_med',
        comment = 'muted',
        link = 'iris',
        punctuation = 'subtle',
        error = 'love',
        hint = 'iris',
        info = 'foam',
        warn = 'gold',
        headings = {
            h1 = 'iris',
            h2 = 'foam',
            h3 = 'rose',
            h4 = 'gold',
            h5 = 'pine',
            h6 = 'foam',
        }
        -- or set all headings at once
        -- headings = 'subtle'
    },
    -- Change specific vim highlight groups
    highlight_groups = {
        ColorColumn = { bg = 'rose' }
    }
})

require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    transparent_mode = false,
    overrides = {

    },
})
require('nvim-tundra').setup({
    transparent_background = false,
    dim_inactive_windows = {
        enabled = false,
        color = nil,
    },
    editor = {
        search = {},
        substitute = {},
    },
    syntax = {
        booleans = { bold = true, italic = true },
        comments = { bold = true, italic = true },
        conditionals = {},
        constants = { bold = true },
        fields = {},
        functions = {},
        keywords = {},
        loops = {},
        numbers = { bold = true },
        operators = { bold = true },
        punctuation = {},
        strings = {},
        types = { italic = true },
    },
    diagnostics = {
        errors = {},
        warnings = {},
        information = {},
        hints = {},
    },
    plugins = {
        lsp = true,
        treesitter = true,
        nvimtree = true,
        cmp = true,
        context = true,
        dbui = true,
        gitsigns = true,
        telescope = true,
    },
    overwrite = {
        colors = {},
        highlights = {},
    },
})

vim.opt.background = 'dark'
-- Mellow setup
vim.g.mellow_transparent = true
require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { italic = true },
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,    -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false,     -- do not set background color
    dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,     -- adjust window separators highlight for laststatus=3
    terminalColors = true,   -- define vim.g.terminal_color_{0,17}
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    theme = "default", -- Load "default" theme or the experimental "light" theme
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- TRANSPARENT FLOATING WINDOWS
            NormalFloat = { bg = "none" },
            FloatBorder = { bg = "none" },
            -- Save an hlgroup with dark background and dimmed foreground
            -- so that you can use it where your still want darker windows.
            -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
            NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            -- BORDERLESS TELESCOPE
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            -- DARK COMPLETION POP UP MENU
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
})

-- set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme gruvbox')
vim.cmd('colorscheme kanagawa')
-- vim.cmd('colorscheme melange')
-- vim.cmd('colorscheme mellow')
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd[[colorscheme catppuccin]]
