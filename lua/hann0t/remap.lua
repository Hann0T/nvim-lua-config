local Remap = require("hann0t.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local xnoremap = Remap.xnoremap
local inoremap = Remap.inoremap

-- open Netrw 
nnoremap("<leader>op", "<cmd>Ex<CR>")

inoremap("jk", "<Esc>")

-- move lines in visual mode
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- scroll and center the cursor in the middle
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- VSplit resize
nnoremap("<Leader>w>", "5<C-w>>")
nnoremap("<Leader>w<", "5<C-w><")

-- Split resize
nnoremap("<Leader>w-", "5<C-w>-")
nnoremap("<Leader>w+", "5<C-w>+")

-- Maximize split
nnoremap("<Leader>wo", "100<C-w>+ 100<C-w>>")

nnoremap("<leader>ff","<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg","<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb","<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh","<cmd>Telescope help_tags<cr>")

