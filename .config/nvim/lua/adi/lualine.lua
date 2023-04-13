
-- Fix for macro recording
local function macro_recording()
	local mode = require("noice").api.statusline.mode.get()
	if mode then
		return string.match(mode, "^recording @.*") or ""
	end
	return ""
end

require('lualine').setup {
    options = {
        theme = 'kanagawa'
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'encoding', 'branch', 'diff', 'diagnostics', {
            macro_recording,
            color = { fg = "#ff9e64" },
        } },
        lualine_c = { 'filename',
            {
                function()
                    return require("nvim-navic").get_location()
                end,
                cond = function()
                    return require("nvim-navic").is_available()
                end
            },
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
