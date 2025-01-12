local wk = require("which-key")
wk.add({
  {
    mode = { "n"}, -- NORMAL mode commands
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
    { "<leader>a", "<cmd>Alpha<cr>", desc = "Start Screen" },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
    { "<leader>c", "<cmd>Bdelete!<cr>", desc = "Close Buffer" },
    { "<leader>h", "<cmd>nohlsearch<cr>", desc = "Remove Highlight" },
    { "<leader>n", "<cmd>Navbuddy<cr>", desc = "Navigate" },
    { "<leader>d", "<cmd>lua require('notify').dismiss({silent = true, pending = true})<cr>", desc = "Dismiss Notifs" },
  },

    -- Telescope
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sC", "<cmd>Telescope colorscheme<cr>", desc = "Colorschemes", nowait = true, remap = false },
    { "<leader>sF", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Live Grep", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sb", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers", nowait = true, remap = false },
    { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{})<cr>", desc = "Find files", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sp", "<cmd>lua require('telescope').extensions.neoclip.default()<cr>", desc = "Neoclip", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>ss", "<cmd>Telescope symbols<cr>", desc = "Find Help", nowait = true, remap = false },

    -- ToggleTerm Commands
    { "<leader>t", group = "Terminal", nowait = true, remap = false },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float", nowait = true, remap = false },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal", nowait = true, remap = false },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical", nowait = true, remap = false },
    { "<leader>P", "<cmd>set spell!<cr>", desc = "sPell Toggle", nowait = true, remap = false },
})
