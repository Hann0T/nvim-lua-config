local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may alse register handlers on specific server instances
-- insterad.
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("hann0t.lsp.handlers").on_attach,
        capabilities = require("hann0t.lsp.handlers").capabilities,
    }

    server:setup(opts)
end)
