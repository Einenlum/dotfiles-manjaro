local map = vim.api.nvim_set_keymap

-- close syntastic when bdelete the buffer
map("n", "<Leader>d", ":lclose<CR>:Bdelete<CR>", {})
