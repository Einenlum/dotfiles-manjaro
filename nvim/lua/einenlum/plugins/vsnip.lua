vim.g.vsnip_snippet_dir = vim.fn.stdpath('config') .. '/snippets/vsnip'
-- Expand
-- vim.cmd([[
-- imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
-- ]])

-- Jump forward or backward
-- vim.cmd([[
-- imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
-- imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- ]])
--

-- Expand or jump
vim.cmd([[
imap <expr> <C-CR>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-CR>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
]])
