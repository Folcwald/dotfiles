eval "$(dircolors /home/rob/.dir_colors)"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/rob/.zshrc'

autoload -Uz compinit promptinit colors
compinit
promptinit
colors
zmodload zsh/complist
prompt adam2 8bit blue yellow green cyan
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
setopt HIST_IGNORE_DUPS
# unsetopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install
zstyle ':completion:*' menu select list-colors "=(#b)
# ([0-9]#)*=$color[cyan]=$color[red]"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]"
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo

typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

alias ll='ls -alFh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias lt='ls -altch --color=auto'
alias grep='grep --color=auto'
alias so='xset -dpms ; xset s off'
alias ss='xset +dpms'
alias yt='youtube-viewer'
alias nt='nvidia-settings -t -q GPUCoreTemp'
alias tp='/home/rob/bin/takepic'
alias clr='clear'
alias ez='vim /home/rob/.zshrc'
alias ei3='vim /home/rob/.i3/config'
alias yi='sudo yaourt -S'
alias yup='sudo yaourt -Syua'
alias ys='yaourt -Ss'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Set up a clipboard for use with the system - copied from stackexchange
vi-append-x-selection () { RBUFFER=$(xsel -o -p </dev/null)$RBUFFER; }
zle -N vi-append-x-selection
bindkey -a '^X' vi-append-x-selection
vi-yank-x-selection () { print -rn -- $CUTBUFFER | xsel -i -p; }
zle -N vi-yank-x-selection
bindkey -a '^Y' vi-yank-x-selection
