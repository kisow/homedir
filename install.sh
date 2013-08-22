#!/bin/bash

envoke()
{
	echo "$@"
	"$@"
}

link()
{
	local file_name=$1
	envoke ln -sf $PWD/$file_name ~/$file_name
}

FILE_NAMES=".screenrc .vimrc .gdbinit"

for x in ${FILE_NAMES}
do
	link $x
done
