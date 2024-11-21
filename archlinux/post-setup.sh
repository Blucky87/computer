mkdir $HOME/repos

cd $HOME/repos

git clone https://aur.archlinux.org/yay.git && \
	cd yay && makepkg -si
