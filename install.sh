#!/bin/bash

# Browsers
sudo pacman -S --needed --noconfirm firefox chromium

# Dev tools
sudo pacman -S --needed --noconfirm gvim zsh tmux ctags gnome-terminal the_silver_searcher nodejs npm ruby yarn gcc
sudo pacman -S --needed --noconfirm docker docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make zsh default shell
chsh -s /bin/zsh

sudo rm -Rf ~/.vim
sudo rm -Rf ~/.vimrc
sudo rm -Rf ~/.bashrc
sudo rm -Rf ~/.tmux
sudo rm -Rf ~/.tmux.conf
sudo rm -Rf ~/.zshrc
sudo rm -Rf ~/.gitconfig
sudo rm -Rf ~/.i3
sudo rm -Rf ~/.i3status.conf
sudo rm -Rf ~/.npm-global

dotfiles_dir=~/dotfiles

ln -sf $dotfiles_dir/vim/vimconf ~/.vim
ln -sf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -sf $dotfiles_dir/vim/vimrc.bepo ~/.vimrc.bepo
ln -sf $dotfiles_dir/shell/tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/shell/zshrc ~/.zshrc
ln -sf $dotfiles_dir/shell/agignore ~/.agignore
ln -sf $dotfiles_dir/git/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/git/gitignore ~/.gitignore
ln -sf $dotfiles_dir/tags/ctags ~/ctags
mkdir ~/.i3 && ln -sf $dotfiles_dir/i3/config ~/.i3/config
ln -sf $dotfiles_dir/i3/i3status.conf ~/.i3status.conf

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/backup
rm -Rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# npm global
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
