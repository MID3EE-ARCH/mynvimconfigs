-- Set leader key
vim.g.mapleader = " "

-- Function to compile and run the current C file using ToggleTerm
function RunCProgram()
    -- Save the current file
    vim.cmd("write")

    -- Get the name of the current file without extension
    local current_file = vim.fn.expand("%:r")
    local current_dir = vim.fn.expand("%:p:h")
    local executable_path = current_dir .. "/" .. vim.fn.fnamemodify(current_file, ":t")

    -- Compile the C file
    vim.cmd("!gcc -g % -o " .. executable_path)

    -- If the compilation is successful, run the executable
    if vim.v.shell_error == 0 then
        -- Change directory to the current file's directory and run the compiled program
        local cmd = "cd " .. current_dir .. " && clear && ./" .. vim.fn.fnamemodify(current_file, ":t") .. "; exec $SHELL"

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
    else
        print("Compilation failed!")
    end
end

-- Map the function to <Leader>r
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua RunCProgram()<CR>", { noremap = true, silent = true })

