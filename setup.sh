#! /usr/bin/sh
cd $HOME; mkdir .vim; cd .vim
touch vimrc; printf '%s\n%s\n' "Replaced on $(date) with current vimrc" "$(cat vimrc)" > fallback-vimrc
curl -s https://raw.githubusercontent.com/gsobell/ready-set-vimtex/main/vimrc > vimrc
mkdir -p UltiSnips; cd UltiSnips
curl -s https://raw.githubusercontent.com/gsobell/ready-set-vimtex/main/UltiSnips/tex.snippets > tex.snippets 
