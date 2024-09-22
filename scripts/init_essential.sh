#!/bin/bash
set -ex

export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Seoul

apt install -y vim wget curl unzip git
