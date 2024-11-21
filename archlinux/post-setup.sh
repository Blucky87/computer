mkdir $HOME/repos

cd $HOME/repos

git clone https://aur.archlinux.org/yay.git && \
	cd yay && makepkg -si


usermod -aG tty,video,audio bluckenbill
chsh -s $(which zsh)
