-- :help options
local options = {
    expandtab = true,               -- convert tabs to spaces
    shiftwidth = 4,                 -- each tab press = 4 spaces
    softtabstop = 4,                -- each tab is 4 spaces
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

--  LaTeX specific
    conceallevel = 1,               -- conceal level used for LaTeX
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
