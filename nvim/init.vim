let $NVIM_CONFIG_DIR=stdpath('config')
source $NVIM_CONFIG_DIR/bepo.init

" Install vim-plug if not exists
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" For php specific config, check ~/.vim/ftplugin/php.vim

filetype off " required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'nvim-lualine/lualine.nvim' " status line
Plug 'kyazdani42/nvim-web-devicons' " icons for status line
Plug 'tpope/vim-commentary' " Easy comment with gc
Plug 'mhinz/vim-startify' " Nice start menu in vim

" fzf
Plug 'ibhagwan/fzf-lua'

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp' " Dependency of ncm2
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'phpactor/ncm2-phpactor'
" Plug 'kristijanhusak/deoplete-phpactor'

" Autocompletion for python
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'

" autoformat code for python
Plug 'psf/black', { 'tag': '19.10b0' }

" jump to definition for python
Plug 'davidhalter/jedi-vim'

Plug 'tpope/vim-fugitive' " add git integration
Plug 'godlygeek/tabular'
Plug 'jordwalke/flatlandia'
Plug 'sjbach/lusty' " Lusty explorer, allows ,lr and ,lf to navigate between files
Plug 'SirVer/ultisnips'
Plug 'evidens/vim-twig'
Plug 'shawncplus/phpcomplete.vim'
Plug 'bling/vim-bufferline'
Plug 'stephpy/vim-yaml'
Plug 'vim-syntastic/syntastic'
Plug 'monochromegane/unite-yaml'
Plug 'groenewege/vim-less'
Plug 'f-person/git-blame.nvim' " See git blame info
Plug 'Einenlum/yaml-revealer'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'ray-x/lsp_signature.nvim'
Plug 'editorconfig/editorconfig-vim'
Plug 'RRethy/vim-illuminate' " highlight keywords
Plug 'tpope/vim-abolish'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'graphql', 'vue'] }
Plug 'vim-scripts/Rename'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'danilo-augusto/vim-afterglow'
Plug 'AlessandroYorba/Alduin'
Plug 'vim-scripts/AfterColors.vim'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'tmhedberg/SimpylFold' " Help folding in Python
Plug 'moll/vim-bbye' " Close a buffer without messing up the layout
" Plug 'Valloric/YouCompleteMe' " Completion for python
" ycm does not work for now. Buggy
Plug 'joonty/vdebug' " xdebug
Plug 'dbakker/vim-projectroot' " Helps for vdebug: change config regarding the root dir
Plug 'luochen1990/rainbow' " Colors brackets according to levels
Plug 'FooSoft/vim-argwrap' " multi-line single line function

Plug 'jiangmiao/auto-pairs' " Complete brackets and quotes
Plug 'ryanoasis/vim-devicons' " icons in nerdtree and fzf
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python highlighting
Plug 'mechatroner/rainbow_csv' " Syntax highlighting + sql queries on CSV
Plug 'chrisbra/Colorizer' " show colors after hexadecimal codes

" Easy motions
Plug 'phaazon/hop.nvim'
Plug 'ggandor/lightspeed.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Where am I?
Plug 'SmiteshP/nvim-gps'

" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/flattened' " solarized
Plug 'sts10/vim-pink-moon'
Plug 'glepnir/oceanic-material'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'rakr/vim-two-firewatch'
Plug 'thenewvu/vim-colors-arthur' 

