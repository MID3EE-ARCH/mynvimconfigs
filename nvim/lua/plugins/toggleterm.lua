return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup{
      size = 16,  -- Default size for terminals
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = '1',
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      -- Custom key mappings within the setup function
      mappings = {
        {
          key = "<leader>th",
          cmd = "ToggleTerm direction=horizontal",
          size = 12,
          desc = "Open horizontal split terminal"
        },
        {
          key = "<leader>tf",
          cmd = "ToggleTerm direction=float",
          desc = "Open floating terminal"
        },
        {
          size = 18,
          key = "<leader>tv",
          cmd = function()
            vim.cmd("lua require('toggleterm').exec('ToggleTerm direction=vertical size=50')")
          end,
          desc = "Open vertical split terminal with custom size"
        },
      },
    }

    -- Register custom key mappings
    local function register_custom_mappings()
      local mappings = {
        {key = "<leader>tf", cmd = "ToggleTerm direction=float"},
        {key = "<leader>tv", cmd = "ToggleTerm direction=vertical"},
        {key = "<leader>th", cmd = "ToggleTerm direction=horizontal"},
      }
      for _, map in ipairs(mappings) do
        vim.api.nvim_set_keymap("n", map.key, "<cmd>" .. map.cmd .. "<CR>", { noremap = true, silent = true })
      end
    end

    register_custom_mappings()
  end,
}


