if status is-interactive
    set -g fish_greeting 'Hey, sami!'
    set -g fish_key_bindings fish_vi_key_bindings

    # Paths
    set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $PATH
    set -gx PATH $HOME/.cargo/bin $PATH
    set -gx PATH $HOME/bin $PATH
    set -gx PATH $HOME/bin $PATH
    set -U fish_user_paths /opt/local/bin /opt/local/sbin $fish_user_paths

    # Editors
    set -gx EDITOR vim
    set -gx VISUAL vim

    # Compiler tools
    set -gx CC /opt/homebrew/opt/llvm/bin/clang
    set -gx AR /opt/homebrew/opt/llvm/bin/llvm-ar
    set -gx GECKODRIVER $HOME/work/geckodriver
    set -gx HISTFILE $HOME/.local/share/fish/fish_history
    set -gx SAVEHIST 1000000
    set -gx HISTSIZE 1000000
    set -gx LS_COLORS 'ow=36:di=34:fi=32:ex=31:ln=35:'
    set -gx GPG_TTY (tty)
    set -gx PKG_CONFIG_PATH (brew --prefix)/lib/pkgconfig $PKG_CONFIG_PATH

    # Manpages
    set -gx LESS_TERMCAP_md (echo -e '\e[32m')
    set -gx LESS_TERMCAP_me (echo -e '\e[0m')
    set -gx LESS_TERMCAP_se (echo -e '\e[0m')
    set -gx LESS_TERMCAP_so (echo -e '\e[100;37m')
    set -gx LESS_TERMCAP_ue (echo -e '\e[0m')
    set -gx LESS_TERMCAP_us (echo -e '\e[34m')
    set -gx GROFF_NO_SGR 1

    # Aliases
    alias v="vim"
    alias zlw="zellij -l welcome"
    alias zshconfig="nvim ~/.zshrc"
    alias kdf="cd ~/work/komodefi; vim ."
    alias ff="xplr"
    alias m="man -M $HOME/ubuntu-man"
    alias g="git"
    alias gc="git checkout"
    alias gp="git pull"
    alias gm="git merge"
    alias ll="eza -alf"
    alias la="eza -a"
    alias l="eza -cf"
    alias grep="rg"
    # alias cd="zoxide"

    # fzf integration
    if test -f ~/.fzf.fish
        source ~/.fzf.fish
    end

    # iTerm2 shell integration
    if test -e "$HOME/.iterm2_shell_integration.fish"
        source "$HOME/.iterm2_shell_integration.fish"
    end

    # opam configuration
    if test -r "$HOME/.opam/opam-init/init.fish"
        source "$HOME/.opam/opam-init/init.fish" >/dev/null 2>/dev/null
    end
end
