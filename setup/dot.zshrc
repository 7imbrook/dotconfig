# Oh my zsh stuff
export ZSH=/Users/michaeltimbrook/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# My stuff...
export DOTCONFIG_PATH=~/Projects/7imbrook/dotconfig

# Neovim Editor
export PATH=$PATH:$HOME/.config/bin/
if [[ -z $NVIM_LISTEN_ADDRESS ]]; then
  alias vim=nvim
else
  openWith() {
    python3 -c "from neovim import attach; vim = attach('socket', path='$NVIM_LISTEN_ADDRESS'); vim.command('$1 $2');"
  }

  vim() {
    openWith "tabe" $1
  }

  vsp() {
    openWith "vsp" $1
  }
  alias nvim=vim
  export EDITOR=nvrauto
fi

