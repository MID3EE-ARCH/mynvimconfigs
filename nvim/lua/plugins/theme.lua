-- ~/.config/nvim/lua/plugins/theme.lua
return {
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Ensure it is loaded immediately for default settings
		config = function()
			-- Optional: Add any additional configuration for the tokyonight theme here
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Ensure it is loaded immediately for default settings
		config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        transparent_background = true
      })
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		config = function()
			local osaka = require("solarized-osaka")
			osaka.setup({
				terminal_colors = true,
				transparent = false,
			})
		end,
	},
	{
		"morhetz/gruvbox",
		lazy = false, -- Ensure it is loaded immediately for default settings
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
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
			})
		end,
	},
}
