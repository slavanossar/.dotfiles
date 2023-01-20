#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Xcode CLI Tools
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
