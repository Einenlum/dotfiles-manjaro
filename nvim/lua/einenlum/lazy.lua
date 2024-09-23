-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)


-- Initialize LazyVim
require("lazy").setup({

    -- Start
    { 'mhinz/vim-startify' }, -- Nice start menu in vim

    -- Icons
    { 'nvim-tree/nvim-web-devicons' }, -- icons for status line
    { 'ryanoasis/vim-devicons' },    -- icons in nerdtree and fzf

    -- Colors
    { 'gko/vim-coloresque' }, -- show colors after hexadecimal codes

    -- Colorschemes
    { 'rktjmp/lush.nvim' }, -- Tool used by some colorschemes
    { 'kyazdani42/blue-moon' },
    { 'AlessandroYorba/Alduin' },
    { 'FrenzyExists/aquarium-vim' },
    { 'JoosepAlviste/palenightfall.nvim' },
    { 'comfysage/evergarden' },
    { 'embark-theme/vim' },
    { 'folke/tokyonight.nvim' },
    { 'glepnir/oceanic-material' },
    { 'nvimdev/zephyr-nvim' },
    { 'rakr/vim-two-firewatch' },
    { 'ramojus/mellifluous.nvim' },
    { 'ray-x/aurora' },
    { 'rose-pine/neovim' },
    { 'sainnhe/everforest' },
    { 'sainnhe/gruvbox-material' },
    { 'savq/melange-nvim' },
    { 'shaunsingh/nord.nvim' },
    { 'AlexvZyl/nordic.nvim',                branch = 'main' },
    { 'Yazeed1s/oh-lucy.nvim' },
    { 'aktersnurra/no-clown-fiesta.nvim' },
    { 'catppuccin/nvim',                     as = 'catppuccin' },
    { 'dgox16/oldworld.nvim' },
    { 'mcchrish/zenbones.nvim' },
    { 'nyoom-engineering/oxocarbon.nvim' },
    { 'rebelot/kanagawa.nvim' },

    -- Language
    { 'kikito/inspect.lua' }, -- Help debug in lua
    { 'jparise/vim-graphql' }, -- Syntax highlighting in graphql

    -- Autocompletion
    { 'github/copilot.vim' }, -- Test github copilot
    { 'nvim-lua/plenary.nvim' },
    { 'j-hui/fidget.nvim',                   tag = 'legacy' },

    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'jay-babu/mason-null-ls.nvim' },   -- plug mason with null ls
    { 'jose-elias-alvarez/null-ls.nvim' }, -- Add formatting support

    -- Autocompletion Plugins
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'hrsh7th/vim-vsnip-integ' },
    { 'saadparwaiz1/cmp_luasnip' },

    -- Rust
    { 'simrat39/rust-tools.nvim' },

    -- Debugging
    { 'mfussenegger/nvim-dap' },
    { 'nvim-neotest/nvim-nio' },
    { 'rcarriga/nvim-dap-ui' },
    { 'jayp0521/mason-nvim-dap.nvim' },

    -- Databases
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    -- Snippet collection (Optional)
    -- { 'rafamadriz/friendly-snippets' },
    {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},

    -- Diagnostics
    { 'folke/trouble.nvim' },

    -- Formatting
    { 'prettier/vim-prettier',               build = 'yarn install',    ft = { 'javascript', 'typescript', 'graphql', 'vue' } },

    -- Snippets
    { 'SirVer/ultisnips' }, -- Snippets

    -- Linting
    { 'vim-syntastic/syntastic' },

    -- Git
    { 'tpope/vim-fugitive' },          -- add git integration

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
        },
        },
    },

    -- Fuzzy finders
    { 'ibhagwan/fzf-lua' }, -- Add fzf menu

    -- Vim menu and behavior
    { 'sjbach/lusty' },            -- Lusty explorer, allows ,lr and ,lf to navigate between files
    { 'bling/vim-bufferline' },    -- Display a line of buffers
    { 'nvim-lualine/lualine.nvim' }, -- status line
    { 'meuter/lualine-so-fancy.nvim' },
    { 'scrooloose/nerdtree' },
    { 'moll/vim-bbye' },               -- Close a buffer without messing up the layout
    { 'editorconfig/editorconfig-vim' }, -- Use editorconfig file
    -- Allow editing as root
    { 'lambdalisue/suda.vim' },

    -- Code navigation
    { 'Einenlum/yaml-revealer' },                             -- Display and search in yaml files
    { 'tmhedberg/SimpylFold' },                               -- Help folding in Python
    { 'stephpy/vim-yaml' },                                   -- Avoid slowliness with yaml files (is it still useful?)
    { 'luochen1990/rainbow' },                                -- Colors brackets according to levels
    { 'mechatroner/rainbow_csv' },                            -- Syntax highlighting + sql queries on CSV
    { 'phaazon/hop.nvim' },                                   -- Easy motions 1
    { 'ggandor/lightspeed.nvim' },                            -- Easy motions 2
    { 'ggandor/leap.nvim' },
    { 'RRethy/vim-illuminate' },                              -- highlight keywords and values when staying on them
    { 'nvim-treesitter/nvim-treesitter',     build = ':TSUpdate' }, -- TSUpdate updates all the parsers
    { 'nvim-treesitter/playground',          build = ':TSInstall query' },

    -- Code manipulation
    { 'FooSoft/vim-argwrap' }, -- multi-line single line function
    { 'godlygeek/tabular' },  -- Allows to align things with :Tabularize
    { 'tpope/vim-commentary' }, -- Easy comment with gc
    { 'tpope/vim-abolish' },  -- Search and substitute words respecting case
    { 'jiangmiao/auto-pairs' }, -- Complete brackets and quotes

    -- File manipulation
    { 'vim-scripts/Rename' }, -- Rename the file in buffer

    -- Games
    { 'ThePrimeagen/vim-be-good' }, -- Practice vim skills
})
