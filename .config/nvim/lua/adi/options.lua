-- :help options
local options = {
    expandtab = true,             -- convert tabs to spaces
    shiftwidth = 4,               -- each tab press = 4 spaces
    softtabstop = 4,              -- each tab is 4 spaces
    tabstop = 4,
    clipboard = "unnamedplus",               -- allows nvim to use sys clipboard
    relativenumber = false,                   -- relative line numbering
    number = true,                           -- Makes it to current line num is correct
    fileencoding = "utf-8",                  -- file encoding format
    mouse = "a",                             -- allow mouse to be used
    pumheight = 10,                          -- pop up menu height, to try out
    smartcase = true,                        -- enables smart casing
    smartindent = true,                      -- enables smart indenting
    updatetime = 500,                        -- faster completion (default is 4000)
    signcolumn = "yes",                      -- always make sign col show up
    timeoutlen = 500,                        -- Timeout length for whichkey
    list = true,
    guifont = 'JetBrainsMono NF',            -- Config for windows neovide
    -- spell = true,

    -- Enable TreeSitter Folding
    -- BUG: Trying to fix ufo bug by commenting following two lines
    -- foldmethod = "expr",
    -- foldexpr = "nvim_treesitter#foldexpr()",

    -- LaTeX specific
    conceallevel = 1,                        -- conceal level used for LaTeX

    -- Colorscheme shit
}
vim.cmd([[
let g:vimtex_compiler_engine = 'lualatex'
]])

for k, v in pairs(options) do
    vim.opt[k] = v
end

local augg
-- BUG: And the following 1 line
vim.api.nvim_create_augroup("Treesitter Folding AuGroup", { clear = true })
vim.api.nvim_create_autocmd("BufWinEnter", { command = "silent! %foldopen!", group = augg })
vim.api.nvim_create_autocmd("BufWinLeave", { command = "silent! mkview", group = augg })
vim.api.nvim_create_autocmd("BufWinEnter", { command = "silent! loadview", group = augg })
--

vim.cmd([[set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·]]) -- EOL Character is defined in indent.lua
vim.cmd([[set showbreak=↪\]])

-- vim.cmd([[xmap ga <Plug>(EasyAlign)]]) -- Easy align mappings
-- vim.cmd([[nmap ga <Plug>(EasyAlign)]])

vim.cmd([[
augroup cpp_detect
    au BufNewFile,BufRead *.tpp setlocal filetype=cpp
augroup end
]])
