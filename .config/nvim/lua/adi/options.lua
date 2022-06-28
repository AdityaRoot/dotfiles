-- :help options
local options = {
    expandtab = true,                 -- convert tabs to spaces
    shiftwidth = 4,                 -- each tab press = 4 spaces
    softtabstop = 4,                -- each tab is 4 spaces
    tabstop = 4,
    clipboard =  "unnamedplus",     -- allows nvim to use sys clipboard
    relativenumber = true,          -- relative line numbering
    number = true,                  -- Makes it to current line num is correct
    fileencoding = "utf-8",         -- file encoding format
    mouse = "a",                    -- allow mouse to be used
    pumheight = 10,                 -- pop up menu height, to try out
    smartcase = true,               -- enables smart casing
    smartindent = true,             -- enables smart indenting
    updatetime = 500,               -- faster completion (default is 4000)
    signcolumn = "yes",             -- always make sign col show up
    timeoutlen = 500,               -- Timeout length for whichkey
    list = true,


-- Enable TreeSitter Folding
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",


--  LaTeX specific
    conceallevel = 1,               -- conceal level used for LaTeX
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

local augg vim.api.nvim_create_augroup("Treesitter Folding AuGroup", { clear = true})
vim.api.nvim_create_autocmd("BufWinEnter", {command = "silent! %foldopen!", group = augg})

vim.cmd([[set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·]]) -- EOL Character is defined in indent.lua
vim.cmd([[set showbreak=↪\]])

