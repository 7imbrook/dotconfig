#!/bin/bash

## Lets make sure we have everything we need installed
# TODO
# 0. xcode (sigh, but maybe not...)
# 1. brew
# 2. neovim
# 3. python3
# 4. pip3
#   a. neovim
#   b. neovim-remote
# 5. Plug
# 6. seil, karabiner
# 7. zsh
# 8. .oh-my-zsh (latest)

## Brew
echo """#####################
Installing homebrew and home brewable things, yes, this script is mac only....
This will take a while so get a coffee, and think about how you can rewrite the world """;
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap neovim/neovim
brew update
brew install python3 zsh neovim

## Python deps
pip3 install neovim neovim-remote

## Clone/or move my .config into ~/.config
echo "Removing old .config and replacing with this, pluggins will reinstall";
rm -rf ~/.config
mkdir ~/.config
if git status > /dev/null ; then
    # Yeah it's cloned!
    echo "Copying local clone";
    cp -R $(git rev-parse --show-toplevel)/ ~/.config/
else
    echo "Download .config from github...";
    curl -L https://github.com/7imbrook/dotconfig/archive/master.zip -o /tmp/config.zip -s
    unzip -n /tmp/config.zip -d ~/
    rm -rf .config/
    mv ~/dotconfig-master ~/.config
fi;

## Install Plug
## Launch neovim and run PlugInstall with nvr

## Install fun stuff in the background, you've already waited long enough
function theOtherStuff {
    (
	source ~/.config/setup/post-install.sh
    ) > /tmp/shell-install.log 2>&1  
}
echo "Finish with the important stuff, running the post-install.sh script in setup in the background";
theOtherStuff &
