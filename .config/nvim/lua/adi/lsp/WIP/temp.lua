
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = { 'sumneko_lua', 'clangd', 'texlab', 'pylsp', 'vimls', 'html', 'bashls' }
})

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
local wk_on_attach = require("adi.lsp.keymaps").wk_on_attach

mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler (optional)
        lspconfig[server_name].setup {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
        }
    end,
})

-- local servers = { 'sumneko_lua', 'clangd', 'texlab', 'pylsp', 'vimls', 'html', 'bashls' }
-- for _, lsp in ipairs(servers) do
--     lspconfig[lsp].setup {
--         on_attach = wk_on_attach,
--         capabilities = capabilities,
--     }
-- end
--
-- lspconfig.sumneko_lua.setup {
--     on_attach = wk_on_attach,
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { "vim" },
--             },
--             workspace = {
--                 library = {
--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                     [vim.fn.stdpath("config") .. "/lua"] = true,
--                 },
--             },
--         },
--     },
-- }



require("fidget").setup()
