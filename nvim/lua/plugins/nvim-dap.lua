local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		lazy = false,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Define the LLDB adapter
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- Path to your LLDB VSCode executable
				name = "lldb",
			}

			-- Configure the C debugging session
			dap.configurations.c = {
				{
					type = "lldb",
					name = "Launch",
					request = "launch",
					program = function()
						-- Prompt for executable path, defaulting to /home/MyCodes/
						return vim.fn.input("Path to executable: ", "~/MyCodes/", "file")
					end,
					cwd = "${workspaceFolder}", -- Set the workspace folder as the working directory
					stopOnEntry = false,
				},
			}
			-- Setup dapui
			dapui.setup()

			-- Open dapui on initialized events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- Close dapui on terminated and exited events
			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	},
}

return plugins
