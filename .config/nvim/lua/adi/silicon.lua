-- require('silicon').setup({
--
--   -- theme = "kanagawa",
--   output = "SILICON_${year}-${month}-${date}_${time}.png", -- auto generate file name based on time (absolute or relative to cwd)
--   bgColor = vim.g.terminal_color_5,
--   bgImage = "", -- path to image, must be png
--   roundCorner = true,
--   windowControls = true,
--   lineNumber = true,
--   font = "monospace",
--   lineOffset = 1, -- from where to start line number
--   linePad = 2, -- padding between lines
--   padHoriz = 80, -- Horizontal padding
--   padVert = 100, -- vertical padding
--   shadowBlurRadius = 10,
--   shadowColor = "#555555",
--   shadowOffsetX = 8,
--   shadowOffsetY = 8,
--   gobble = false, -- enable lsautogobble like feature
--   debug = false, -- enable debug output
--
-- })
--
require('silicon').setup {
  font = 'FantasqueSansMono Nerd Font=26',
  background = '#87f',
  theme = 'Monokai Extended',
  line_number = true,
  pad_vert = 80,
  pad_horiz = 50,
  output = {
    path = "/home/krivah/Pictures/Screenshots"
  },
  watermark = {
    text = ' @krivahtoo',
  },
  window_title = function()
    return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
  end,
}
