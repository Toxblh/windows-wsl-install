# Install ZSH and Oh-my-zsh
# ZSH:            https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH
# Oh-my-zsh:      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Change shell:   chsh -s $(which zsh)
# Test:           echo $SHELL
# Finish          zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# powerlevel10k
# https://github.com/romkatv/powerlevel10k ~/.oh-my-zsh/custom/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator vcs time)

plugins=(
  git

# zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  zsh-autosuggestions

# zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  zsh-syntax-highlighting

# zsh-users/zsh-completions
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

  zsh-completions
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
