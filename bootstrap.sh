#!/usr/bin/env bash

echo "Provision started"

echo "Reconfiguring locales..."
sed -i 's/^# \(ru_RU.UTF-8\)/\1/' /etc/locale.gen
locale-gen

echo "Installing system packages"
apt-get update
apt-get -y upgrade
apt-get install -y build-essential
apt-get install -y vim curl tmux

echo "Installing Node.js"
curl -sL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs

echo "Installing Go"
GO_ARCHIVE=go1.6.2.linux-amd64.tar.gz
wget https://storage.googleapis.com/golang/$GO_ARCHIVE
tar -C /usr/local/ -xzf $GO_ARCHIVE
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
rm $GO_ARCHIVE

echo "Installing Ruby"
apt-get install -y ruby-full

echo "Provision done!"