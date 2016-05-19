#!/usr/bin/env bash

echo 'Provision started'

echo 'Reconfiguring locales...'
sed -i 's/^# \(ru_RU.UTF-8\)/\1/' /etc/locale.gen
locale-gen

echo 'Installing system packages'
apt-get update
apt-get --yes upgrade
apt-get install --yes build-essential
apt-get install --yes vim curl tmux

echo 'Installing Node.js'
curl --silent --location https://deb.nodesource.com/setup_6.x | bash -
apt-get install --yes nodejs

echo 'Installing Go'
GO_ARCHIVE=go1.6.2.linux-amd64.tar.gz
wget --no-verbose https://storage.googleapis.com/golang/$GO_ARCHIVE
tar --directory /usr/local/ --extract --ungzip --file $GO_ARCHIVE
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
rm $GO_ARCHIVE

echo 'Installing Ruby'
apt-get install --yes ruby-full

echo 'Provision done!'