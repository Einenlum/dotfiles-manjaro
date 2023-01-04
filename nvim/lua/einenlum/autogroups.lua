local api = vim.api

local Groups = {}

Groups.php = api.nvim_create_augroup("php", { clear = true })

return Groups
