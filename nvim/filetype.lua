vim.filetype.add({
    extension = {
        mdx = 'mdx'
    }
})

vim.cmd [[
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END
]]
