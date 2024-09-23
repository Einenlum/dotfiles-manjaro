function PhpactorClassMove(new_file)
  -- Get full path of the current file
  local current_file = vim.fn.expand('%:p')

  if not new_file or new_file == '' then
    new_file = vim.fn.input('New path for class: ', current_file)
    if not new_file or new_file == '' then
      print('Opération annulée.')
      return
    end
  end

  local cmd = 'phpactor class:move ' .. vim.fn.shellescape(current_file) .. ' ' .. vim.fn.shellescape(new_file)

  vim.cmd('!' .. cmd)

  -- Update the buffer with the new file
  vim.cmd('edit ' .. new_file)
end

-- register a PHPRename function into vim so that I can do :PHPRename
vim.api.nvim_create_user_command('PHPRename', function(opts)
  PhpactorClassMove(opts.args)
end, { nargs = '?' })
