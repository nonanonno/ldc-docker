#!/bin/bash

mkdir -p /opt/dlang
cd /opt/dlang
git clone https://github.com/dlang-community/DCD.git
cd DCD
dub build --build=release --config=client
dub build --build=release --config=server

cd /opt/dlang
git clone https://github.com/Pure-D/serve-d.git
cd serve-d
dub build --build=release
