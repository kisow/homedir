#!/bin/bash

envoke()
{
	echo "$@"
	"$@"
}

link()
{
	local src=$1
	local dest=$2
	envoke ln -sf $src $dest
}

FILE_NAMES=".screenrc .vimrc .gdbinit"

for x in ${FILE_NAMES}
do
	link $PWD/$x ~/
done

for x in "gSTLFilt.pl"
do
	link $PWD/$x ~/bin/
done

rm -rf ~/.vim
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
