# trash
alias del="trash -r"
alias rm

# neovim
alias vim="nvim"

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
