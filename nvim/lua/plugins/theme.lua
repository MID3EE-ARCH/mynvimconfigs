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
    {
        "diegoulloao/neofusion.nvim",
        lazy = false,
        config = function()
            local neofusion = require("neofusion")
            neofusion.setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = true,
                italic = {
                    strings = true,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })

            -- Define a global variable to track transparency mode
            _G.transparent_mode = false

            -- Function to toggle transparency mode
            function _G.toggle_transparency()
                _G.transparent_mode = not _G.transparent_mode
                neofusion.setup({
                    transparent_mode = _G.transparent_mode,
                })
                -- Reload the colorscheme
                vim.cmd("colorscheme neofusion")
            end

            -- Set the initial colorscheme
            vim.cmd("colorscheme neofusion")
        end,
    },
}

