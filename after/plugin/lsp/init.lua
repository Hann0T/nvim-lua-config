local Remap = require("hann0t.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap
local cmp = require("cmp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- Set up lspconfig.
local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
        on_attach = function()
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
                    filter = function(code_action)
                        if not code_action or not code_action.data then
                            return false
                        end

                        local data = code_action.data.id
                        return string.sub(data, #data - 1, #data) == ":0"
                    end,
                    apply = true
                })
            end)
            nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
            nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
            nnoremap("<leader>fa", function() vim.lsp.buf.formatting() end)
        end,
    }, _config or {})
end

require("lspconfig").tsserver.setup(config())

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>vca", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- vim.keymap.set("n", "gd", rt.definition)
        end,
    },
})

-- require("lspconfig").rust_analyzer.setup(config({
--     settings = {
--         rust = {
--             tools = { -- rust-tools options
--                 autoSetHints = true,
--                 hover_with_actions = true,
--                 inlay_hints = {
--                     show_parameter_hints = false,
--                     parameter_hints_prefix = "",
--                     other_hints_prefix = "",
--                 },
--             },
--             server = {
--                 -- on_attach is a callback called when the language server attachs to the buffer
--                 -- on_attach = on_attach,
--                 settings = {
--                     ["rust-analyzer"] = {
--                         -- enable clippy on save
--                         checkOnSave = {
--                             command = "clippy"
--                         },
--                     }
--                 }
--             },
--         }
--     }
-- }))

require("lspconfig").intelephense.setup(config())

require("lspconfig").sumneko_lua.setup(config({
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
}))

require("lspconfig").volar.setup(config({
    filetypes = { 'vue' }
}))
