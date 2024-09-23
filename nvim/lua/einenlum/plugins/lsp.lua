local lsp = require('lsp-zero')


local lsp_attach = function(client, bufnr)
      local opts = {buffer = bufnr}
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
--   lsp.default_keymaps({buffer = bufnr})

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
    vim.keymap.set('n', '<leader>e', function() vim.diagnostic.open_float() end, opts)
end

lsp.extend_lspconfig({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  lsp_attach = lsp_attach,
  float_border = 'rounded',
  sign_text = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  },
})

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    -- By default tailwincss is enabled on php files. We explicitely
    -- set the filetypes it should be enabled on.
    ["tailwindcss"] = function()
      require('lspconfig').tailwindcss.setup({
        filetypes = { "html", "blade", "css", "scss", "less", "javascriptreact", "typescriptreact", "vue", "svelte" },
      })
    end,
    -- Avoid having the lua language server complain about
    -- the 'vim' global variable being not defined
    ["lua_ls"] = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  },
})
