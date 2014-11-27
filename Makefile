install:
	cp -rfv .vimrc ${HOME}
	cp -rfv .vim ${HOME}
	apt-get update
	apt-get install python-pip -y 
	pip install -U pip
	pip install --user git+git://github.com/lokaltog/powerline
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
	mv PowelineSymbols.otf ~/.local/share/fonts/
	fc-cache -f -v
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	# Create a per-user fontconfig folder if it doesn't already exist
	mkdir -p ~/.config/fontconfig/fonts.conf
	mv 10-powerline-symbols.conf ~/.config/fontconfig/fonts.conf/

