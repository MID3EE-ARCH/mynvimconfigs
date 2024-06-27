local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
      dap.adapters.lldb = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode',
      name = "lldb"
      }
      dap.configurations.c = {
      {
          type = 'lldb',
          name = "Launch",
          request = 'launch',
          program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		lazy = false,
		config = function()
			-- Configuration for mason-nvim-dap.nvim if needed
		end,
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
		opts = {
			handlers = {},
			ensure_installed = { "codelldb" },
		},
	},
	{ "mfussenegger/nvim-dap", lazy = false },
}

return plugins, dap
