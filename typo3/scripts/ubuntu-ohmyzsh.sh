#! /usr/bin/env bash

########################################################################################################################
##                                      Vagrant Oh My Zsh BASH Script                                                 ##
########################################################################################################################

THEME=agnoster


echo -e "\n--- Install Zsh and Git packages ---\n"
apt-get -y install zsh git-core > /dev/null 2>&1

echo -e "\n--- Download and run the Oh-my-Zsh-Installscript ---\n"
wget -q https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo -e "\n--- Set Zsh as default ---\n"
chsh -s `which zsh`

echo 'if [ "$SHELL" != "/usr/bin/zsh" -a -n "$SSH_TTY" -a -x /usr/bin/zsh ]; then
    export SHELL="/usr/bin/zsh"
    exec $SHELL -l
fi' >> ~/.profile


echo -e "\n--- Install Powerline fonts for Agnoster Theme ---\n"
git clone https://github.com/powerline/fonts.git
bash fonts/install.sh
rm -rf fonts

echo -e "\n--- Set Theme to $THEME ---\n"
sed -i "s/^\(ZSH_THEME\s*=\s*\).*\$/\1$THEME/" ~/.zshrc
