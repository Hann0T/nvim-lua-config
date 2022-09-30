local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("hann0t.lsp.lsp-installer")
require("hann0t.lsp.handlers").setup()

