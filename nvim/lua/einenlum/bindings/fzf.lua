local map = vim.api.nvim_set_keymap

map("n", "<C-p>", "<Esc>:FzfLua files<CR>", {})
map("n", "<C-o>", "<Esc>:FzfLua buffers<CR>", {})
map("n", "<C-h>", "<Esc>:FzfLua command_history<CR>", {})
map("n", "<C-w>", "<Esc>:FzfLua builtin<CR>", {})
map("n", "<Leader>f", "<Esc>:FzfLua live_grep_native<CR>", {})
