#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

# Add PPA

## Python
add-apt-repository ppa:deadsnakes/ppa -y > /dev/null

## NodeJS
### curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - > /dev/null
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - > /dev/null
echo 'deb https://deb.nodesource.com/node_10.x xenial main' > /etc/apt/sources.list.d/nodesource.list
echo 'deb-src https://deb.nodesource.com/node_10.x xenial main' >> /etc/apt/sources.list.d/nodesource.list

## Yarn
curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - > /dev/null
echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
## ZSH
curl -s https://download.opensuse.org/repositories/shells:zsh-users:zsh-completions/xUbuntu_16.04/Release.key | apt-key add - > /dev/null
echo "deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_16.04/ /" > /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list

# Update
sudo apt-get update > /dev/null

# git
sudo apt-get install -y git > /dev/null
echo 'Git version'
git --version

# nodeJS
sudo apt-get install -y nodejs > /dev/null
echo 'Node.JS version'
node --version

# yarn update
sudo apt-get install -y yarn > /dev/null
echo 'Yarn version'
yarn --version

# zsh
sudo apt-get install -y zsh > /dev/null
echo 'ZSH version'
zsh --version

# Oh-my-zsh:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change shell:
chsh -s $(which zsh)

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-completions
sudo apt-get install zsh-completions
