local M = {}

local wk = require("which-key")

M.on_attach = function()
    -- -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    --
    -- -- Mappings.
    -- -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
end
M.wk_on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
    wk.register({
        ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
        ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Decleration" }
    })
    wk.register({
        l = {
            name = "LSP",
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            -- c = { "<cmd>Neogen<cr>", "Neogenerate"},
            w = {
                name = "Workspaces",
                a = { "<cmd> lua vim.lsp.buf.add_workspace_folder<cr>", "Add workspace dir" },
                r = { "<cmd> lua vim.lsp.buf.remove_workspace_folder<cr>", "Remove workspace dir" },
                l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace dirs" },
            },
            f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
            i = { "<cmd>LspInfo<cr>", "Info" },
            I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
            l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
            R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
            -- p = { "<cmd>lua require('zippy').insert_print()<CR>", "Zippy Comment"},
        }, }, { prefix = "<leader>" })
end

return M
