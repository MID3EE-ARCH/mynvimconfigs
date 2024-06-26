local config = function()
	require("bufferline").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			color_icons = true,
		},
		highlights = {
			fill = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			background = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			buffer_selected = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			buffer_visible = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			close_button = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			close_button_selected = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			close_button_visible = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			separator = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			separator_selected = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
			separator_visible = {
				ctermbg = "24283b",
				bg = "#24283b",
			},
		},
	})
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	config = config,
}
