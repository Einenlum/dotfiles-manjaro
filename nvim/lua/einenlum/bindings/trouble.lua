local map = vim.api.nvim_set_keymap

-- map("n", "<Leader>x", function() vim.cmd.TroubleToggle() end, {})
map("n", "<Leader>x", "<cmd>TroubleToggle<CR>", {})
