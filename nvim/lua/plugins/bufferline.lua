local config = function()
	require("bufferline").setup({
		options = {
      lazy = false,
			theme = "auto",
			globalstatus = true,
			color_icons = true,
		},
    highlights = {
      buffer_selected = {
        fg = "#ffffff",
        gui = "bold",
        bg = "NONE",
      }
    }
	})
end

return {
	"akinsho/bufferline.nvim",
  lazy = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = config,
}
