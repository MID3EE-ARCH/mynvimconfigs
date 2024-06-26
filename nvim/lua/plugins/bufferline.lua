local config = function()
	require("bufferline").setup({
		options = {
			color_icons = true,
			theme = "tokyonight",
		},
    highlights = {
      fill={
        ctermbg = '24283b',
        bg = '#24283b',
      }
    }
	})
end

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	config = config,
}
