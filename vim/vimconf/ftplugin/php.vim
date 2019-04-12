nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>gt :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" Generate a default new PHP class (replacing the current file)
nmap <Leader>cc :call CreatePHPClass("default")<CR>

" Generate a default new PHP interface (replacing the current file)
nmap <Leader>ci :call CreatePHPClass("interface")<CR>

" Generate a default new PHP trait (replacing the current file)
nmap <Leader>ct :call CreatePHPClass("trait")<CR>

let b:ale_linters = ['langserver', 'phan', 'php', 'phpmd', 'phpstan', 'psalm']
