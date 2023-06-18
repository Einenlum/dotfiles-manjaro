-- In the quickfix window, <CR> is used to jump to the error under the
-- cursor, so undefine the mapping there.
vim.api.nvim_create_autocmd("BufReadPost quickfix", {
    command = "nnoremap <buffer> <CR> <CR>"
})
