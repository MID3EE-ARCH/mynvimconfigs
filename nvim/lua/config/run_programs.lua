
-- Set leader key
vim.g.mapleader = " "

-- Function to compile and run the current C file using ToggleTerm
function RunCProgram()
    -- Save the current file
    vim.cmd("write")

    -- Get the full path of the current file
    local current_file_with_ext = vim.fn.expand("%:p")
    local current_file = vim.fn.expand("%:r")
    local current_dir = vim.fn.expand("%:p:h")
    local executable_path = current_dir .. "/" .. vim.fn.fnamemodify(current_file, ":t")

    -- Compile and run the C file inside ToggleTerm
    local compile_cmd = "gcc -Wall -g " .. current_file_with_ext .. " -o " .. executable_path .. " && clear && ./" .. vim.fn.fnamemodify(current_file, ":t")
    local cmd = "cd " .. current_dir .. " && " .. compile_cmd .. "; exec $SHELL"

    -- Use ToggleTerm to open a terminal and send the command
    local Terminal  = require('toggleterm.terminal').Terminal
    local c_program_terminal = Terminal:new({
        cmd = cmd,
        direction = "float",
        close_on_exit = false,
        on_open = function(term)
            vim.cmd("startinsert!")
        end,
    })
    c_program_terminal:toggle()
end

-- Map the function to <Leader>r
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua RunCProgram()<CR>", { noremap = true, silent = true })
