#!/bin/bash

version=$1

wget https://www.openssl.org/source/openssl-${version}.tar.gz
tar xvf openssl-${version}.tar.gz
cd openssl-${version}
./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared
make -j 16
make install
echo "/usr/local/ssl/lib" > /etc/ld.so.conf.d/0-openssl-${version}.conf
ldconfig
cd ..
rm -rf openssl-${version}*
