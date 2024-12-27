
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/flutter/bin"
export CC=/opt/homebrew/opt/llvm/bin/clang
export AR=/opt/homebrew/opt/llvm/bin/llvm-ar
export GECKODRIVER="/$HOME/work/geckodriver"
export PATH="~/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=1000000
export HISTSIZE=1000000
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export GPG_TTY=$(tty)
. "~/.deno/env"
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
source $ZSH/oh-my-zsh.sh
#Theme
ZSH_THEME="robbyrussell"
#Plugins
plugins=(git rust zsh-autosuggestions zsh-syntax-highlighting zsh-autocomplete)
# User configuration
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#66666,bg=#1c1c1c,bold,underline"
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '~/.opam/opam-init/init.zsh' ]] || source '/Users/borngraced/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

