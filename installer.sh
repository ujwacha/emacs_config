#!/bin/bash

## move the $HOME/.emacs.d  folder to ~/.emacs.d.old

mv $HOME/.emacs.d $HOME/.emacs.d.old
mv $HOME/.emacs $HOME/.emacs.old


mkdir $HOME/.emacs.d

cp $(pwd)/*.el $HOME/.emacs.d/

cp $(pwd)/*.org $HOME/.emacs.d/

echo "All done"
