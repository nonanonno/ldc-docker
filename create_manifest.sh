#/bin/bash

version=1.29.0

docker manifest create nonanonno/ldc:${version} \
    nonanonno/ldc:${version}-arm64 \
    nonanonno/ldc:${version}-amd64

docker manifest push nonanonno/ldc:${version}
