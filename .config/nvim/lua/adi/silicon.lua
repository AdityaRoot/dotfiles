-- require("silicon").setup({
--     output = ("/home/adi/dev/screenshots/SILICON_${year}-${month}-${date}-${time}.png"),
--     theme = "auto",
--     bgColor = vim.g.terminal_color_6,
--     -- 0 is black, 2 green, 3 yellow, 4 blue, 6/14 is a v nice green, 7 is beigey,
--     bgImage = "", -- path to image, must be png
--     roundCorner = true,
--     windowControls = true,
--     lineNumber = true,
--     font = "monospace",
--     lineOffset = 1, -- from where to start line number
--     linePad = 2, -- padding between lines
--     padHoriz = 80, -- Horizontal padding
--     padVert = 100, -- vertical padding
--     shadowBlurRadius = 10,
--     shadowColor = "#555555",
--     shadowOffsetX = 8,
--     shadowOffsetY = 8,
--     gobble = false, -- enable lsautogobble like feature
--     debug = false, -- enable debug output
-- })
--
require('silicon').setup({
    -- -- Output configuration for the saved image
    output = {
        -- (string) The full path of the file to save to.
        -- file = "",
        -- (boolean) Whether to copy the image to clipboard instead of saving to file.
        clipboard = true,
        -- (string) Where to save images, defaults to the current directory.
        --  e.g. /home/user/Pictures
        path = "/home/adi/images/screenshots",
        -- (string) The filename format to use. Can include placeholders for date and time.
        -- https://time-rs.github.io/book/api/format-description.html#components
        format = "silicon_[year][month][day]_[hour][minute][second].png",
    },
    -- -- Font and theme configuration for the screenshot.
    -- -- font = 'Hack=20', -- (string) The font and font size to use for the screenshot.
    -- -- (string) The color theme to use for syntax highlighting.
    -- -- It can be a theme name or path to a .tmTheme file.
    theme = 'gruvbox', -- -- Background and shadow configuration for the screenshot
    background = '#6A9589', -- (string) The background color for the screenshot.
    shadow = {
        blur_radius = 10.0,  -- (number) The blur radius for the shadow, set to 0.0 for no shadow.
        offset_x = 8,       -- (number) The horizontal offset for the shadow.
        offset_y = 8,       -- (number) The vertical offset for the shadow.
        color = '#555'      -- (string) The color for the shadow.
    },
    -- pad_horiz = 100,           -- (number) The horizontal padding.
    -- pad_vert = 80,             -- (number) The vertical padding.
    line_number = true, -- (boolean) Whether to show line numbers in the screenshot.
    -- line_pad = 2,              -- (number) The padding between lines.
    -- line_offset = 1,           -- (number) The starting line number for the screenshot.
    -- tab_width = 4,             -- (number) The tab width for the screenshot.
    gobble = true,            -- (boolean) Whether to trim extra indentation.
    -- highlight_selection = false, -- (boolean) Whether to capture the whole file and highlight selected lines.
    -- round_corner = true,
    -- window_controls = true,    -- (boolean) Whether to show window controls (minimize, maximize, close) in the screenshot.
    -- window_title = nil,        -- (function) A function that returns the window title as a string.
})
