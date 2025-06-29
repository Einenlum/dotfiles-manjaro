#!/bin/bash

# Browsers
sudo pamac update --no-confirm


# Dev tools
sudo pamac install --no-confirm \
    base-devel \
    bat \
    brave-browser \
    broot \
    chromium \
    dmenu \
    docker \
    docker-compose \
    eza \
    fd \
    firefox \
    fzf \
    fzy \
    gcc \
    git-delta \
    gnome-terminal \
    gtk-engine-murrine \
    go \
    gvim \
    highlight \
    i3-gaps \
    i3status \
    jq \
    kdiff3 \
    kitty \
    meld \
    neovim \
    nitrogen \
    nodejs \
    noto-fonts-emoji \
    npm \
    p7zip \
    pcmanfm \
    peek \
    php \
    postgresql \
    python-pip \
    python-pynvim \
    ripgrep \
    rofi \
    ruby \
    signal-desktop \
    starship \
    ttf-fira-code \
    ttf-jetbrains-mono \
    ttf-roboto-mono \
    tmux \
    unrar \
    unzip \
    vivid \
    xclip \
    yarn \
    yay \
    zip \
    zoxide

yay ruby-neovim # need to find a way to automate this (with no confirm)
yay sublime-text-4
yay visual-studio-code-bin # uses the proprietary version instead of the openvsx one
yay insomnia-bin
yay i3lock-fancy # lock the screen
yay ttf-ms-fonts # comic sans ms, arial, times new roman
yay ttf-vista-fonts # calibri, cambria, consolas
sudo pip install neovim
sudo pip3 install neovim
sudo groupadd docker
sudo usermod -aG docker $USER
sudo usermod -aG wheel $USER
sudo usermod -aG video $USER
# Add docker on startup
sudo systemctl enable --now docker

# Install psysh
wget https://psysh.org/psysh
chmod +x psysh
sudo mv psysh /usr/local/bin/.

mkdir ~/.bin

sudo rm -Rf ~/.vim
sudo rm -Rf ~/.vimrc
sudo rm -Rf ~/.config/nvim
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

ln -sf $dotfiles_dir/nvim ~/.config/nvim
ln -sf $dotfiles_dir/shell/starship ~/.config/starship
ln -sf $dotfiles_dir/shell/tmux.conf ~/.tmux.conf
ln -sf $dotfiles_dir/shell/zshrc ~/.zshrc
ln -sf $dotfiles_dir/git/gitconfig ~/.gitconfig
ln -sf $dotfiles_dir/git/gitignore ~/.gitignore
ln -sf $dotfiles_dir/prog/eslintrc.js ~/.eslintrc.js
ln -sf $dotfiles_dir/prog/prettierrc ~/.prettierrc
ln -sf $dotfiles_dir/phpactor ~/.config/phpactor
mkdir -p ~/.config/i3 && ln -sf $dotfiles_dir/i3/config ~/.config/i3/config
ln -sf $dotfiles_dir/i3/i3status.conf ~/.i3status.conf
mkdir -p ~/.config/kitty
ln -sf $dotfiles_dir/shell/kitty.conf ~/.config/kitty/kitty.conf

mkdir -p ~/.config/nvim/backup

# npm global
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

npm install -g tldr fkill-cli neovim
npm install -g eslint-plugin-react eslint@4.x babel-eslint@8

/bin/bash -c "$(curl -fsSL https://php.new/install/linux)"

# Set default browser
dg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http

# Install fonts
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Mononoki.zip
unzip Mononoki.zip -d mononoki
sudo cp -R mononoki /usr/share/fonts/.

wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
unzip Hack-v3.003-ttf.zip -d hack
sudo cp -R hack /usr/share/fonts/.

# Regenerate fonts cache
fc-cache -f -v

# Install kitty themes
KITTY_THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/ayu_mirage.conf
wget "$KITTY_THEME" -P ~/.config/kitty/themes

# initialize broot
broot --install

# Install nord vivid theme (for ls output)
mkdir -p ~/.config/vivid/themes
wget -O ~/.config/vivid/themes/nord.yml https://raw.githubusercontent.com/sharkdp/vivid/master/themes/nord.yml

# Install rofi themes
cd /tmp && git clone --depth=1 https://github.com/adi1090x/rofi.git
cd rofi && chmod +x setup.sh
./setup.sh

echo '@import "~/.config/rofi/colors/gruvbox.rasi"' > launchers/type-1/shared/colors.rasi

cat <<EOF > ~/.config/rofi/launchers/type-1/shared/fonts.rasi
* {
    font: "JetBrains Mono Nerd Font 9";
}
EOF

sudo tee /etc/X11/xorg.conf.d/10-brightness.conf > /dev/null <<EOF
Section "Device"
    Identifier  "Intel Graphics" 
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
EOF

# Install poetry
curl -sSL https://install.python-poetry.org | python3 -

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# Add Natural Scrolling in libinput conf
sudo sed -i '/Identifier "libinput touchpad catchall"/a \ \ \ \ \ \ \ \ Option "NaturalScrolling" "True"' /usr/share/X11/xorg.conf.d/40-libinput.conf
