all: sync

sync:
	[ -f ~/.vimrc ] || ln -s $(PWD)/.vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/.zshrc ~/.zshrc
	[ -f ~/.gitconfig ] || ln -s $(PWD)/.gitconfig ~/.gitconfig
	[ -f ~/.gitignore_global ] || ln -s $(PWD)/.gitignore_global ~/.gitignore_global
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/.tmux.conf ~/.tmux.conf

clean:
	rm -f ~/.vimrc 
	rm -f ~/.gitconfig
	rm -f ~/.gitignore_global
	rm -f ~/.tmux.conf
	rm -f ~/.zshrc

.PHONY: all clean sync 
