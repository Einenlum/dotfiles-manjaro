local api = vim.api

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "css",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "rust",
        "svelte",
        "toml",
        "typescript",
        "tsx",
        "yaml",
        "vimdoc",
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

vim.treesitter.language.register("markdown", "mdx")
-- local ft_to_parser = require("nvim-treesitter.language.register")("mdx", "markdown")
-- ft_to_parser.mdx = "markdown"

-- support for blade
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
    install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = { "src/parser.c" },
        branch = "main",
    },
    filetype = "blade"
}
