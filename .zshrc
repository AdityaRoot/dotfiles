# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adi/.zshrc'
fpath=(/home/adi/.config/zsh/_lf.zsh $fpath)
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

export VISUAL=nvim
export EDITOR="$VISUAL"


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Allow using lf to navigate system
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

#allow vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Source nvm
# source /usr/share/nvm/init-nvm.sh
# Lazy version
lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

# define aliases
source /home/adi/.config/zsh/zshaliases.zsh

# zsh autosuggestions source
source /home/adi/.config/zsh/scripts/zsh-autosuggestions/zsh-autosuggestions.zsh

#zsh sudo plugin source
source /home/adi/.config/zsh/scripts/sudoplugin/sudo.plugin.zsh

#autojump source
source /home/adi/.autojump/share/autojump/autojump.zsh

#navi install with ctrl-G
eval "$(navi widget zsh)"

export MOZ_ENABLE_WAYLAND=1
export MOZ_DISABLE_RDD_SANDBOX=1

export LC_ALL=en_US.UTF-8


#ptsh install
path+=("/home/adi/.local/bin")
#Add cargo binaries to path
path+=("/home/adi/.cargo/bin")
#Add doom emacs to path
path+=("/home/adi/.emacs.d/bin")
#k file plugin
source /home/adi/.config/zsh/scripts/kfile/k.plugin.zsh
alias k="k -h"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#source at end of file, syntax highlighting
source /home/adi/.config/zsh/scripts/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#uh... starship also wants to be sourced at the end of the file soooooo lets see if it breaks anything lol

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/adi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/adi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/adi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/adi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

