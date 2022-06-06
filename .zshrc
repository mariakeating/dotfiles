# Set window title to path
function precmd {
    print -Pn "\e]0;zsh %~\e\\"
}

# Set window title to command
function preexec {
    print -Pn "\e]0;${(q)1}\e\\"
}

setopt PROMPT_SUBST
PS1='$(prompt) $ '

export GPG_TTY="$(tty)"

alias ls='ls --color=auto'
alias grep='grep --colour=auto'
