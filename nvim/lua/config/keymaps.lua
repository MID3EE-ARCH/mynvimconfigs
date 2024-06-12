-- Set leader key to space
vim.g.mapleader = " "

-- Function for creating mappings
local mapkey = require("util.keymapper").mapvimkey

-- Remap Ctrl+U and Ctrl+D to move 7 lines up and down
vim.api.nvim_set_keymap('n', '<C-u>', '8k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-d>', '8j', { noremap = true, silent = true })

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>bd", "bd", "n") -- Close current buffer

-- Directory Navigation
-- mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>m", "NvimTreeToggle", "n")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Pane and Window Navigation
mapkey("<C-h>", "<C-w>h", "n") -- Navigate Left
mapkey("<C-j>", "<C-w>j", "n") -- Navigate Down
mapkey("<C-k>", "<C-w>k", "n") -- Navigate Up
mapkey("<C-l>", "<C-w>l", "n") -- Navigate Right
mapkey("<C-h>", "wincmd h", "t") -- Navigate Left
mapkey("<C-j>", "wincmd j", "t") -- Navigate Down
mapkey("<C-k>", "wincmd k", "t") -- Navigate Up
mapkey("<C-l>", "wincmd l", "t") -- Navigate Right
mapkey("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
mapkey("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
mapkey("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
mapkey("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<C-Up>", "resize +2", "n")
mapkey("<C-Down>", "resize -2", "n")
mapkey("<C-Left>", "vertical resize +2", "n")
mapkey("<C-Right>", "vertical resize -2", "n")

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Notes
mapkey("<leader>ng", "Neorg workspace general", "n")
mapkey("<leader>nw", "Neorg workspace work", "n")
mapkey("<leader>ny", "Neorg workspace youtube", "n")

-- Indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- Zen Mode
vim.api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>sm", ":TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Comments
vim.api.nvim_set_keymap("n", "<C-f>", "gtc", { noremap = false })

-- Define a keymap to toggle between themes
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua require("theme").toggle_theme()<CR>', { noremap = true, silent = true })

-- Move line down in normal mode
vim.api.nvim_set_keymap('n', '<Leader>j', ':m .+1<CR>==', { noremap = true, silent = true })

-- Move line up in normal mode
vim.api.nvim_set_keymap('n', '<Leader>k', ':m .-2<CR>==', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tt', ':lua toggle_transparency()<CR>', { noremap = true, silent = true })

-- Move blocks up and down and also indent
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {})
vim.api.nvim_set_keymap("v", "K", ":m '>-2<CR>gv=gv", {})
