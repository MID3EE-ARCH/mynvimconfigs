-- ~/.config/nvim/lua/plugins/theme.lua
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,  -- Ensure it is loaded immediately for default settings
        config = function()
            -- Optional: Add any additional configuration for the tokyonight theme here
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,  -- Ensure it is loaded immediately for default settings
        config = function()
            require("catppuccin").setup({
                -- Optional: Add any additional configuration for the catppuccin theme here
            })
        end,
    },
    {
        "morhetz/gruvbox",
        lazy = false,  -- Ensure it is loaded immediately for default settings
        config = function()
            -- Optional: Add any additional configuration for the gruvbox theme here
        end,
    },
}

