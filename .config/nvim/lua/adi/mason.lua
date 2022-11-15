require("mason").setup({
    PATH = "prepend", -- "skip" seems to cause the spawning error
})
local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
    return
end

-- Extension to bridge mason.nvim with the lspconfig plugin
mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed.
    ensure_installed = { 'sumneko_lua', 'clangd', 'texlab', 'pyright', 'vimls', 'html', 'bashls' },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = {
    on_attach = require("adi.lsp.keymaps").wk_on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
}

mason_lspconfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- Default handler (optional)
        lspconfig[server_name].setup {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
        }
    end,

    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,

            settings = {
                Lua = {
                    -- Tells Lua that a global variable named vim exists to not have warnings when configuring neovim
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
        })
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,

            settings = {
                python = {
                    analysis = {
                        -- Disable strict type checking
                        typeCheckingMode = "off"
                    }
                }
            },
        })
    end,

})

