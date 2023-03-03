local Remap = require("hann0t.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
-- local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap
local silent = { silent = true }

-- open Netrw
nnoremap("<leader>op", "<cmd>Vex 25<CR>")

-- open Terminal
nnoremap("<leader>ot", "<cmd>split<CR><C-w>j<cmd>terminal<CR>i")

-- exit insert mode
inoremap("jk", "<Esc>")

-- insert in the end of line
inoremap("<C-e>", "<Esc>A")

-- insert in the start of line
inoremap("<C-a>", "<Esc>I")

-- move lines in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- scroll and center the cursor in the middle
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- VSplit spawn
nnoremap("<Leader>wv", "<cmd>vsplit<CR>")

-- VSplit spawn
nnoremap("<Leader>ws", "<cmd>split<CR>")

-- VSplit resize
nnoremap("<Leader>w>", "5<C-w>>")
nnoremap("<Leader>w<", "5<C-w><")

-- Split resize
nnoremap("<Leader>w-", "5<C-w>-")
nnoremap("<Leader>w+", "5<C-w>+")

-- Maximize split
nnoremap("<Leader>wo", "100<C-w>+ 100<C-w>>")

-- Move through splits
nnoremap('<Leader>ww', '<C-w>w')
nnoremap('<Leader>wh', '<C-w>h')
nnoremap('<Leader>wk', '<C-w>k')
nnoremap('<Leader>wj', '<C-w>j')
nnoremap('<Leader>wl', '<C-w>l')
nnoremap('<Leader>wt', '<C-w>t')
nnoremap('<Leader>wb', '<C-w>b')
nnoremap('<Leader>wq', '<C-w>q')

-- Telescope
nnoremap("<leader><leader>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>,", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- delete buffer
nnoremap("<leader>bk", ":bd<CR>")

-- Git Fugitive
nnoremap("<leader>gg", "<cmd>tab G<CR>")

-- Harpoon
nnoremap("<C-a>", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-h>", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<C-n>", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<C-t>", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<C-s>", function() require("harpoon.ui").nav_file(4) end, silent)

-- Tabs
nnoremap("<TAB>", "<cmd>tabNext<cr>")

-- kill all buffers but the current
-- :%bd|e#
