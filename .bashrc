# dein root
export XDG_CONFIG_HOME=$HOME/.dotfiles

# ls by case
case $OSTYPE in
	darwin*)
		alias ls="ls -GF"
		;;
	linux*)
		alias ls="ls -F --color"
		;;
esac

# alias
alias l="ls -F"
alias la="l -a"
alias ll="l -al"
alias dt="cd ~/.dotfiles"

# TERM="xterm-256color"

# vi mode
#set -o vi

# prompt
BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"

PEECH="\e[48;5;209m"

RESET="\e[0m"

REV="\e[7m"
#function prompt {
#	PS1="\[$YELLOW\]\w\[$RESET\] \[$RED\]>\[$RESET\]\[$YELLOW\]>\[$RESET\]\[$GREEN\]>\[$RESET\]"
#	echo -e "$(date +%R) $PWD"
#}
#PROMPT_COMMAND='prompt'
PS1="\[\e[0m\]>>>"

if [ `hostname` == "matsuiatsushi-no-MacBook-Pro.local" ]; then
	echo ' 
                                  .(XMTXdN; .
                               ?(SC><! !. (v1{
                     .,        (Mkyz<__.  _?-.-.               
                   .JH]   .,   MN#MHmsx++-(-?/.5                  
                   dHF   .H#  .NMN###MMHkkkz+?JX%                   
                 ..HH% ..HHF .?TMM8HYHMMMMHkkkWY               
               .JMHH@@l(@HP .He+-_?h--SgKTWWHMN:                 
             .JgF  W@MHHHt  .WMmQWG&J(,   .jSe$    ..              
            .MJi,.. dMNHhk,    ?4HHMNmHm&+dY+= .a.JMBx(<_...
          .H#MhWYH+WmMHmjH#hgM####HHMH@@"=    JgMNM4,.   ~?ix>+_..  
       .(W#MY=    JMTMHfMMMMMHNMHNN##HHMm+, .dJM#bdBmH4,       ?4ML
    .WN,YWG.    .k#! dWMHHMMHMMMMN##MNMMmq\.MMM=   "W.#aX4,      Wd,
   .M#   .T1.   78.  ?9"""""7!~    jVMMMMB+MMY   ..   ?UeMN\     .hN
  .NJ      ?(,   (Q,                .TMBjNHD  .+MMF     .MM\      (g]
 .bd        (-!   ?N,                 OM,   .d#^       .bMd!       W}
 JH          .:     ?.                 WN...kN.         MNd 
 J                                     .MMNMMF          jhK    
                                            ?Mm,..      -MF
                                              TMM^       ?!
'
echo '
            ____        __          ____              
           / __ )____ _/ /_  __  __/ __/___ _________ 
          / __  / __ `/ __ \/ / / / /_/ __ `/ ___/ _ \
         / /_/ / /_/ / /_/ / /_/ / __/ /_/ / /__/  __/
        /_____/\__,_/_.___/\__, /_/  \__,_/\___/\___/ 
                          /____/                      
'
	PS1="\u@\h👶\n"$PS1
fi
