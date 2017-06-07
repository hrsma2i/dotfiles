#---------------------
#prompt
#---------------------
al="⮀"
autoload promptinit
promptinit

#---------------------
#zsh vi mode
#---------------------
bindkey -v
autoload -Uz colors; colors
autoload -Uz add-zsh-hook
autoload -Uz terminfo
terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
left_down_prompt_preexec() {
    print -rn -- $terminfo[el]
}
add-zsh-hook preexec left_down_prompt_preexec

function zle-keymap-select zle-line-init zle-line-finish
{
    case $KEYMAP in
        main|viins)
            PROMPT_2="%K{3}%F{0} INSERT %F{3}%K{2}⮀%F{2}%K{1}⮀%F{1}%k⮀%f"
            ;;
        vicmd)
            PROMPT_2="%K{4}%F{15} NORMAL %F{4}%K{5}⮀%F{5}%K{15}⮀%F{15}%k⮀%f"
            ;;
        vivis|vivli)
            PROMPT_2="%K{4}%F{15} VISUAL %f%k"
            ;;
    esac

#prompt
    PROMPT="%K{1}%/%F{1}%K{2}⮀%F{2}%K{3}⮀%F{3}%k⮀%f
$PROMPT_2 "
    zle reset-prompt
}

#color palet
#Black   [ 0] [ 8]
#Red     [ 1] [ 9]
#Green   [ 2] [10]
#Yellow  [ 3] [11]
#Blue    [ 4] [12]
#Magenta [ 5] [13]
#Cyan    [ 6] [14]
#White   [ 7] [15]

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
bindkey -M viins 'jj' vi-cmd-mode

#---------------------
#ls color
#---------------------
#color palet
#Black   [ a] [ A]
#Red     [ b] [ B]
#Green   [ c] [ C]
#Yellow  [ d] [ D]
#Blue    [ e] [ E]
#Magenta [ f] [ F]
#Cyan    [ g] [ G]
#White   [ h] [ H]

color_directory=cx
color_symlink=gx
color_socket=Cx
color_pipe=Cx
color_excutable=ex
color_block=Cg
color_character=Cd
export LSCOLORS="${color_directory}${color_symlink}${color_socket}${color_pipe}${color_excutable}${color_block}${color_character}abagacad"


#---------------------
#zsh-syntax-highliting 
#---------------------

if [ -f ~/.dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.dotfiles/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#color palet
#Black   [ 0] [ 8]
#Red     [ 1] [ 9]
#Green   [ 2] [10]
#Yellow  [ 3] [11]
#Blue    [ 4] [12]
#Magenta [ 5] [13]
#Cyan    [ 6] [14]
#White   [ 7] [15]

ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=6
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=3
ZSH_HIGHLIGHT_STYLES[alias]=fg=4
ZSH_HIGHLIGHT_STYLES[builtin]=fg=4
ZSH_HIGHLIGHT_STYLES[function]=fg=4
ZSH_HIGHLIGHT_STYLES[command]=fg=4
ZSH_HIGHLIGHT_STYLES[precommand]=fg=4,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=4
ZSH_HIGHLIGHT_STYLES[path]=underline
ZSH_HIGHLIGHT_STYLES[path_prefix]=underline
ZSH_HIGHLIGHT_STYLES[path_approx]=fg=yellow,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=2
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=2
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none


