# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/piloero/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# =============
# key bindings
# =============
bindkey '^R' history-incremental-search-backward

# =============
# oh my zsh
# =============
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
)
source $ZSH/oh-my-zsh.sh

# =============
# Starship
# =============
eval "$(starship init zsh)"
