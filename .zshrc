#---------------------
# 
#---------------------

#powerline-daemon -q
#. /usr/local/var/pyenv/versions/anaconda3-2.5.0/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh
# Created by newuser for 5.2

export TERM='xterm-256color'


if [[ -e $HOME/.local_aliases.zsh ]] ; then
	source $HOME/.local_aliases.zsh
fi


case ${OSTYPE} in
	darwin*)
		#paths
		path_prepend /usr/local/bin
		path_append /Applications/MacVim.app/Contents/MacOS
		path_append ~/.dotfiles_old/.zsh/bin/
		path_append /Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin
		export PATH=$PATH:/Users/hiroshi/pycli
		export PATH=$PATH:/Users/hiroshi/ta

		#aliases
		alias ls="ls -F"
		source $HOME/.dotfiles_old/.zsh/aliases.zsh
		
		#環境変数LANG
		export LANG=ja_JP.UTF-8
		
		#---------------------
		# ssh-agent
		#---------------------
		ssh-add -K ~/.ssh/github_amenbo >> /dev/null
		ssh-add -K ~/.ssh/github_hrsma2i >> /dev/null

		#---------------------
		# zplug HOME
		#---------------------
		export ZPLUG_HOME=/usr/local/opt/zplug
		;;
	linux*)
		alias ls="ls -F --color" # ls color
		#---------------------
		# zplug HOME
		#---------------------
		export ZPLUG_HOME=~/.linuxbrew/opt/zplug
		;;
esac

# dein root
export XDG_CONFIG_HOME=$HOME/.dotfiles

#---------------------
# alias
#---------------------

alias l="ls -F"
alias la="l -a"
alias ll="l -al"
alias dt="cd ~/.dotfiles"
# git
alias br="git branch"
alias co="git checkout"
alias cob="git checkout -b"
alias diff="git diff"
alias st="git status"
alias add="git add"
alias cm="git commit"
alias amend="git commit --amend"
alias push="git push origin"
alias pull="git pull origin master"
alias merge="git merge"
alias reset="git reset"


#---------------------
# pyenv
#---------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#---------------------
#prompt 
#---------------------
#theme="green_python.zsh"
#theme_root="$HOME/.dotfiles_old/.zsh/prompt_theme/"
#theme_path=${theme_root}${theme}
#source $theme_path
#alias zp="nvim $theme_path"
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode


#補完機能
autoload -U compinit
compinit
#大文字と小文字区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#先方予測
#autoload predict-on
#predict-on

#---------------------
# history
#---------------------
# 履歴ファイルの保存先
export HISTFILE=~/.dotfiles_old/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_all_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
#historyから選択
hist_sentaku(){
    eval $(history | cut -f2 -d "	" | sentaku) 
    zle reset-prompt
}
zle -N hist_sentaku hist_sentaku
bindkey -v '' hist_sentaku

# 履歴から補完
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward


#ファイル一括リネーム renameコマンドでよくね？
autoload -Uz zmv
alias zmv='noglob zmv -W'

#useful cd
# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd
# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd
# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups



#---------------------
# space ship prompt
#---------------------
export SPACESHIP_PROMPT_ORDER=(
	user
	host
	git
	dir
	pyenv
	vi_mode
	char
)
export SPACESHIP_PROMPT_DEFAULT_PREFIX=" \b"
export SPACESHIP_PROMPT_SYMBOL=" \b"

# user
export SPACESHIP_USER_PREFIX=" "
export SPACESHIP_USER_COLOR="0}%b%K{14"
export SPACESHIP_USER_SUFFIX="%K{14} %b%F{14}%K{6}⮀%f%k"

# host
export SPACESHIP_HOST_PREFIX="%K{6} "
export SPACESHIP_HOST_COLOR="15}%b%K{6"
export SPACESHIP_HOST_SUFFIX="%K{6} %b%F{6}%K{0}⮀%f%k\n"

# git
export SPACESHIP_GIT_SYMBOL="  "
export SPACESHIP_GIT_PREFIX=" \b"
export SPACESHIP_GIT_BRANCH_COLOR="}%F{0}%K{10"
export SPACESHIP_GIT_STATUS_COLOR=$SPACESHIP_GIT_BRANCH_COLOR
export SPACESHIP_GIT_SUFFIX="%K{10} %b%F{10}%K{0}⮀%f%k"

# dir
export SPACESHIP_DIR_PREFIX="%K{0} "
export SPACESHIP_DIR_COLOR="11}%K{0"
export SPACESHIP_DIR_SUFFIX="%K{0} %b%F{0}%K{8}⮀%F{8}%K{0}⮀%f%k\n"

# pyenv
export SPACESHIP_PYENV_COLOR="0}%K{8"
export SPACESHIP_PYENV_SUFFIX="%K{8} %F{8}%K{0}⮀%f%k\n"

# zle vi mode
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
export SPACESHIP_VI_MODE_INSERT="%K{0}%F{8} INSERT "
export SPACESHIP_VI_MODE_NORMAL="%K{11}%F{0} NORMAL "
export SPACESHIP_VI_MODE_SUFFIX="%b%F{0}%K{8}⮀%F{8}%K{7}⮀%F{7}%K{0}⮀%f%k"
export SPACESHIP_VI_MODE_COLOR=$VI_INSERT_MODE_COLOR
#color palet
#Black   [ 0] [ 8]
#Red     [ 1] [ 9]
#Green   [ 2] [10]
#Yellow  [ 3] [11]
#Blue    [ 4] [12]
#Magenta [ 5] [13]
#Cyan    [ 6] [14]
#White   [ 7] [15]
function zle-keymap-select zle-line-init zle-line-finish
{
	case $KEYMAP in
		main|viins)
			export SPACESHIP_VI_MODE_SUFFIX="%b%F{0}%K{8}⮀%F{8}%K{7}⮀%F{7}%K{0}⮀%f%k"
			;;
		vicmd)
			export SPACESHIP_VI_MODE_SUFFIX="%b%F{11}%K{0}⮀%F{0}%K{11}⮀%F{11}%K{0}⮀%f%k"
			;;
	esac
	zle reset-prompt
}
#---------------------
# zplug
#---------------------
source $ZPLUG_HOME/init.zsh
# 未インストール項目をインストールする
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

#---------------------
# git dotfiles
#---------------------
# upload
dotpush () {
	cd ~/.dotfiles
	git add .
	git commit
	git push origin master
	cd -
}
# download
dotpull () {
	cd ~/.dotfiles
	git pull origin master
	cd -
}

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
#
#x: clear

#=[foreground][background]
color_directory=Gx
color_symlink=Fx
color_socket=Cx
color_pipe=Cx
color_excutable=bx
color_block=Cg
color_character=Cd
export LSCOLORS="${color_directory}${color_symlink}${color_socket}${color_pipe}${color_excutable}${color_block}${color_character}abagacad"

