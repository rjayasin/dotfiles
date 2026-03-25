all: sync

sync:
	ln -sf $(PWD)/.vimrc ~/.vimrc
	ln -sf $(PWD)/.zshrc ~/.zshrc
	ln -sf $(PWD)/.gitconfig ~/.gitconfig
	ln -sf $(PWD)/.gitignore_global ~/.gitignore_global
	ln -sf $(PWD)/.tmux.conf ~/.tmux.conf

	touch ~/.hushlogin

clean:
	rm -f ~/.vimrc
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -f ~/.tmux.conf
	rm -f ~/.zshrc
	rm -f ~/.hushlogin

.PHONY: all clean sync 
