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
# Note: Expanded the tilde (~) to $HOME to prevent potential sourcing path bugs
export ZSH_CUSTOM="$HOME/.zsh/custom"

plugins=(
  git
  eza
  fzf
  git-commit

  # Custom plugins loaded automatically from $ZSH_CUSTOM/plugins/
  global-alias
  custom-utils
)
source $ZSH/oh-my-zsh.sh

# =============
# Starship
# =============
eval "$(starship init zsh)"

if [[ -s "$HOME/.local/bin/env" ]]; then
    source "$HOME/.local/bin/env"
fi