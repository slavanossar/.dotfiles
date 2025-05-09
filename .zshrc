# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Set PATH, MANPATH, etc., for Homebrew on Apple Silicon
# eval "$(/opt/homebrew/bin/brew shellenv)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra,profile}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# mkcert
# export NODE_EXTRA_CA_CERTS="$(mkcert -CAROOT)/rootCA.pem"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
#source $(brew --prefix)/share/antigen/antigen.zsh

# Load Theme
#antigen use oh-my-zsh
#antigen theme denysdovhan/spaceship-prompt
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen apply

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
zstyle ':completion:*:(ssh|scp|sftp):*' hosts $(grep '^Host ' ~/.ssh/config | awk '{print $2}' | grep -v '[*?]')
