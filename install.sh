# git
sudo apt update && sudo apt install -y git

# nodeJS
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - > /dev/null
sudo apt-get install -y nodejs > /dev/null
echo 'node version'
node --version

# yarn update
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - > /dev/null
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install -y yarn > /dev/null
echo 'yarn version'
yarn --version

# zsh
sudo apt-get install -y zsh

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
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/shells:zsh-users:zsh-completions.list"
sudo apt-get update
sudo apt-get install zsh-completions
