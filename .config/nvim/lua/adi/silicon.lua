require("silicon").setup({
    output = ("/home/adi/dev/screenshots/SILICON_${year}-${month}-${date}-${time}.png"),
    theme = "auto",
    bgColor = vim.g.terminal_color_6,
    -- 0 is black, 2 green, 3 yellow, 4 blue, 6/14 is a v nice green, 7 is beigey, 
    bgImage = "", -- path to image, must be png
    roundCorner = true,
    windowControls = true,
    lineNumber = true,
    font = "monospace",
    lineOffset = 1, -- from where to start line number
    linePad = 2, -- padding between lines
    padHoriz = 80, -- Horizontal padding
    padVert = 100, -- vertical padding
    shadowBlurRadius = 10,
    shadowColor = "#555555",
    shadowOffsetX = 8,
    shadowOffsetY = 8,
    gobble = false, -- enable lsautogobble like feature
    debug = false, -- enable debug output
})
-- vim.api.nvim_create_augroup('SiliconRefresh', { clear = true })
-- vim.api.nvim_create_autocmd({ 'ColorScheme' },
--     {
--         group = 'SiliconRefresh',
--         callback = function()
--             silicon_utils.build_tmTheme()
--             silicon_utils.reload_silicon_cache({ async = true })
--         end,
--         desc = 'Reload silicon themes cache on colorscheme switch',
--     }
-- )