" All of your Plugins must be added before the following line
call plug#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set exrc " Enable local vimrc
set nocompatible
set hidden
set wildmenu
set wildmode=list:longest
set wildignorecase " :e is now case insensitive
set ignorecase
set smartcase
set hlsearch
set incsearch
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set backupdir =~/.config/nvim/backup
set wrap
set scrolloff=5
set title
set visualbell
set showmode
set number
set expandtab
set shiftwidth=4
set ruler
set background=dark
colorscheme two-firewatch
let mapleader = ","
set t_Co=256
let g:Powerline_symbols='fancy'
" nnoremap <F6> :silent !ctags -f tags -h=.php --PHP-kinds=+cf --recurse --exclude="*/cache/*" --exclude="*/logs/*" --exclude="*/data/*" --exclude="\.git" --exclude="\.svn" --languages=PHP src spec features tests&<CR>
" nnoremap <F7> :silent !ctags -f vendor.tags -h=.php --PHP-kinds=+cf --recurse --exclude="*/cache/*" --exclude="*/logs/*" --exclude="*/data/*" --exclude="\.git" --exclude="\.svn" --languages=PHP vendor&<CR>
set clipboard=unnamedplus " Allow to cp/p from clipboard

" easy copy-paste clipboard
vmap <Leader>y "+y<CR>
nmap <Leader>p "+p<CR>

" buffer management
map <Leader>n :bn<cr>
map <Leader>p :bp<cr>

" Clear search highlight
nmap <silent> <leader>/ :let @/=""<cr>

" mkdir directory automatically
autocmd BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
if(!isdirectory(a:directory))
    call mkdir(a:directory, 'p')
endif
endfunction

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" tagbar
nmap <F8> :TagbarToggle<CR>

" View differently normal spaces and non breakable spaces
" set list listchars=nbsp:¬

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>aa :Tabularize /=><CR>
vmap <Leader>aa :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /: \zs<CR>
vmap <Leader>a: :Tabularize /: \zs<CR>
nmap <Leader>a, :Tabularize /, \zs<CR>
vmap <Leader>a, :Tabularize /, \zs<CR>

" Git next git conflict
noremap ]c <Leader>gp
noremap [c <Leader>gn

" Disable vim-go mapping
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" easy navigation between words
nnoremap <C-t> 5j
vnoremap <C-t> 5j
nnoremap <C-s> 5k
vnoremap <C-s> 5k

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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

" set how far Ctrl-D and Ctrl-U scroll
set scroll=6

" buffer close
" nmap <Leader>d :Bdelete<CR>

" list buffers
nmap <leader>b :ls<CR>:e#

" Function to close all buffers not visible
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

:ca chb :call CloseHiddenBuffers()
nmap <leader>chb :chb<CR>

" open new tab
nmap <leader>e :tabnew<CR>
" next tab
nmap <leader>en :tabnext<CR>
" previous tab
nmap <leader>ep :tabprevious<CR>
" close tab
nmap <leader>ec :tabclose<CR>

" rm file
nmap <leader>rm :call delete(expand('%')) \| Bdelete!<CR>

" :q binding
nmap <Leader>q :q<CR>

" highlight lines and columns
set cursorline
set cursorcolumn

" easy save
nmap <Leader>w :w<CR>

" yml autoindent
set autoindent sw=4 ts=4 expandtab
setlocal autoindent sw=4 ts=4 expandtab
setglobal autoindent sw=4 ts=4 expandtab

autocmd BufNewFile,BufRead *.njs set filetype=javascript

" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
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

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close vim if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fix Ctrl-C as esc
map <C-c> <Esc>
ino <C-C> <Esc>
imap <C-C> <Esc>

" Change abolish coerce
nnoremap f <nop>
xnoremap f <nop>
nmap fc  <Plug>Coerce

autocmd FileType php set keywordprg=~/.bin/phpdoc.sh

" Remove this f**king conceal of json quotes!
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""
set conceallevel=0
au FileType * setl conceallevel=0 
let  g:indentLine_conceallevel = 0


let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_text_changed = 'never'

nmap <Leader>m <Plug>(Prettier)
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.graphql,*.vue PrettierAsync

autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType jsx setlocal shiftwidth=2 tabstop=2

" Prettier for PHP
" function PrettierPhpCursor()
"   let save_pos = getpos(".")
"   %! prettier --stdin --parser=php
"   call setpos('.', save_pos)
" endfunction
" " define custom command
" command PrettierPhp call PrettierPhpCursor()
" " format on save
" autocmd BufwritePre *.php PrettierPhp

" fix syntax hl for ejs files
au BufNewFile,BufRead *.ejs set filetype=html

" Lightline configuration
set noshowmode " we remove the -- INSERTION -- which is useless now because of lightline
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Autocompletion phpactor
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" IMPORTANTE: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nmap <C-p> <Esc>:FzfLua files<CR>
nmap <C-o> <Esc>:FzfLua buffers<CR>
nmap <C-h> <Esc>:FzfLua command_history<CR>
nmap <C-w> <Esc>:FzfLua builtin<CR>
nmap <Leader>f :FzfLua live_grep_native<CR>

" Fold functions/methods
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set encoding=utf-8

" Tweaks for YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Project root is discovered thanks to these files automatically
let g:rootmarkers = ['.projectroot', 'docker-compose.yml', '.git']

" PHP
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

nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>an :call phpactor#Navigate()<CR>

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
    call phpactor#rpc("class_new", { "current_path": phpactor#_path(), "variant": a:variantName, "new_path": phpactor#_path(), "overwrite_existing": 1 })
endfunction

" Generate a default new PHP class (replacing the current file)
nmap <Leader>cc :call CreatePHPClass("strict-class")<CR>

" Generate a default new PHP interface (replacing the current file)
nmap <Leader>ci :call CreatePHPClass("interface")<CR>

" Generate a default new PHP trait (replacing the current file)
nmap <Leader>ct :call CreatePHPClass("trait")<CR>

" Color brackets automatically
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

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

nnoremap <silent> <leader><Space> :ArgWrap<CR>

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
" colorscheme ayu

" autocompletion for python
let g:deoplete#enable_at_startup = 1
" automatically close deoplete popup when used the term
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" configure vim jedi
let g:jedi#goto_command = "<C-k>"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:black_virtualenv = "/home/einenlum/.local/pipx/venvs/black"

" Execute black on every save
autocmd BufWritePre *.py execute ':Black'

" close syntastic when bdelete the buffer
nmap <Leader>d :lclose<CR>:Bdelete<CR>
" nnoremap <silent> <C-d> :lclose<CR>:bdelete<CR>
cabbrev <silent> bd <C-r>=(getcmdtype()==#':' && getcmdpos()==1 ? 'lclose\|bdelete' : 'bd')<CR>

nnoremap <BS> <C-^>

" Set smaller height for syntastic 
let g:syntastic_loc_list_height = 5

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Hop config
lua require'hop'.setup()
nnoremap è :HopWord<CR>

nnoremap j <NOP>
nnoremap k <NOP>
nnoremap <C-m> <NOP>
map <C-d> <Plug>Lightspeed_s
map <C-k> <Plug>Lightspeed_S
noremap gm :GitBlameToggle<CR>

lua require('lualine').setup()

" Where am I?
lua require("gps-config")

" Disable git blame by default
let g:gitblame_enabled = 0
let g:gitblame_message_template = '<summary> • <sha> • <date> • <author>'
let g:gitblame_print_virtual_text = 0
" Time in milliseconds (default 0)
let g:Illuminate_delay = 700

" nmap <nowait> c
" nmap <nowait> r
" nmap cr <NOP>
" nmap rc <NOP>
" nmap cc <NOP>
