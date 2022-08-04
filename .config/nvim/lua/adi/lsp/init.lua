local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local wk_on_attach = require("adi.lsp.keymaps").wk_on_attach
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'sumneko_lua', 'clangd', 'ltex', 'texlab', 'pylsp', 'vimls', 'html', 'bashls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = wk_on_attach,
        capabilities = capabilities,
    }
end

lspconfig.sumneko_lua.setup {
    on_attach = wk_on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}

require("fidget").setup()
-- local util = require "lspconfig.util"

-- util.default_config = vim.tbl_extend(
--     "force",
--     util.default_config,
--     {
--         autostart = false,
--         capabilities = { my_capabilities = "here" }
--     }
-- )
