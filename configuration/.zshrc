# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2048
SAVEHIST=10000
setopt beep notify
# End of lines configured by zsh-newuser-install

source $HOME/.zkbd/$TERM &&
	[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char 
	[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char 
	[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
	[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
