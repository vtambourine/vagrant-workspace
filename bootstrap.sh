#!/usr/bin/env bash

# Test whether a command exists
# $1 - cmd to test
type_exists() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

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

echo 'Installing Node.js'
if ! type_exists node; then
  curl --silent --location https://deb.nodesource.com/setup_6.x | bash -
  apt-get install --yes nodejs
fi

echo 'Installing Go'
if ! type_exists go; then
  GO_ARCHIVE=go1.6.2.linux-amd64.tar.gz
  wget --no-verbose https://storage.googleapis.com/golang/$GO_ARCHIVE
  tar --directory /usr/local/ --extract --ungzip --file $GO_ARCHIVE
  echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
  rm $GO_ARCHIVE
fi

echo 'Installing Ruby'
if ! type_exists ruby; then
  apt-get install --yes ruby-full
fi

echo 'Provision done!'