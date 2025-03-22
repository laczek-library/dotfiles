# Inspired by https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc
# Plugin Manager from git-docs
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Loading auto-complete
autoload -U compinit && compinit

zinit cdreplay -q

# Theme
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.toml)"

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# History
HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# aliases
alias ls='ls --color'
alias ll='ls -al --color'
alias c='clear'
alias ..='cd ..'

export PATH=$PATH:$HOME/.local/bin
