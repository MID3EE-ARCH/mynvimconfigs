return {
	"ThePrimeagen/harpoon",
	lazy = false,
	config = function()
		require("harpoon").setup({
			-- Your Harpoon configuration here
		})

		-- Example keymaps for Harpoon
		vim.api.nvim_set_keymap(
			"n",
			"<leader>ha",
			":lua require('harpoon.mark').add_file()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>hh",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>hn",
			":lua require('harpoon.ui').nav_next()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>hp",
			":lua require('harpoon.ui').nav_prev()<CR>",
			{ noremap = true, silent = true }
		)
		for i = 1, 9 do
			vim.api.nvim_set_keymap(
				"n",
				"<C-" .. i .. ">",
				':lua require("harpoon.ui").nav_file(' .. i .. ")<CR>",
				{ noremap = true, silent = true }
			)
		end
	end,
}
