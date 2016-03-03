#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

cat <<EOF >> /etc/security/limits.conf

*               soft     nofile          65536
*               hard     nofile          65536
EOF

cat <<EOF >> ~vagrant/.profile

CLIENT_LIBRARY_PATH=~/riak-erlang-client
PATH=.:~vagrant/riak-$1/dev/dev1/bin:$PATH
EOF

apt-get install -y vsftpd openssl libpam0g-dev libssl0.9.8 git

# Install the build tools (dpkg-dev g++ gcc libc6-dev make)
apt-get -y install build-essential

# automatic configure script builder (debianutils m4 perl)
apt-get -y install autoconf

# Needed for HiPE (native code) support, but already installed by autoconf
apt-get -y install m4

# Needed for terminal handling (libc-dev libncurses5 libtinfo-dev libtinfo5 ncurses-bin)
apt-get -y install libncurses5-dev

# For building with wxWidgets
#apt-get -y install libwxgtk2.8-dev libgl1-mesa-dev libglu1-mesa-dev libpng3

# For building ssl (libssh-4 libssl-dev zlib1g-dev)
apt-get -y install libssh-dev

# ODBC support (libltdl3-dev odbcinst1debian2 unixodbc)
apt-get -y install unixodbc-dev
