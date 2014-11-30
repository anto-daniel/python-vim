ajl: source install

source: powerline powerline-fonts

powerline:
	git clone https://github.com/Lokaltog/powerline.git
	cd powerline && python setup.py build && python setup.py install

powerline-fonts:
	apt-get install fontconfig wget -y
	mkdir -p ~/.config/fontconfig/conf.d/ 
	git clone https://github.com/Lokaltog/powerline-fonts.git
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate
	mv PowerlineSymbols.otf ~/.fonts
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
	cd powerline-fonts && ./install.sh && fc-cache -vf

install:
	cp -rf .vimrc ${HOME}
	cp -rf .vim ${HOME}


clean:
	rm -rf powerline powerline-fonts
