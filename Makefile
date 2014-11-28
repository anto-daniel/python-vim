all: source install

source: powerline powerline-fonts

powerline:
	git clone https://github.com/Lokaltog/powerline.git
	cd powerline && python setup.py build && python setup.py install

powerline-fonts:
	apt-get install fontconfig -y
	git clone https://github.com/Lokaltog/powerline-fonts.git
	cd powerline-fonts && ./install.sh & fc-cache -vf

install:
	cp -rf .vimrc ${HOME}
	cp -rf .vim ${HOME}

clean:
	rm -rf powerline powerline-fonts
