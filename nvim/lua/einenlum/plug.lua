local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Start
-- -----
Plug 'mhinz/vim-startify' -- Nice start menu in vim

-- Icons
-- -----
Plug 'nvim-tree/nvim-web-devicons' -- icons for status line
Plug 'ryanoasis/vim-devicons'      -- icons in nerdtree and fzf

-- Colors
-- ------
-- Plug 'chrisbra/Colorizer' -- show colors after hexadecimal codes
Plug 'gko/vim-coloresque'

-- Colorschemes
-- ------------
Plug 'rktjmp/lush.nvim' -- Tool used by some colorschemes

Plug "kyazdani42/blue-moon"
Plug 'AlessandroYorba/Alduin'
Plug 'FrenzyExists/aquarium-vim'
Plug 'JoosepAlviste/palenightfall.nvim'
Plug 'embark-theme/vim'
Plug 'folke/tokyonight.nvim'
Plug 'glepnir/oceanic-material'
Plug 'kyazdani42/blue-moon'
Plug 'nvimdev/zephyr-nvim'
Plug 'rakr/vim-two-firewatch'
Plug 'ramojus/mellifluous.nvim'
Plug 'ray-x/aurora'
Plug 'rose-pine/neovim'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'
Plug 'shaunsingh/nord.nvim'
Plug('AlexvZyl/nordic.nvim', { branch = 'main' })
Plug('Yazeed1s/oh-lucy.nvim')
Plug('aktersnurra/no-clown-fiesta.nvim')
Plug('catppuccin/nvim', { as = 'catppuccin' })
Plug('mcchrish/zenbones.nvim')



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
Plug('j-hui/fidget.nvim', { tag = 'legacy' })

-- LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'jay-babu/mason-null-ls.nvim'     -- plug mason with null ls
Plug 'jose-elias-alvarez/null-ls.nvim' -- Add formatting support

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


-- Databases
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'kristijanhusak/vim-dadbod-completion'

-- Snippets
Plug 'L3MON4D3/LuaSnip'
-- Snippet collection (Optional)
-- Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'

-- Diagnostics
Plug 'folke/trouble.nvim'


-- Formatting
-- ----------
Plug('psf/black', { tag = '19.10b0' }) -- autoformat code for python
Plug('prettier/vim-prettier', {
    ['do'] = 'yarn install',
    ['for'] = { 'javascript', 'typescript', 'graphql', 'vue' }
})

-- Snippets
-- --------
Plug 'SirVer/ultisnips' -- Snippets

-- Linting
-- --------
Plug 'vim-syntastic/syntastic'

-- Git
-- ===
Plug 'tpope/vim-fugitive'            -- add git integration
Plug 'f-person/git-blame.nvim'       -- See git blame info
Plug 'shumphrey/fugitive-gitlab.vim' -- add gitlab integration (especially for GBrowse)

-- Fuzzy finders
Plug 'ibhagwan/fzf-lua' -- Add fzf menu

-- Vim menu and behavior
-- =====================

Plug 'sjbach/lusty'              -- Lusty explorer, allows ,lr and ,lf to navigate between files
Plug 'bling/vim-bufferline'      -- Display a line of buffers
Plug 'nvim-lualine/lualine.nvim' -- status line
Plug 'meuter/lualine-so-fancy.nvim'
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'                 -- Close a buffer without messing up the layout
Plug 'editorconfig/editorconfig-vim' -- Use editorconfig file
-- Allow editing as root
Plug 'lambdalisue/suda.vim'

-- Code navigation
-- ----------------
Plug 'Einenlum/yaml-revealer'                                     -- Display and search in yaml files
Plug 'tmhedberg/SimpylFold'                                       -- Help folding in Python
Plug 'stephpy/vim-yaml'                                           -- Avoid slowliness with yaml files (is it still useful?)
Plug 'luochen1990/rainbow'                                        -- Colors brackets according to levels
Plug 'mechatroner/rainbow_csv'                                    -- Syntax highlighting + sql queries on CSV
Plug 'phaazon/hop.nvim'                                           -- Easy motions 1
Plug 'ggandor/lightspeed.nvim'                                    -- Easy motions 2
Plug 'ggandor/leap.nvim'
Plug 'RRethy/vim-illuminate'                                      -- highlight keywords and values when staying on them
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' }) -- TSUpdate updates all the parsers
Plug('nvim-treesitter/playground', { ['do'] = ':TSInstall query' })

-- Code manipulation
-- -----------------
Plug 'FooSoft/vim-argwrap'  -- multi-line single line function
Plug 'godlygeek/tabular'    -- Allows to align things with :Tabularize
Plug 'tpope/vim-commentary' -- Easy comment with gc
Plug 'tpope/vim-abolish'    -- Search and substitute words respecting case
Plug 'jiangmiao/auto-pairs' -- Complete brackets and quotes

-- File manipulation
-- -----------------
Plug 'vim-scripts/Rename' -- Rename the file in buffer

-- Games
-- -----
Plug 'ThePrimeagen/vim-be-good'

vim.call('plug#end')
