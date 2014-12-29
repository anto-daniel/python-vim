all: source install

source: powerline powerline-fonts

powerline:
	git clone https://github.com/Lokaltog/powerline.git
	cd powerline && python setup.py build && python setup.py install

powerline-fonts:
	apt-get install fontconfig wget -y
	mkdir -p ~/.config/fontconfig/conf.d/ 
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
	wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate
	mkdir -p ~/.fonts && mv PowerlineSymbols.otf ~/.fonts
	mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
	fc-cache -vf

install:
	cp -rf .vimrc ${HOME}
	cp -rf .vim ${HOME}
	/bin/bash -xx .new.sh


clean:
	rm -rf powerline powerline-fonts
