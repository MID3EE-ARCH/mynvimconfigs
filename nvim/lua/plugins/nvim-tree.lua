return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  config = function()
    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")

    -- Global variable to track hidden state
    if _G.NVIM_TREE_HIDDEN == nil then
      _G.NVIM_TREE_HIDDEN = false
    end

    -- Function to toggle the visibility of hidden files
    local function toggle_hidden()
      _G.NVIM_TREE_HIDDEN = not _G.NVIM_TREE_HIDDEN

      nvim_tree.setup({
        filters = {
          dotfiles = _G.NVIM_TREE_HIDDEN,
        },
      })

      -- Refresh the tree to apply the change
      api.tree.reload()
    end

    -- Setup nvim-tree with your desired settings
    nvim_tree.setup({
      filters = {
        dotfiles = _G.NVIM_TREE_HIDDEN,
      },
      view = {
        adaptive_size = true,
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      respect_buf_cwd = true,
    })

    -- Make the function globally available
    _G.toggle_hidden = toggle_hidden

    -- Bind the toggle_hidden function to a key (H in this case)
    vim.api.nvim_set_keymap('n', '<leader>h', ':lua toggle_hidden()<CR>', { noremap = true, silent = true })
  end,
}

