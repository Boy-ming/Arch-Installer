#!/bin/bash

sudo pacman -S --noconfirm git screenfetch google-chrome zsh shadowsocks-qt5 fcitx fcitx-cloudpinyin fcitx-im 
fcitx-configtool fcitx-sunpinyin fcitx-libpinyin fcitx-googlepinyin xf86-input-synaptics
echo "install wps ? y)YES ENTER)NO"
read tmp
if [ "$tmp" == "y"];then
sudo pacman -S --noconfirm wps-office ttf-wps-fonts
fi

set xprofile = ~/.xprofile
if [ ! -d $xprofile ];then
sudo touch  $xprofile
fi
sudo echo 'export LANG=zh_CN.UTF-8' >> $xprofile
sudo echo 'export LANGUAGE=zh_CN:en_US' >> $xprofile
sudo echo 'export LC_CTYPE=en_US.UTF-8' >> $xprofile
sudo echo '#fcitx' >> $xprofile
sudo echo 'export GTK_IM_MODULE=fcitx' >> $xprofile
sudo echo 'export QT_IM_MODULE=fcitx' >> $xprofile
sudo echo 'export XMODIFIERS="@im=fcitx"' >> $xprofile
set locale = /etc/locale.gen
if [ ! -d $locale ];then
sudo touch  $locale
fi
sudo echo 'en_US.UTF-8 UTF-8"' >> $locale
sudo locale-gen
timedatectl set-ntp true

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/halfo/lambda-mod-zsh-theme.git ~/.oh-my-zsh/custom/themes/lambda-mod
