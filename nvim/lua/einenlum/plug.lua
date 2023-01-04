local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Start
-- -----
Plug 'mhinz/vim-startify' -- Nice start menu in vim

-- Icons
-- -----
Plug 'kyazdani42/nvim-web-devicons' -- icons for status line
Plug 'ryanoasis/vim-devicons' -- icons in nerdtree and fzf

-- Colors
-- ------
Plug 'chrisbra/Colorizer' -- show colors after hexadecimal codes

-- Colorschemes
-- ------------
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'ayu-theme/ayu-vim'
Plug 'romainl/flattened' -- solarized
Plug 'sts10/vim-pink-moon'
Plug 'glepnir/oceanic-material'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'rakr/vim-two-firewatch'
Plug 'thenewvu/vim-colors-arthur' 
Plug 'AlessandroYorba/Alduin'
Plug 'danilo-augusto/vim-afterglow'
Plug('sonph/onehalf', {rtp='vim/'})
Plug 'wadackel/vim-dogrun'
Plug('challenger-deep-theme/vim', {as='challenger-deep' })
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'JoosepAlviste/palenightfall.nvim'
Plug 'kvrohit/rasmus.nvim'
Plug('katawful/kat.nvim', {tag='3.1'})
Plug('jonathanfilip/vim-lucius')
Plug('Mofiqul/vscode.nvim')
Plug('ellisonleao/gruvbox.nvim')
Plug('Yazeed1s/minimal.nvim')
Plug('ackyshake/Spacegray.vim')
Plug('liuchengxu/space-vim-dark')
Plug('tjdevries/colorbuddy.nvim', {branch='dev'})
Plug 'jesseleite/nvim-noirbuddy'

-- Language
-- =========
-- Help debug in lua
Plug 'kikito/inspect.lua'

-- Autocompletion
-- --------------
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp' -- Dependency of ncm2
Plug('phpactor/phpactor', {['for']='php', tag='master', ['do']='composer install --no-dev -o'})
Plug 'phpactor/ncm2-phpactor'
Plug 'github/copilot.vim' -- Test github copilot
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig' -- Bring easy lsp config to nvim
Plug 'simrat39/rust-tools.nvim'

-- Formatting
-- ----------
Plug('psf/black', {tag='19.10b0'}) -- autoformat code for python
Plug('prettier/vim-prettier', {
  ['do']='yarn install',
  ['for']={'javascript', 'typescript', 'graphql', 'vue'} })

-- Snippets
-- --------
Plug 'SirVer/ultisnips' -- Snippets

-- Debugging
-- ----------
Plug 'joonty/vdebug' -- xdebug

-- Linting
-- --------
Plug 'vim-syntastic/syntastic'

-- Git
-- ===
Plug 'tpope/vim-fugitive' -- add git integration
Plug 'f-person/git-blame.nvim' -- See git blame info
Plug 'shumphrey/fugitive-gitlab.vim' -- add gitlab integration (especially for GBrowse)

-- Vim menu and behavior
-- =====================

Plug 'ibhagwan/fzf-lua' -- Add fzf menu
Plug 'sjbach/lusty' -- Lusty explorer, allows ,lr and ,lf to navigate between files
Plug 'bling/vim-bufferline' -- Display a line of buffers
Plug 'nvim-lualine/lualine.nvim' -- status line
Plug 'scrooloose/nerdtree'
Plug 'dbakker/vim-projectroot' -- Helps for vdebug: change config depending on the root dir
Plug 'moll/vim-bbye' -- Close a buffer without messing up the layout
Plug 'editorconfig/editorconfig-vim' -- Use editorconfig file

-- Code navigation
-- ----------------
Plug 'Einenlum/yaml-revealer' -- Display and search in yaml files
Plug 'tmhedberg/SimpylFold' -- Help folding in Python
Plug 'stephpy/vim-yaml' -- Avoid slowliness with yaml files (is it still useful?)
Plug 'luochen1990/rainbow' -- Colors brackets according to levels
Plug 'mechatroner/rainbow_csv' -- Syntax highlighting + sql queries on CSV
Plug 'phaazon/hop.nvim' -- Easy motions 1
Plug 'ggandor/lightspeed.nvim' -- Easy motions 2
Plug 'RRethy/vim-illuminate' -- highlight keywords and values when staying on them
-- Supposted to help plugins with signature help. Is it still needed?
Plug 'ray-x/lsp_signature.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do']=':TSUpdate'}) -- TSUpdate updates all the parsers
Plug 'SmiteshP/nvim-gps' -- Where am I in the file?

-- Code manipulation
-- -----------------
Plug 'FooSoft/vim-argwrap' -- multi-line single line function
Plug 'godlygeek/tabular' -- Allows to align things with :Tabularize
Plug 'tpope/vim-commentary' -- Easy comment with gc
Plug 'tpope/vim-abolish' -- Search and substitute words respecting case
Plug 'jiangmiao/auto-pairs' -- Complete brackets and quotes

-- File manipulation
-- -----------------
Plug 'vim-scripts/Rename' -- Rename the file in buffer

-- Games
-- -----
Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')
