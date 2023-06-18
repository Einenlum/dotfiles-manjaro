local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>cc", rt.code_action_group.code_action_group, { buffer = bufnr })

            local opts = {remap=false, buffer=bufnr}
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
        end,
    },
})
