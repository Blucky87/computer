mkdir $HOME/repos

cd $HOME/repos

git clone https://aur.archlinux.org/yay.git && \
	cd yay && makepkg -si

echo "tmpfs /tmp tmpfs size=512M 0 0" >> /etc/fstab
