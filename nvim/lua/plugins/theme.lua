-- ~/.config/nvim/lua/plugins/theme.lua
return {
	{ "marko-cerovac/material.nvim", lazy = false, config = function() end },
	{
		"folke/tokyonight.nvim",
		lazy = false, -- Ensure it is loaded immediately for default settings
		config = function()
			-- Optional: Add any additional configuration for the tokyonight theme here
		end,
	},

	{ "dasupradyumna/midnight.nvim", lazy = false, config = function() end },
}
