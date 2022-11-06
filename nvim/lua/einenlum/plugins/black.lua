local api = vim.api

vim.g.black_virtualenv = "/home/einenlum/.local/pipx/venvs/black"
api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    command = "execute ':Black'"
})
