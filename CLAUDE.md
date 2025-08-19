# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive dotfiles repository for Manjaro Linux with i3 window manager, containing configurations for development tools and applications. The setup is optimized for web development with PHP, JavaScript, Python, and Rust support.

## Installation and Setup

The repository uses a centralized installation script:
```bash
./install.sh
```

This script:
- Installs system packages via pamac and yay
- Creates symbolic links to configuration files
- Sets up development environments (Node.js, PHP, Python, Rust)
- Configures fonts and themes

## Architecture Overview

### Core Components

- **Neovim Configuration** (`nvim/`): Lua-based configuration using lazy.nvim plugin manager
  - Main entry point: `nvim/init.vim` sources `lua/einenlum/init.lua`
  - Plugin management: `nvim/lua/einenlum/lazy.lua` and `nvim/lua/einenlum/plugins.lua`
  - Configuration modules in `nvim/lua/einenlum/plugins/` for individual plugin setups

- **Shell Configuration** (`shell/`): ZSH with extensive aliases and tool integrations
  - Main config: `shell/zshrc`
  - Terminal: Kitty configuration (`shell/kitty.conf`)
  - Prompt: Starship configuration (`shell/starship/starship.toml`)
  - Multiplexer: tmux configuration (`shell/tmux.conf`)

- **Window Manager** (`i3/`): i3-gaps configuration with custom status bar
  - Main config: `i3/config`
  - Status bar: `i3/i3status.conf`

- **Development Tools**:
  - Git configuration with delta pager and FZF integrations (`git/gitconfig`)
  - PHPActor configuration for PHP development (`phpactor/`)
  - Custom snippets for multiple languages (`nvim/UltiSnips/`)

### Key Development Workflows

#### Neovim Plugin Management
- Uses lazy.nvim for plugin management
- Plugins auto-install on first Neovim launch
- Configuration is modular with separate files for each plugin type

#### Git Workflow Enhancement
- Custom git aliases with FZF integration:
  - `git fco`: Interactive branch checkout
  - `git frebase`: Interactive rebase with commit selection
  - `git autofixup`: Automatic fixup commits
  - `git fs`: Show commits interactively

#### Shell Productivity
- Extensive alias system for common development tasks
- Docker Compose shortcuts (dc* aliases)
- Laravel Sail integration
- Framework-specific aliases (Symfony, Django, AdonisJS)

## Common Development Commands

### Package Management
- System packages: `sudo pamac install <package>`
- AUR packages: `yay <package>`
- Node.js: `npm install -g <package>` (uses ~/.npm-global)
- Composer: `composer global require <package>`

### Development Workflows
- Start development: Open nvim, plugins auto-load
- Git workflow: Use custom git aliases for enhanced productivity
- Terminal multiplexing: `tmux -u2` for Unicode support
- File navigation: Uses FZF extensively for fuzzy finding

### Tool Integration
- File search: `rg` (ripgrep) with custom FZF integration
- Navigation: `z` (zoxide) for smart directory jumping
- File listing: `exa` instead of traditional `ls`
- Image preview: `icat` (kitty's image display)

## Configuration Conventions

### Neovim
- Uses Lua for modern Neovim configuration
- Lazy loading for optimal startup performance
- Language servers configured via Mason
- Custom keybindings follow vim conventions with leader key

### Shell
- Case-insensitive completion enabled
- Extensive history configuration (10M entries)
- PATH includes all common development tool directories
- Environment optimized for multiple language development

### Git
- Delta pager for enhanced diff viewing
- Side-by-side diff display by default
- Custom color scheme for better readability
- FZF integration for interactive git operations

## Language-Specific Setup

### PHP
- PHPActor for language server and refactoring
- Custom templates in `phpactor/templates/`
- Composer global installation support

### JavaScript/TypeScript
- TypeScript tools integration
- ESLint and Prettier configuration
- Vue.js language server support

### Python
- Virtual environment management aliases (`ve`, `so`, `de`)
- Django-specific shortcuts (`dja`, `pm`)
- UV (modern Python package manager) integration

### Rust
- Cargo binary path included
- Rust-tools plugin for enhanced development
- Automatic formatting on save

## Maintenance

- Plugin updates: Neovim automatically handles plugin updates via lazy.nvim
- System updates: Use `sudo pamac update` for system packages
- Configuration changes: Most settings are symlinked, edit source files in dotfiles repo
- Font updates: Custom font installation handled in install script