# linuxbrew
export PATH="~/.linuxbrew/bin:~/.linuxbrew/sbin:$PATH"

# trash
alias del="trash -r"
alias rm="echo 'You should use \"del\" command, instead of \"rm\". 
If you completely remove the file, you have to use \"/bin/rm\"'"

# pyenv
export PYENV_ROOT=~/.pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# miniconda
export PATH="~/miniconda3/bin:$PATH"

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
