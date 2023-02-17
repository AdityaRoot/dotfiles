local opts = { noremap = true, silent = true}


local keymap = vim.api.nvim_set_keymap

-- Remap space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --

-- Easier window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert Mode --
-- Visual Mode --

--dont go out of indent mode when visually indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- Misc
-- keymap("n", "cJ", ":SplitjoinJoin<CR>", opts)
-- keymap("n", "cS", ":SplitjoinSplit<CR>", opts)

-- Nvim-tree

-- keymap("", "<leader>e", ":NvimTreeToggle<cr>", opts)
