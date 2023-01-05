vim.g.nord_italic = true
vim.g.nord_underline = true
vim.g.nord_italic_comments = true

-- Default Colorscheme
-- ___________

vim.cmd[[set background=light]]
vim.cmd[[colorscheme nord]]

-- Most dark colorschemes print comments in a very unreadable way.
vim.cmd[[hi Comment guifg=#949990]]

-- require("noirbuddy").setup()
