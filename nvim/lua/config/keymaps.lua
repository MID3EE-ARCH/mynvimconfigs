-- Set leader key to space
vim.g.mapleader = " "

-- Function for creating mappings
local mapkey = require("util.keymapper").mapvimkey

-- Remap Ctrl+U and Ctrl+D to move 7 lines up and down
vim.api.nvim_set_keymap("n", "<C-u>", "8k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-d>", "8j", { noremap = true, silent = true })

-- Buffer Navigation
mapkey("<leader>bn", "bnext", "n") -- Next buffer
mapkey("<leader>bp", "bprevious", "n") -- Prev buffer
mapkey("<leader>bb", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>`", "e #", "n") -- Switch to Other Buffer
mapkey("<leader>bd", "bd", "n") -- Close current buffer

-- Directory Navigation
mapkey("<leader>m", "NvimTreeToggle", "n")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- debugging
vim.api.nvim_set_keymap(
	"n",
	"<leader>db",
	'<cmd>lua require("dap").toggle_breakpoint()<cr>',
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>dr", '<cmd>lua require("dap").continue()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ss", '<cmd>lua require("dap").step_over()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>si", '<cmd>lua require("dap").step_into()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>so", '<cmd>lua require("dap").step_out()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sc", '<cmd>lua require("dap").continue()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	'<cmd>lua require("dap").disconnect()<cr>',
	{ noremap = true, silent = true }
)

-- pane and window navigation
mapkey("<c-h>", "<c-w>h", "n") -- navigate left
mapkey("<c-j>", "<c-w>j", "n") -- navigate down
mapkey("<c-k>", "<c-w>k", "n") -- navigate up
mapkey("<c-l>", "<c-w>l", "n") -- navigate right
mapkey("<c-h>", "wincmd h", "t") -- navigate left
mapkey("<c-j>", "wincmd j", "t") -- navigate down
mapkey("<c-k>", "wincmd k", "t") -- navigate up
mapkey("<c-l>", "wincmd l", "t") -- navigate right
mapkey("<c-h>", "tmuxnavigateleft", "n") -- navigate left
mapkey("<c-j>", "tmuxnavigatedown", "n") -- navigate down
mapkey("<c-k>", "tmuxnavigateup", "n") -- navigate up
mapkey("<c-l>", "tmuxnavigateright", "n") -- navigate right

-- window management
mapkey("<leader>sv", "vsplit", "n") -- split vertically
mapkey("<leader>sh", "split", "n") -- split horizontally
mapkey("<c-up>", "resize +2", "n")
mapkey("<c-down>", "resize -2", "n")
mapkey("<c-left>", "vertical resize +2", "n")
mapkey("<c-right>", "vertical resize -2", "n")

-- show full file-path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- show full file path

-- notes
mapkey("<leader>ng", "neorg workspace general", "n")
mapkey("<leader>nw", "neorg workspace work", "n")
mapkey("<leader>ny", "neorg workspace youtube", "n")

-- indenting
vim.keymap.set("v", "<", "<gv", { silent = true, noremap = true })
vim.keymap.set("v", ">", ">gv", { silent = true, noremap = true })

-- zen mode
vim.api.nvim_set_keymap("n", "<leader>zn", ":tznarrow<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>sm", ":tzfocus<cr>", {})
vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>tznarrow<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>zm", ":tzminimalist<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>za", ":tzataraxis<cr>", {})

-- comments
vim.api.nvim_set_keymap("n", "<c-f>", "gtc", { noremap = false })

-- define a keymap to toggle between themes
vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	'<cmd>lua require("theme").toggle_theme()<cr>',
	{ noremap = true, silent = true }
)

-- move line down in normal mode
vim.api.nvim_set_keymap("n", "<leader>j", ":m .+1<cr>==", { noremap = true, silent = true })

-- move line up in normal mode
vim.api.nvim_set_keymap("n", "<leader>k", ":m .-2<cr>==", { noremap = true, silent = true })

-- move blocks up and down and also indent
vim.api.nvim_set_keymap("v", "J", ":m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<cr>gv=gv", { noremap = true, silent = true })
