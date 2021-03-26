#!/usr/bin/env bash

function personalconfig() {
  pwd=$(pwd) && cd $HOME
  git config --global user.email "eduardobastier93@gmail.com"
  git config --global user.name "Eduardo Bastier"
  git config --global http.postBuffer 524288000
  rm -rf $HOME/.zsh_history && wget https://raw.githubusercontent.com/mamutal91/zsh-history/master/.zsh_history
  mkdir -p $HOME/{Images,Videos} &>/dev/null
  cd $pwd
}

# Install YAY AUR Manager
pwd=$(pwd)
rm -rf $HOME/yay && git clone https://aur.archlinux.org/yay.git $HOME/yay && cd $HOME/yay && makepkg -si --noconfirm && rm -rf $HOME/yay
cd $pwd

# Load packages
source $HOME/.dotfiles/setup/packages.sh

# GPG Key Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import -

# Install packages
for i in "${PACKAGES[@]}"; do
  sudo pacman -Sy ${i} --needed --noconfirm
done

for i in "${AUR[@]}"; do
  yay -Sy ${i} --needed --noconfirm
done

# Atom packages
ATOM="
  atom-beautify
  atom-material-syntax
  color-picker
  file-icons
  flatten-json
  ftp-remote-edit
  highlight-selected
  indent-sort
  language-i3wm
  language-swaywm
  mamutal91-shellscript-snippets-atom
  markdown-writer
  pigments
  save-workspace"

apm install $ATOM

# Enable systemd services
for SERVICES in \
    cronie \
    bluetooth \
    getty@ttyN.service
do
    sudo systemctl enable $SERVICES
    sudo systemctl start $SERVICES
done

source $HOME/.dotfiles/setup/etc.sh

if [[ $USER = "eduardobastier" ]]; then
  echo "Set personal configs"
  personalconfig
fi

chsh -s $(which zsh)
