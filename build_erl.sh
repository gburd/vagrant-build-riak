#!/usr/bin/env bash -e

echo "Download Erlang source"
echo -e "\n\n+++ Download Basho's Erlang/BEAM source and unarchive it +++" >> provision.log
wget -nv http://s3.amazonaws.com/downloads.basho.com/erlang/$1.tar.gz  >> provision.log 2>&1
tar -xzf $1.tar.gz >> provision.log 2>&1
mv OTP_R16B02_basho8 otp_R16B02_basho8
rm $1.tar.gz

mkdir -p erlmods/beam

echo "Configure build environment"
echo -e "\n\n+++ Configure build environment +++" >> ../provision.log
cd otp_R16B02_basho8

echo "Configure build environment"
echo -e "\n\n+++ Configure build environment +++" >> ../provision.log
./otp_build autoconf >> ../provision.log 2>&1
./configure >> ../provision.log 2>&1

echo "Build Erlang manually from source"
echo -e "\n\n+++ Build Erlang manually from source +++" >> ../provision.log
make >> ../provision.log 2>&1
