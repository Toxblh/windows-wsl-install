#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

UBUNTU_VERSION=`lsb_release -r | awk '{print $2}'`

echo "==================================="
echo "====      Toxblh WSL pack      ===="
echo "==================================="

echo "Initialise"

# Check curl
apt-get update > /dev/null
apt-get install curl -y > /dev/null

# Add PPA

## Python
add-apt-repository ppa:deadsnakes/ppa -y > /dev/null

## NodeJS
### curl -sL https://deb.nodesource.com/setup_10.x | -E bash - > /dev/null
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - > /dev/null
echo 'deb https://deb.nodesource.com/node_10.x xenial main' > /etc/apt/sources.list.d/nodesource.list
echo 'deb-src https://deb.nodesource.com/node_10.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Yarn
curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - > /dev/null
echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Update
apt-get update > /dev/null

# Fira Code
apt install fonts-firacode > /dev/null

#  ncurses-dev
apt-get install -y ncurses-dev build-essential > /dev/null
echo 'Ncueses and Build Essential'

# git
apt-get install -y git > /dev/null
echo 'Git version'
git --version

# nodeJS
apt-get install -y nodejs > /dev/null
echo 'Node.JS version'
node --version

# yarn update
apt-get install -y yarn > /dev/null
echo 'Yarn version'
yarn --version

# zsh
apt-get install -y zsh > /dev/null
echo 'ZSH version'
zsh --version

# Oh-my-zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-completions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# Copy .zshrc
curl -s "https://raw.githubusercontent.com/Toxblh/windows-wsl-install/master/.zshrc" > ~/.zshrc

exec "$(which zsh)"

echo "Execute \"chsh -s $(which zsh)\" for change shell to zsh"
