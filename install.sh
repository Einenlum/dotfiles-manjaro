#!/bin/bash

# Browsers
sudo pacman -S --needed --noconfirm firefox chromium

# Dev tools
sudo pacman -S --needed --noconfirm \
    bat \
    dmenu \
    gcc \
    gnome-terminal \
    gvim \
    highlight \
    neovim \
    npm \
    nodejs \
    pcmanfm \
    php \
    python2-pip \
    python-pip \
    p7zip \
    ripgrep \
    ruby \
    tmux \
    unrar \
    unzip \
    xclip \
    yarn \
    yay \
    zip \
    zsh
sudo pacman -S --needed --noconfirm docker docker-compose
sudo pacman -S python2-pip
yay ruby-neovim # need to find a way to automate this (with no confirm)
sudo pip install neovim
sudo pip3 install neovim
sudo groupadd docker
sudo usermod -aG docker $USER

mkdir ~/.bin
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O ~/.bin/diff-so-fancy
chmod +x ~/.bin/diff-so-fancy

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
sudo rm -f ~/.eslintrc

dotfiles_dir=~/dotfiles

mkdir -p ~/.config/nvim

ln -sf $dotfiles_dir/vim/vimconf ~/.vim
ln -sf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -sf $dotfiles_dir/nvim/init.vim ~/.config/nvim/init.vim
ln -sf $dotfiles_dir/vim/vimrc.bepo ~/.vimrc.bepo
ln -sf $dotfiles_dir/shell/tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/shell/zshrc ~/.zshrc
ln -sf $dotfiles_dir/git/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/git/gitignore ~/.gitignore
ln -sf $dotfiles_dir/prog/eslintrc.js ~/.eslintrc.js
ln -sf $dotfiles_dir/prog/prettierrc ~/.prettierrc
ln -sf $dotfiles_dir/phpactor ~/.config/phpactor
mkdir ~/.i3 && ln -sf $dotfiles_dir/i3/config ~/.i3/config
ln -sf $dotfiles_dir/i3/i3status.conf ~/.i3status.conf

mkdir -p ~/.vim/backup
vim +PluginInstall +qall

# npm global
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

npm install -g tldr fkill-cli
npm install -g eslint-plugin-react eslint@4.x babel-eslint@8

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

composer global require hirak/prestissimo
