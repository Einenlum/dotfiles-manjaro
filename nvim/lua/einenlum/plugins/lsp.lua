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


-- Custom handler for 'textDocument/definition'
-- The problem is that when I jump on a PHP class definition,
-- I get two results: one for the class and one for the constructor
local function goto_definition(_, result, ctx, _)
  if result == nil or vim.tbl_isempty(result) then
    vim.notify('[LSP] Definition not found', vim.log.levels.INFO)
    return nil
  end

  -- If multiple results, check if they are in the same file
  if vim.tbl_islist(result) then
    local first_uri = result[1].uri or result[1].targetUri
    local same_file = true

    for _, location in ipairs(result) do
      local uri = location.uri or location.targetUri
      if uri ~= first_uri then
        same_file = false
        break
      end
    end

    if same_file then
      -- Jump to the first location if all are in the same file
      vim.lsp.util.jump_to_location(result[1], 'utf-8')
    else
      -- Show all locations if they are in different files
      vim.lsp.handlers['textDocument/definition'](_, result, ctx, _)
    end
  else
    -- Single result, jump directly
    vim.lsp.util.jump_to_location(result, 'utf-8')
  end
end

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
    ["intelephense"] = function()
      require('lspconfig').intelephense.setup({
        handlers = {
          ['textDocument/definition'] = goto_definition,
        },
      })
    end,
  },
})

-- lspconfig = require('lspconfig')

-- -- Setup vue language server
-- -- Found here: https://www.reddit.com/r/neovim/comments/1g4e3sa/finally_neovim_native_vue_lsp_perfection_2024/
-- lspconfig.ts_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   init_options = {
--     plugins = { -- I think this was my breakthrough that made it work
--       {
--         name = "@vue/typescript-plugin",
--         location = "/home/einenlum/.npm-global/lib/node_modules/@vue/language-server",
--         languages = { "vue" },
--       },
--     },
--   },
--   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
-- }
