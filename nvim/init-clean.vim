let $NVIM_CONFIG_DIR=stdpath('config') " ~/.local/share/nvim
source $NVIM_CONFIG_DIR/bepo.init

" Install vim-plug if not exists
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" insert lua code inside vimscript
"
lua << EOF
local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = "go",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ 'go.mod', 'go.work', '.git' }, { upward = true })[1]
        )
        local client = vim.lsp.start({
            name = 'my-gol-lsp-server',
            cmd = { 'gopls' },
            root_dir = root_dir,
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
EOF
"
" lua require('testlsp')
