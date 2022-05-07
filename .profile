if [ -z "$XDG_RUNTIME_DIR" ]
then
    export XDG_RUNTIME_DIR=/tmp/runtime/maria
    if [ ! -d "$XDG_RUNTIME_DIR" ]
    then
        mkdir -p "$XDG_RUNTIME_DIR"
        chmod 0700 "$XDG_RUNTIME_DIR"
    fi
fi

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export ENV=~/.env
export PATH=~/bin/$(hostname):~/bin/$(uname -m):~/bin:$PATH
export EDITOR="nvim"
