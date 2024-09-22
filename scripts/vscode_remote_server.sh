#!/bin/bash
wget https://update.code.visualstudio.com/commit:$1/server-linux-x64/stable -O vscode-server.tar.gz
mkdir /root/.vscode-server/bin/$1
tar -xvf vscode-server.tar.gz --strip-components=1 -C /root/.vscode-server/bin/$1