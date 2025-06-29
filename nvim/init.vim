let $NVIM_CONFIG_DIR=stdpath('config') " ~/.local/share/nvim
source $NVIM_CONFIG_DIR/bepo.init

" All the magic is in there
lua require('einenlum')

" Not sure why. Let's test without it.
" filetype off " required

" Base vim options
" ----------------

" Avoid using spaces instead of tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Spot nbsp easily
hi NBSPGroup guibg=LightYellow
match NBSPGroup / /

let g:rustfmt_autosave = 1

" yml autoindent (??)
set autoindent sw=4 ts=4 expandtab
setlocal autoindent sw=4 ts=4 expandtab
setglobal autoindent sw=4 ts=4 expandtab

autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2

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

" Tabularize
" ----------

" ?
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

:ca chb :call CloseHiddenBuffers()
nmap <leader>chb :chb<CR>

" NerdTree
" --------

" Close vim if only nerdtree open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Abolish
" -------

" Change abolish coerce
" nnoremap f <nop>
" xnoremap f <nop>
" nmap fc  <Plug>Coerce

" Autocompletion phpactor
" enable ncm2 for all buffers
" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


" fzf-lua
" -------
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Syntastic
" ---------

" ?
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>


" Rainbow
" -------

" Color brackets automatically
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


" Git blame
" ---------

noremap gm :GitBlameToggle<CR>

" illuminate
" ----------
