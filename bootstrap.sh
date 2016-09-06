#!/usr/bin/env bash

echo 'Provision started'

echo 'Reconfiguring locales...'
if [ `locale -a | grep -c ru_RU` == 0 ]; then
  sed -i 's/^# \(ru_RU.UTF-8\)/\1/' /etc/locale.gen
  locale-gen
fi

echo 'Installing system packages'
apt-get update
apt-get --yes upgrade
apt-get install --yes build-essential
apt-get install --yes vim curl tmux

echo 'Installing Python'
apt-get install --yes python2.7

echo 'Instaling Anaconda'
ANACONDA_INSTALLER=Anaconda3-4.1.1-Linux-x86_64.sh
wget --no-verbose https://repo.continuum.io/archive/$ANACONDA_INSTALLER
bash $ANACONDA_INSTALLER -b
echo 'export PATH=$PATH:~/anaconda3/bin' >> ~/.bashrc
conda install --yes ipython

echo 'Provision done!'
