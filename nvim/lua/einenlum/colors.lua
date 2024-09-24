local map = vim.api.nvim_set_keymap

vim.g.nord_italic = true
vim.g.nord_underline = true
vim.g.nord_italic_comments = true

-- Default Colorscheme
-- ___________
--
--
local light_start = 9
local light_end = 17

local current_hour = tonumber(os.date("%H"))

-- if (current_hour >= light_end or current_hour <= light_start) then
--     vim.o.background = 'dark'
-- else
--     vim.o.background = 'light'
-- end
vim.o.background = 'dark'
-- vim.cmd[[colorscheme nord]]
--
--
map("n", "<Leader>cl", ":set background=light<CR>", {})
map("n", "<Leader>cd", ":set background=dark<CR>", {})

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
vim.cmd("colorscheme melange")
-- Most dark colorschemes print comments in a very unreadable way.
vim.cmd [[hi Comment guifg=#949990]]

require 'evergarden'.setup {
    transparent_background = false,
    contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
    override_terminal = true,
    style = {
        tabline = { reverse = true, color = 'green' },
        search = { reverse = false, inc_reverse = true },
        types = { italic = false },
        keyword = { italic = false },
        comment = { italic = true },
        sign = { highlight = true },
    },
    overrides = {}, -- add custom overrides
}
