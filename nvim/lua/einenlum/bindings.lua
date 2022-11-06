local map = vim.api.nvim_set_keymap

-- easy copy-paste clipboard
map("v", "<Leader>y", "\"+y<CR>", {})
map("n", "<Leader>p", "\"+p<CR>", {})

-- buffer management
map("n", "<Leader>n", ":bn<CR>", {})
map("n", "<Leader>p", ":bp<CR>", {})

-- Clear search highlight
map("n", "<Leader>/", ":let @/=\"\"<CR>", {silent = true})

-- easy navigation between words
map("n", "<C-t>", "5j", {noremap= true})
map("v", "<C-t>", "5j", {noremap= true})
map("n", "<C-s>", "5k", {noremap= true})
map("v", "<C-s>", "5k", {noremap= true})

-- rm file
map("n", "<leader>rm", ":call delete(expand('%')) | Bdelete!<CR>", {})


-- :q binding
map("n", "<leader>q", ":q<CR>", {})
map("n", "<leader>Q", ":q!<CR>", {})

-- easy save
map("n", "<leader>w", ":w<CR>", {})

-- edit vimrc
map("n", "<leader>ae", ":e $MYVIMRC<CR>", {})

-- source vimrc
map("n", "<leader>as", ":source $MYVIMRC<CR>", {})

-- Fix Ctrl-C as esc
map("", "<C-c>", "<Esc>", {})
map("i", "<C-c>", "<Esc>", {noremap=true})
map("i", "<C-c>", "<Esc>", {})

-- Wrap arguments in array or parenthesis
map("n", "<leader><Space>", ":ArgWrap<CR>", {noremap=true, silent=true})
