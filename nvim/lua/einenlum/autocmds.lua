local api = vim.api

local M = {}

function M.setup(groups)
    require'einenlum.autocmds.phpactor'.setup(groups)

    -- In the quickfix window, <CR> is used to jump to the error under the
    -- cursor, so undefine the mapping there.
    api.nvim_create_autocmd("BufReadPost quickfix", {
        command = "nnoremap <buffer> <CR> <CR>"
    })
end

return M
