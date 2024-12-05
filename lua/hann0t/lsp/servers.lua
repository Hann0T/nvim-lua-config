local M = require("hann0t.lsp.handlers")
local lspconfig = require("lspconfig")

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
    -- add any options here, or leave empty to use the default settings
})

lspconfig.tsserver.setup {
    on_attach = M.on_attach
}

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    on_attach = M.on_attach
  },
  tools = {
    float_win_config = {
      border = 'rounded'
    }
  }
}

lspconfig.intelephense.setup {
    on_attach = M.on_attach
}

lspconfig.clangd.setup {
    on_attach = M.on_attach,
}

lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    settings = {
        Lua = {
            -- diagnostics = { globals = { "vim" } }
            completion = {
                callSnippet = "Replace"
            }
        },
    }
}

lspconfig.gopls.setup {
    on_attach = M.on_attach,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod" },
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

lspconfig.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          -- maxLineLength = 100
        }
      }
    }
  }
}

--require("lspconfig").volar.setup(config({
--    filetypes = { 'vue' },
--    init_options = {
--        typescript = {
--            serverPath = '/opt/homebrew/lib/node_modules/typescript/lib/tsserverlibrary.js',
--        }
--    }
--}))
