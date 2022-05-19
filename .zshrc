# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/maria/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Called before prompt(?)
function precmd {
    # Set window title
    print -Pn "\e]0;zsh %~\e\\"
}

# Called when executing a command
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

PS1="$(prompt) $ "
export GPG_TTY="$(tty)"

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
