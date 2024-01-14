vim.g.nord_italic = true
vim.g.nord_underline = true
vim.g.nord_italic_comments = true

-- Default Colorscheme
-- ___________

-- vim.cmd [[set background=dark]]
vim.cmd [[set background=dark]]
-- vim.cmd[[colorscheme nord]]

local colors = {
    'adwaita',
    'afterglow',
    'alduin',
    'ayu',
    'boo',
    'challenger_deep',
    'crimson_moonlight',
    'dogrun',
    'forest_stream',
    'gruvbox',
    'lighthaus',
    'lucius',
    'lunaperche',
    'mellifluous',
    'minimal',
    'oceanic_material',
    'oh-lucy',
    'palenightfall',
    'pink-moon',
    'radioactive_waste',
    'rasmus',
    'sierra',
    'tender',
    'two-firewatch',
    'yellow-moon',
    -- 'hybrid',
    -- 'kat.nvim',
    -- 'kat.nwim',
    -- 'noirbuddy',
    --
    -- nope:
    --
    -- 'base16-3024',
    -- 'base16-fruit-soda',
}
-- For now we keep base16-nord
-- local color = colors[math.random(#colors)]

-- vim.cmd("colorscheme " .. color)
vim.cmd("colorscheme everforest")
-- Most dark colorschemes print comments in a very unreadable way.
vim.cmd [[hi Comment guifg=#949990]]

-- require("noirbuddy").setup()
