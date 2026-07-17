all: sync

sync:
	# Keep symlinks alphabetized
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf
	ln -sf $(PWD)/.vimrc ~/.vimrc
	ln -sf $(PWD)/.zshrc ~/.zshrc
	mkdir -p ~/.config/nvim
	ln -sf $(PWD)/.config/nvim/init.vim ~/.config/nvim/init.vim

	touch ~/.hushlogin

clean:
	# Keep files alphabetized
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -f ~/.hushlogin
	rm -f ~/.tmux.conf
	rm -f ~/.vimrc
	rm -f ~/.zshrc

.PHONY: all clean sync 
