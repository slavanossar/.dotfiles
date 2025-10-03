#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
  # Create symlinks for dotfiles
  ln -sf "$(pwd)/.aliases" ~/.aliases
  ln -sf "$(pwd)/.exports" ~/.exports
  ln -sf "$(pwd)/.functions" ~/.functions
  ln -sf "$(pwd)/.zshrc" ~/.zshrc
  
  # Copy fonts
  cp fonts/* ~/Library/Fonts;
  source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
