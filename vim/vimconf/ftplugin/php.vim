" At startup, change the vdebug path
" function! SetupDebug()
"   let g:vdebug_options['path_maps'] = {'/usr/share/www/chal': call('projectroot#get', a:000)}
"   " Hack to override vdebug options
"   source ~/.vim/plugged/vdebug/plugin/vdebug.vim
" endfunction
" autocmd VimEnter * :call SetupDebug()

let g:vdebug_keymap = {
\    "run" : "<Leader>r",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<Leader>s",
\    "eval_visual" : "<Leader>e"
\}

" Allows Vdebug to bind to all interfaces.
let g:vdebug_options = {}

" Stops execution at the first line.
let g:vdebug_options['break_on_open'] = 1
let g:vdebug_options['max_children'] = 128

" Use the compact window layout.
let g:vdebug_options['watch_window_style'] = 'compact'

" Because it's the company default.
let g:vdebug_options['ide_key'] = 'vim_session'


" Need to set as empty for this to work with Vagrant boxes.
let g:vdebug_options['server'] = ""

let g:vdebug_options['path_maps'] = {'/usr/share/www/chal': '/home/Prog/php/chal'}

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

function! CreatePHPClass(variantName)
    call phpactor#rpc("class_new", { "current_path": phpactor#_path(), "variant": a:variantName, "new_path": phpactor#_path(), "overwrite": 1 })
endfunction

" Generate a default new PHP class (replacing the current file)
nmap <Leader>cc :call CreatePHPClass("default")<CR>

" Generate a default new PHP interface (replacing the current file)
nmap <Leader>ci :call CreatePHPClass("interface")<CR>

" Generate a default new PHP trait (replacing the current file)
nmap <Leader>ct :call CreatePHPClass("trait")<CR>
