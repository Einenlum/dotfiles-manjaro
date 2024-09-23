require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/lua/einenlum/snippets/' })

vim.api.nvim_set_keymap('i', '<C-k>', "<cmd>lua require'luasnip'.expand_or_jump()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('s', '<C-k>', "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })

local function get_php_class_snippet()
    local php_snippets = require('luasnip').get_snippets('php')

    for _, snippet in ipairs(php_snippets) do
        if snippet.name == 'class' then
            return snippet
        end
    end
end

vim.api.nvim_create_autocmd('BufNewFile', {
    pattern = '*.php',
    callback = function()
        -- Only expand the class snippet if the filetype is php
        -- which excludes blade files
        if vim.bo.filetype == 'php' then
            local luasnip = require('luasnip')
            local class_snippet = get_php_class_snippet()
            luasnip.snip_expand(class_snippet)
        end
    end
})
