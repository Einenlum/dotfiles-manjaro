vim.opt.exrc = true -- Enable local vimrc
vim.opt.hidden = true
vim.opt.wildmenu = true
vim.opt.wildmode="list:longest"
vim.opt.wildignorecase = true -- :e is now case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus=2
vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/backup"
vim.opt.wrap = true
vim.opt.scrolloff=5
vim.opt.title = true
vim.opt.visualbell = true
vim.opt.showmode = true
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.shiftwidth=4
vim.opt.ruler = true
vim.opt.background=dark
vim.g.mapleader = ","
vim.opt.clipboard="unnamedplus" -- Allow to cp/p from clipboard
vim.opt.guifont="Fira_Code:h6"
vim.opt.encoding="utf-8"
vim.opt.termguicolors = true

-- Fold functions/methods
vim.opt.foldmethod="indent"
vim.opt.foldlevel=99

-- highlight lines and columns
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

vim.g.python3_host_prog="python"
