-- ~/.config/nvim/lua/config/theme_toggle.lua

-- Define the available themes
local themes = { "neofusion", "tokyonight","catppuccin", "gruvbox" }
local current_theme_index = 1

-- Function to toggle between themes
function _G.toggle_theme()
    current_theme_index = current_theme_index % #themes + 1
    vim.cmd("colorscheme " .. themes[current_theme_index])
    vim.notify("Switched to " .. themes[current_theme_index] .. " theme")
end

-- Map the key combination <leader>gtk to toggle themes
vim.api.nvim_set_keymap('n', '<leader>gg', ':lua toggle_theme()<CR>', { noremap = true, silent = true })



