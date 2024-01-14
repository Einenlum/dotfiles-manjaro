vim.lsp.start({
  name = 'my-go-lsp-server',   -- No idea whether this should be "more unique" 🤷
  cmd = {'gopls'},
  root_dir = '/tmp/go-clis-with-flag/'
})
