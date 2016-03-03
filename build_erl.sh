#!/bin/bash

exec 1> >(logger -s -t $(basename $0)) 2>&1

# download Erlang source
wget -nv http://s3.amazonaws.com/downloads.basho.com/erlang/$1.tar.gz
tar -xzf $1.tar.gz >> provision.log 2>&1
mv OTP_R16B02_basho8 otp_R16B02_basho8
rm $1.tar.gz

mkdir -p erlmods/beam

# configure build environment
cd otp_R16B02_basho8 && \
    ./otp_build autoconf && \
    ./configure && make -j
