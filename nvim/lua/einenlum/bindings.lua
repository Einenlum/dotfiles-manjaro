local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- easy copy-paste clipboard
map("v", "<Leader>y", "\"+y<CR>", {})
map("n", "<Leader>p", "\"+p<CR>", {})

-- buffer management
map("n", "<Leader>n", ":bn<CR>", {})
map("n", "<Leader>p", ":bp<CR>", {})

-- force closing buffer without saving
map("n", "<Leader>D", ":bd!<CR>", {})

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

-- Unmap S first
unmap("v", "S")
unmap("n", "S")
-- Move the visual selection up or down
map("v", "T", ":m '>+1<CR>gv=gv", {})
map("v", "S", ":m '<-2<CR>gv=gv", {})

-- Replace current word
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})

-- edit plug list
map("n", "<leader>ap", ":e $NVIM_CONFIG_DIR/lua/einenlum/plug.lua<CR>", {})

-- source vimrc
map("n", "<leader>as", ":source $MYVIMRC<CR>", {})

-- Fix Ctrl-C as esc
map("", "<C-c>", "<Esc>", {})
map("i", "<C-c>", "<Esc>", {noremap=true})
map("i", "<C-c>", "<Esc>", {})

-- Map esc and ctrl c to leave terminal mode
map("t", "<Esc>", "<C-\\><C-n>", {noremap=true})
map("t", "<C-c>", "<C-\\><C-n>", {noremap=true})

-- Wrap arguments in array or parenthesis
map("n", "<leader><Space>", ":ArgWrap<CR>", {noremap=true, silent=true})

-- Fold functions/methods
map("n", "<space>", "za", {noremap=true})

require('einenlum.bindings.nerdtree')
require('einenlum.bindings.fzf')
require('einenlum.bindings.lightspeed')
require('einenlum.bindings.hop')
require('einenlum.bindings.syntastic')
require('einenlum.bindings.trouble')
