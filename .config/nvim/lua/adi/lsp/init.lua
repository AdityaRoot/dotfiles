local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("adi.lsp.lsp-installer")
require("adi.lsp.handlers").setup()
require("fidget").setup()
