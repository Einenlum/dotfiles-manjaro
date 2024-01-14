require("mason").setup()
local lsp = require('lsp-zero')

lsp.preset({})

lsp.ensure_installed({
    "tsserver",
    "lua_ls",
    "rust_analyzer",
    "phpactor",
    -- "intelephense",
    -- "pyright",
    "ruff_lsp",
    "dockerls"
})

local on_attach = function(client, bufnr)
    local opts = { remap = false, buffer = bufnr }
    vim.g.lsp_diagnostics_echo_cursor = 1

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>cws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>cc', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('v', '<leader>cb', '<leader>cc5<CR>', opts)
    -- vim.keymap.set('n', '<leader>cca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>crn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ci', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    -- Not working
    -- vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end, opts)

    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
end

local ruff_on_attach = function(client, bufnr)
    local opts = { remap = false, buffer = bufnr }
    client.server_capabilities.hoverProvider = false
    vim.g.lsp_diagnostics_echo_cursor = 1

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>gt', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', '<leader>cws', function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set('n', '<leader>cc', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('v', '<leader>cb', '<leader>cc5<CR>', opts)
    -- vim.keymap.set('n', '<leader>cca', function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.references() end, opts)
    vim.keymap.set('n', '<leader>crn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set('n', '<leader>ci', function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    -- Not working
    -- vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end, opts)

    -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
end

lsp.on_attach(function(client, bufnr)
    on_attach(client, bufnr)
end)

lsp.setup()

require 'lspconfig'.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
        enable = false,
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup {
    capabilities = capabilities
}

require('lspconfig').ruff_lsp.setup {
    on_attach = ruff_on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}

require 'lspconfig'.phpactor.setup {
    on_attach = on_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
    }
}

local Float = require "plenary.window.float"

vim.cmd([[
    augroup LspPhpactor
      autocmd!
      autocmd Filetype php command! -nargs=0 LspPhpactorReindex lua vim.lsp.buf_notify(0, "phpactor/indexer/reindex",{})
      autocmd Filetype php command! -nargs=0 LspPhpactorConfig lua LspPhpactorDumpConfig()
      autocmd Filetype php command! -nargs=0 LspPhpactorStatus lua LspPhpactorStatus()
      autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireStart lua LspPhpactorBlackfireStart()
      autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireFinish lua LspPhpactorBlackfireFinish()
    augroup END
]])

local function showWindow(title, syntax, contents)
    local out = {};
    for match in string.gmatch(contents, "[^\n]+") do
        table.insert(out, match);
    end

    local float = Float.percentage_range_window(0.6, 0.4, { winblend = 0 }, {
        title = title,
        topleft = "┌",
        topright = "┐",
        top = "─",
        left = "│",
        right = "│",
        botleft = "└",
        botright = "┘",
        bot = "─",
    })

    vim.api.nvim_buf_set_option(float.bufnr, "filetype", syntax)
    vim.api.nvim_buf_set_lines(float.bufnr, 0, -1, false, out)
end

function LspPhpactorDumpConfig()
    local results, _ = vim.lsp.buf_request_sync(0, "phpactor/debug/config", { ["return"] = true })
    for _, res in pairs(results or {}) do
        showWindow("Phpactor LSP Configuration", "json", res["result"])
    end
end

function LspPhpactorStatus()
    local results, _ = vim.lsp.buf_request_sync(0, "phpactor/status", { ["return"] = true })
    for _, res in pairs(results or {}) do
        showWindow("Phpactor Status", "markdown", res["result"])
    end
end

function LspPhpactorBlackfireStart()
    local _, _ = vim.lsp.buf_request_sync(0, "blackfire/start", {})
end

function LspPhpactorBlackfireFinish()
    local _, _ = vim.lsp.buf_request_sync(0, "blackfire/finish", {})
end

-- local rt = require("rust-tools")

-- rt.setup({
--   server = {
--     on_attach = function(_, bufnr)
--         on_attach(_, bufnr)
--         -- Hover actions
--         vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--         -- Code action groups
--         vim.keymap.set("n", "<Leader>cl", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
-- rt.inlay_hints.enable()

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- local null_ls = require("null-ls")

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.black
--     },
-- })

---- LSP Diagnostics Options Setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticSignError', text = '' })
sign({ name = 'DiagnosticSignWarn', text = '' })
sign({ name = 'DiagnosticSignHint', text = '' })
sign({ name = 'DiagnosticSignInfo', text = '' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- require("mason-null-ls").setup({
--     ensure_installed = { "black" }
-- })

-- local null_ls = require("null-ls")

-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.black,
--     },
-- })

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
