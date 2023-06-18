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
-- Plug 'chrisbra/Colorizer' -- show colors after hexadecimal codes
Plug 'gko/vim-coloresque'

-- Colorschemes
-- ------------
Plug 'rktjmp/lush.nvim' -- Tool used by some colorschemes

Plug 'AlessandroYorba/Alduin'
Plug 'JoosepAlviste/palenightfall.nvim'
Plug 'Mofiqul/adwaita.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'glepnir/oceanic-material'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'jacoborus/tender.vim'
Plug 'jesseleite/nvim-noirbuddy'
Plug 'joshdick/onedark.vim'
Plug 'kvrohit/mellow.nvim'
Plug 'kvrohit/rasmus.nvim'
Plug 'lmburns/kimbox'
Plug 'mrjones2014/lighthaus.nvim'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'ramojus/mellifluous.nvim'
Plug 'rockerBOO/boo-colorscheme-nvim'
Plug 'romainl/flattened' -- solarized
Plug 'sts10/vim-pink-moon'
Plug 'thenewvu/vim-colors-arthur' 
Plug 'w0ng/vim-hybrid'
Plug 'wadackel/vim-dogrun'
Plug 'yorickpeterse/happy_hacking.vim'
Plug('AlessandroYorba/Sierra')
Plug('AlexvZyl/nordic.nvim', {branch='main'})
Plug('Mofiqul/vscode.nvim')
Plug('Yazeed1s/minimal.nvim')
Plug('ackyshake/Spacegray.vim')
Plug('challenger-deep-theme/vim', {as='challenger-deep' })
Plug('ellisonleao/gruvbox.nvim')
Plug('jonathanfilip/vim-lucius')
Plug('katawful/kat.nvim', {tag='3.1'})
Plug('liuchengxu/space-vim-dark')
Plug('sonph/onehalf', {rtp='vim/'})
Plug('tjdevries/colorbuddy.nvim', {branch='dev'})

-- Language
-- =========
-- Help debug in lua
Plug 'kikito/inspect.lua'
-- Syntax highlighting in graphql
Plug 'jparise/vim-graphql'

-- Autocompletion
-- --------------
-- Plug 'ncm2/ncm2'
-- Plug 'roxma/nvim-yarp' -- Dependency of ncm2
-- Plug('phpactor/phpactor', {['for']='php', tag='master', ['do']='composer install --no-dev -o'})
-- Plug 'phpactor/ncm2-phpactor'
Plug 'github/copilot.vim' -- Test github copilot
--
Plug 'nvim-lua/plenary.nvim'
Plug('j-hui/fidget.nvim', {tag='legacy'})

-- LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'saadparwaiz1/cmp_luasnip'

Plug 'simrat39/rust-tools.nvim'

-- Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'jayp0521/mason-nvim-dap.nvim'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
-- Snippet collection (Optional)
-- Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'

-- Diagnostics
Plug 'folke/trouble.nvim'


-- Formatting
-- ----------
Plug('psf/black', {tag='19.10b0'}) -- autoformat code for python
Plug('prettier/vim-prettier', {
  ['do']='yarn install',
  ['for']={'javascript', 'typescript', 'graphql', 'vue'} })

-- Snippets
-- --------
Plug 'SirVer/ultisnips' -- Snippets

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
Plug 'ggandor/leap.nvim'
Plug 'RRethy/vim-illuminate' -- highlight keywords and values when staying on them
-- Supposted to help plugins with signature help. Is it still needed?
Plug 'ray-x/lsp_signature.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do']=':TSUpdate'}) -- TSUpdate updates all the parsers

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
