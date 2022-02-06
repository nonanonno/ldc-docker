#!/bin/bash

cd $(dirname $0)

version=1.28.1

arch=$(uname -m)
if [ $arch = 'x86_64' ]; then
  arch=amd64
fi

cd docker
docker buildx build \
  --platform linux/${arch} \
  --build-arg LDC_VERSION=${version} \
  -t nonanonno/ldc:${version}-${arch} \
  --push .
