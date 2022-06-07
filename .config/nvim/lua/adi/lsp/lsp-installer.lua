local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Registers handler that will be called for all installed servers

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("adi.lsp.handlers").on_attach,
        capabilities = require("adi.lsp.handlers").capabilities,
    }
    if server.name == "sumneko_lua" then
        local sumneko_opts = require("adi.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
end)

