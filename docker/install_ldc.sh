#!/bin/bash

platform=$1
version=$2

if [ ${platform} = 'linux/amd64' ]; then
  target='linux-x86_64'
elif [ ${platform} = 'linux/arm64' ]; then
  target='linux-aarch64'
else
  exit 1
fi

file=ldc2-${version}-${target}

wget --no-check-certificate https://github.com/ldc-developers/ldc/releases/download/v${version}/${file}.tar.xz
tar -xf ${file}.tar.xz
mv ${file} ldc2
