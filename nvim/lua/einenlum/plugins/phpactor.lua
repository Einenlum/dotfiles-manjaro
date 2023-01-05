-- I use fzf-lua instead of fzf.vim, which is not compatible with
-- phpactor right now
-- vim.g.phpactorInputListStrategy = 'phpactor#input#list#fzf'
-- vim.g.phpactorQuickfixStrategy = "phpactor#quickfix#fzf"
require'lspconfig'.phpactor.setup{
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}
