-- Set leader key
vim.g.mapleader = " "

-- Function to toggle terminal
function ToggleTerminal()
  if vim.g.terminal_buf and vim.fn.bufwinnr(vim.g.terminal_buf) ~= -1 then
    vim.cmd('bdelete! ' .. vim.g.terminal_buf)
    vim.g.terminal_buf = nil
    return
  end
  vim.cmd('botright split term://bash')
  vim.g.terminal_buf = vim.fn.bufnr('%')
end

-- Define the function to compile and run the current C file
function RunCProgram()
  -- Save the current file
  vim.cmd("write")

  -- Get the name of the current file without extension
  local current_file = vim.fn.expand('%:r')
  local current_dir = vim.fn.expand('%:p:h')
  local executable_path = current_dir .. '/' .. vim.fn.fnamemodify(current_file, ':t')

  -- Compile the C file
  vim.cmd('!gcc % -o ' .. executable_path)

  -- If the compilation is successful, run the executable
  if vim.v.shell_error == 0 then
    -- Check if terminal buffer exists and is valid
    if vim.g.terminal_buf and vim.fn.bufwinnr(vim.g.terminal_buf) ~= -1 then
      -- Switch to the terminal buffer
      vim.cmd('exec "buffer " .. vim.g.terminal_buf')
    else
      -- Open a new terminal if one doesn't exist
      vim.cmd('botright split term://bash')
      vim.g.terminal_buf = vim.fn.bufnr('%')
    end
    -- Change directory to the current file's directory and run the compiled program
    local cmd = 'cd ' .. current_dir .. ' && clear && ./' .. vim.fn.fnamemodify(current_file, ':t') .. ' && echo "Press any key to close..." && read -n 1\n'
    vim.fn.chansend(vim.b.terminal_job_id, cmd)
  else
    print("Compilation failed!")
  end
end

-- Map the function to <Leader>r and terminal toggle to <Leader>x
vim.api.nvim_set_keymap('n', '<Leader>r', ':lua RunCProgram()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>x', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F5>', ':w<CR>:!gcc -o %:r % && ./%:r<CR>', { noremap = true, silent = true })

