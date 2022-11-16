local M = require("hann0t.lsp.handlers")

require("lspconfig").tsserver.setup {
    on_attach = M.on_attach
}

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = M.on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        },

    }
})

require("lspconfig").intelephense.setup {
    on_attach = M.on_attach
}

require("lspconfig").sumneko_lua.setup {
    on_attach = M.on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        },
        workspace = {
            library = vim.api.nvim_get_runtime_file("", true)
        }
    }
}

require("lspconfig").gopls.setup {
    on_attach = M.on_attach,
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

--require("lspconfig").volar.setup(config({
--    filetypes = { 'vue' },
--    init_options = {
--        typescript = {
--            serverPath = '/opt/homebrew/lib/node_modules/typescript/lib/tsserverlibrary.js',
--        }
--    }
--}))
