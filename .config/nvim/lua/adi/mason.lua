require("mason").setup({
    -- PATH = "prepend", -- "skip" seems to cause the spawning error
})
local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    vim.notify("Couldn't load Mason-LSP-Config" .. mason_lspconfig, "error")
    return
end

-- Extension to bridge mason.nvim with the lspconfig plugin
mason_lspconfig.setup({
    -- A list of servers to automatically install if they're not already installed.
    ensure_installed = { 'lua_ls', 'clangd', 'texlab', 'pyright', 'vimls', 'html', 'bashls' },
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local opts = {
    on_attach = require("adi.lspkeymaps").wk_on_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities),
}

-- require('nvim-navic').setup()
-- opts.on_attach = function(client, bufnr)
--     require("nvim-navic").attach(client,bufnr)
-- end
-- Clangd override
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--     if msg:match("warning: multiple different client offset_encodings") then
--         return
--     end
--
--     notify(msg, ...)
-- end

-- Fixing cland error with multiple client offset_encodings
opts.capabilities.offsetEncoding = { "utf-16" }

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
    ["clangd"] = function()
        lspconfig.clangd.setup {
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            init_options = {

            },
        }
    end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
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
    ["texlab"] = function()
        lspconfig.texlab.setup({
            on_attach = opts.on_attach,
            capabilities = opts.capabilities,
            cmd = { "texlab" },

            -- settings = {
            --     latex = {
            --         build = {
            --             onSave = true,
            --         },
            --         forwardSearch = {
            --             executable = "zathura",
            --             args = { "--synctex-forward", "%l:1:%f", "%p" },
            --         },
            --         lint = {
            --             onChange = true,
            --         },
            --     },
            -- },
        })
    end,

})
