let $NVIM_CONFIG_DIR=stdpath('config') " ~/.local/share/nvim
source $NVIM_CONFIG_DIR/bepo.init

" Install vim-plug if not exists
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Not sure why. Let's test without it.
" filetype off " required
"
" Look
" ====
set guifont=Fira_Code:h6.5

lua require('einenlum')


" Base vim options
" ----------------

" Avoid using spaces instead of tabs in makefiles
autocmd FileType make setlocal noexpandtab

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Spot nbsp easily
hi NBSPGroup guibg=LightYellow
match NBSPGroup / /

" Fold functions/methods
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set encoding=utf-8
set termguicolors " enable true colors support

" yml autoindent (??)
set autoindent sw=4 ts=4 expandtab
setlocal autoindent sw=4 ts=4 expandtab
setglobal autoindent sw=4 ts=4 expandtab

autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2

" highlight lines and columns
set cursorline
set cursorcolumn

" mkdir directory automatically
function! <SID>MkdirsIfNotExists(directory)
  if(!isdirectory(a:directory))
    call mkdir(a:directory, 'p')
  endif
endfunction
autocmd BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))

" Custom functions
" ================

" Function to pretty print an XML file
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" ?
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Function to close all non visible buffers
function! CloseHiddenBuffers()
    let visible = {}
    " for every tab
    for t in range(1, tabpagenr('$'))
        " and for every window in it
        for b in tabpagebuflist(t)
            " this buffer is visible
            let visible[b] = 1 
        endfor
    endfor

    " for every buffer number
    for b in range(1, bufnr('$'))
       " if b is a number of invisible buffer, we remove it
       if bufexists(b) && !has_key(visible, b)
           execute 'bwipeout' b
       endif
    endfor
endfunction

" Allow to read large files without making vim go crazy
let g:LargeFile = 1024 * 1024 * 10 " a file is considered large from 10 MB
augroup LargeFile 
    autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
    " no syntax highlighting etc
    set eventignore+=FileType
    " save memory when other file is viewed
    setlocal bufhidden=unload
    " is read-only (write with :w new_filename)
    setlocal buftype=nowrite
    " no undo possible
    setlocal undolevels=-1
    " display message
    autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" Plugin configuration
" ====================

" Fugitive
" --------
let g:fugitive_gitlab_domains = ['gitlab.cloud-grdf.fr']

" Ultisnips
" ---------

let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Tabularize
" ----------

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>aa :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /: \zs<CR>
vmap <Leader>a: :Tabularize /: \zs<CR>
nmap <Leader>a, :Tabularize /, \zs<CR>
vmap <Leader>a, :Tabularize /, \zs<CR>

" ?
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

:ca chb :call CloseHiddenBuffers()
nmap <leader>chb :chb<CR>

" NerdTree
" --------

" Close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Abolish
" -------

" Change abolish coerce
" nnoremap f <nop>
" xnoremap f <nop>
" nmap fc  <Plug>Coerce

" Prettier
" --------

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.graphql,*.vue PrettierAsync

" PHPActor
" --------

" Autocompletion phpactor
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

autocmd FileType php nmap <buffer> <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
autocmd FileType php nmap <buffer> <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
autocmd FileType php nmap <buffer> <Leader>an :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
autocmd FileType php nmap <buffer> <Leader>gt :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
autocmd FileType php nmap <buffer> <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
autocmd FileType php nmap <buffer> <Leader>tt :call phpactor#Transform()<CR>

" Extract expression (normal mode)
autocmd FileType php nmap <buffer> <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
autocmd FileType php vmap <buffer> <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
autocmd FileType php vmap <buffer> <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

function! CreatePHPClass(variantName)
    call phpactor#rpc("class_new", { "current_path": phpactor#_path(), "variant": a:variantName, "new_path": phpactor#_path(), "overwrite_existing": 1 })
endfunction

" Generate a default new PHP class (replacing the current file)
autocmd FileType php nmap <buffer> <Leader>cc :call CreatePHPClass("strict-class")<CR>

" Generate a default new PHP interface (replacing the current file)
autocmd FileType php nmap <buffer> <Leader>ci :call CreatePHPClass("interface")<CR>

" Generate a default new PHP trait (replacing the current file)
autocmd FileType php nmap <buffer> <Leader>ct :call CreatePHPClass("trait")<CR>

" fzf-lua
" -------
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nmap <C-p> <Esc>:FzfLua files<CR>
nmap <C-o> <Esc>:FzfLua buffers<CR>
nmap <C-h> <Esc>:FzfLua command_history<CR>
nmap <C-w> <Esc>:FzfLua builtin<CR>
nmap <Leader>f :FzfLua live_grep_native<CR>

" Rust lsp
" --------
lua require("mason").setup()
lua require("mason-lspconfig").setup()
lua require("rusty-config")

" vim-projectroot
" --------------

" Project root is discovered thanks to these files automatically
let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git']

" Vdebug
" ------

let g:vdebug_keymap = {
\    "run" : "<Leader>r",
\    "run_to_cursor" : "<Up>",
\    "step_over" : "<Down>",
\    "step_into" : "<Right>",
\    "step_out" : "<Left>",
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
let g:vdebug_options['ide_key'] = 'PHPSTORM'

" Need to set as empty for this to work with Vagrant boxes.
let g:vdebug_options['server'] = ""

let g:vdebug_options['port'] = 9003 

" let g:vdebug_options['path_maps'] = {'/app': getcwd()}

" Syntastic
" ---------

" Syntastic configuration
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Syntastic configuration for PHP
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_exec = './vendor/bin/phpcs'
let g:syntastic_php_phpcs_args = '--standard=psr12'

" Syntastic configuration for Python
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--load-plugins pylint_django --disable=C0111"

" Disable syntastic for twig
let g:syntastic_filetype_map = { 'html.twig': 'twig' }

" close syntastic when bdelete the buffer
nmap <Leader>d :lclose<CR>:Bdelete<CR>

" force closing buffer without saving
nmap <Leader>D :bd!<CR>
" ?
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

" Set smaller height for syntastic 
let g:syntastic_loc_list_height = 5


" Rainbow
" -------

" Color brackets automatically
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

" Black
" -----

" Path to black executable
let g:black_virtualenv = "/home/einenlum/.local/pipx/venvs/black"

" Execute black on every save
autocmd BufWritePre *.py execute ':Black'


" HOP
" ---

lua require'hop'.setup()
nnoremap è :HopWord<CR>
nnoremap <C-m> <NOP>

" Lightspeed
" ---------

" After the cursor
map <C-d> <Plug>Lightspeed_s
" Before the cursor
map <C-k> <Plug>Lightspeed_S

" Terminal
" --------

" Map esc and ctrl c to leave terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-c> <C-\><C-n>


" Git blame
" ---------

" Disable git blame by default
let g:gitblame_enabled = 0
let g:gitblame_message_template = '<summary> • <sha> • <date> • <author>'
let g:gitblame_print_virtual_text = 0
noremap gm :GitBlameToggle<CR>

" Lualine
" -------

lua require('lualine').setup()

" GPS
" ---

lua require("gps-config")

" illuminate
" ----------

"" Time in milliseconds (default 0)
" before it highlights similar words
let g:Illuminate_delay = 700

" Copilot
" -------------

" Replace Tab with Ctrl + s (to avoid conflicts with Vim's Tab and phpactor)
imap <silent><script><expr> <C-s> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_filetypes = {
    \   'sh': v:false,
    \ }

" Boo
" ___

let g:boo_colorscheme_theme = 'crimson_moonlight'
