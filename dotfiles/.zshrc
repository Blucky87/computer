# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2048
SAVEHIST=10000
setopt beep notify
# End of lines configured by zsh-newuser-install

 source $HOME/.zkbd/alacritty &&
	[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char 
	[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char 
	[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
	[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
	[[ -n ${key[Cleft]} ]] && bindkey "${key[Cleft]}" backward-word
	[[ -n ${key[Cright]} ]] && bindkey "${key[Cright]}" forward-word
	[[ -n ${key[ShCleft]} ]] && bindkey "${key[ShCleft]}" backward-delete-word
	[[ -n ${key[ShCright]} ]] && bindkey "${key[ShCright]}" forward-delete-word
	[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char


[[ $(command -v lsd) ]] && alias ls=lsd || echo "[ lsd ] command not found"

alias v=vim

PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
