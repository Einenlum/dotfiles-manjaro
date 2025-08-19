# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration directory using Lua-based configuration with the lazy.nvim plugin manager. The setup is optimized for web development with comprehensive language server support, formatting, and debugging capabilities.

## Architecture Overview

### Configuration Structure

- **Entry Point**: `init.vim` sources `lua/einenlum/init.lua`
- **Core Modules**:
  - `lua/einenlum/init.lua`: Main initialization that loads all modules
  - `lua/einenlum/lazy.lua`: Plugin definitions using lazy.nvim
  - `lua/einenlum/plugins.lua`: Plugin configuration loader
  - `lua/einenlum/set.lua`: Core Vim options and settings
  - `lua/einenlum/bindings.lua`: Global keybindings
  - `lua/einenlum/autocmds.lua`: Autocommands
  - `lua/einenlum/colors.lua`: Color scheme configuration

### Plugin Architecture

Plugins are managed through lazy.nvim with two-tier configuration:
1. Plugin definitions in `lazy.lua` with basic setup options
2. Detailed configuration in `lua/einenlum/plugins/*.lua` files, loaded by `plugins.lua`

Key plugin categories:
- **LSP & Completion**: Mason, nvim-lspconfig, nvim-cmp, typescript-tools
- **Formatting**: conform.nvim with language-specific formatters
- **Navigation**: fzf-lua, hop.nvim, nerdtree
- **Git Integration**: fugitive, gitsigns
- **Development**: Debugging with nvim-dap, database UI with vim-dadbod

### Language Support

#### PHP Development
- **LSP**: Intelephense with custom definition handler for classes/constructors
- **Formatting**: Laravel Pint (`pint` command)
- **Refactoring**: PHPActor integration
- **Snippets**: Extensive UltiSnips collection in `UltiSnips/php/`

#### JavaScript/TypeScript
- **LSP**: typescript-tools.nvim with better error display
- **Formatting**: Prettier/Prettierd via conform.nvim
- **Framework Support**: React, Vue.js language servers

#### Other Languages
- **Rust**: rust-tools.nvim with auto-formatting
- **Python**: Ruff formatter
- **Go**: gofumpt formatter
- **Lua**: stylua formatter

## Common Development Workflows

### Plugin Management
- Plugins auto-install on first launch via lazy.nvim
- Lock file: `lazy-lock.json` tracks exact plugin versions
- Update plugins: Use lazy.nvim UI (`:Lazy`)

### Formatting
- **Auto-format on save**: Enabled for all file types via conform.nvim
- **Manual format**: Conform.nvim handles language-specific formatters
- **PHP**: Uses Laravel Pint for PSR-12 compliance
- **JS/TS**: Prettier with fallback to prettierd

### LSP Integration
- **Language servers**: Auto-installed via Mason
- **Custom handlers**: PHP definition jumping avoids constructor duplicates
- **Diagnostics**: Custom signs and floating windows with rounded borders

### Key Bindings (Leader: `,`)

#### Core Navigation
- `,n` / `,p`: Next/previous buffer
- `,w`: Save file
- `,q` / `,Q`: Quit/force quit
- `,/`: Clear search highlight
- `<space>`: Toggle fold
- `,gt`: Go to definition
- `,rf`: Find references

#### File Operations
- `,rm`: Delete current file and buffer
- `,ae`: Edit init.vim
- `,ap`: Edit plugin list
- `,az`: Edit zshrc

#### LSP Actions
- `K`: Hover documentation
- `,cc`: Code actions
- `,crn`: Rename symbol
- `,ci`: Go to implementation
- `<C-h>`: Signature help (insert mode)
- `,e`: Open diagnostic float

#### Movement (BÉPO Layout Optimized)
- `<C-t>` / `<C-s>`: Move 5 lines down/up
- Visual selection movement with `T`/`S`

### Development Commands

#### Testing and Linting
```bash
# Check Neovim configuration syntax
nvim --headless -c 'checkhealth' -c 'qa'

# Update plugins
nvim -c 'Lazy update' -c 'qa'

# Format specific file type (if conform not working)
# No direct command - rely on conform.nvim auto-format
```

#### Plugin Development
- Plugin definitions: Edit `lua/einenlum/lazy.lua`
- Plugin configs: Add/edit files in `lua/einenlum/plugins/`
- Keybindings: Edit files in `lua/einenlum/bindings/`

## Configuration Conventions

### File Organization
- One configuration file per major plugin in `plugins/` directory
- Keybindings separated into `bindings/` subdirectory by feature
- Language-specific settings in individual plugin configs (e.g., LSP handlers)

### Lua Patterns
- Use `vim.opt` for setting options
- `vim.keymap.set` for keybindings in plugin configs
- `vim.api.nvim_set_keymap` for global bindings
- Plugin configurations return setup tables when possible

### Language-Specific Features

#### PHP
- Custom LSP definition handler prevents class/constructor duplicate jumping
- Laravel Pint integration for PSR-12 formatting
- PHPActor for advanced refactoring
- Blade template support with syntax highlighting

#### TypeScript
- Enhanced error messages via better-ts-errors.nvim
- Tailwind CSS support with explicit file type restrictions
- Vue and React component support

#### Debugging
- DAP configuration for multiple languages
- UI integration with nvim-dap-ui
- Mason integration for debugger installation

## File Structure Reference

```
nvim/
├── init.vim                    # Entry point, sources Lua config
├── lazy-lock.json             # Plugin version lock file
├── lua/einenlum/
│   ├── init.lua               # Main loader
│   ├── lazy.lua               # Plugin definitions
│   ├── plugins.lua            # Plugin config loader
│   ├── set.lua                # Core Vim settings
│   ├── bindings.lua           # Global keybindings
│   ├── autocmds.lua           # Autocommands
│   ├── colors.lua             # Color scheme setup
│   ├── plugins/               # Individual plugin configs
│   └── bindings/              # Feature-specific keybindings
├── UltiSnips/                 # Custom snippets by language
├── after/                     # Vim after directory
└── snippets/                  # Additional snippet formats
```

## Custom Features

### Large File Handling
- Files >10MB automatically disable syntax highlighting and other heavy features
- Configurable via `g:LargeFile` variable in `init.vim`

### XML Pretty Printing
- `:PrettyXML` command for formatting XML content
- Handles XML fragments with temporary wrapper tags

### Buffer Management
- `:chb` command to close all hidden buffers
- Automatic directory creation on file save

### BÉPO Keyboard Layout
- Configuration optimized for BÉPO layout with `bepo.init` file
- Custom movement keys adapted for BÉPO key positions