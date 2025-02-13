
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Export paths and environment variables
export PATH="$HOME/flutter/bin:$HOME/.local/bin:/opt/homebrew/opt/llvm/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export CC=/opt/homebrew/opt/llvm/bin/clang
export AR=/opt/homebrew/opt/llvm/bin/llvm-ar
export GECKODRIVER="$HOME/work/geckodriver"
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=1000000
export HISTSIZE=1000000
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export GPG_TTY=$(tty)

# Manpages
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[100;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34m'
export GROFF_NO_SGR=1

# Aliases
alias v="nvim"
alias z="zellij -l welcome"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias kdf="nvim ~/work/komodefi"

# Theme
ZSH_THEME="evan"

# Plugins
plugins=(git rust zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#66666,bg=#1c1c1c,bold,underline"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# opam configuration
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null 
