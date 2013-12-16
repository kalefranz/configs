#!/bin/bash

#################################################
# Create all the relevant symlinks for file
# in this repo
#################################################

FILENAMES=".gitconfig .gitignore_global .zshenv .zpreztorc .zshrc"

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for filename in $FILENAMES
do
	rm -f $HOME/$filename
	ln -s $SCRIPT_DIR/$filename $HOME/$filename
done

rm -f $HOME/.zprezto/modules/prompt/functions/prompt_kale_setup
ln -s $SCRIPT_DIR/prompt_kale_setup $HOME/.zprezto/modules/prompt/functions/prompt_kale_setup

sudo -p 'elevate privileges for symlinks in /etc
sudo password: ' rm -f /etc/zlogin
sudo ln -s $SCRIPT_DIR/etc_zlogin /etc/zlogin
