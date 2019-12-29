#!/usr/bin/env bash

set -e
set -u

source ./.env.sydney2
docker-machine active
docker-machine scp ../server-qwprogs/qwprogs.dat sydney2:/home/ubuntu/fortressone_progs/staging
docker-machine scp ../server-qwprogs/csprogs.dat sydney2:/home/ubuntu/fortressone_progs/staging
docker-machine scp ../server-qwprogs/menu.dat sydney2:/home/ubuntu/fortressone_progs/staging

source ./.env.dallas5
docker-machine active
docker-machine scp ../server-qwprogs/qwprogs.dat dallas5:/root/fortressone_progs/staging
docker-machine scp ../server-qwprogs/csprogs.dat dallas5:/root/fortressone_progs/staging
docker-machine scp ../server-qwprogs/menu.dat dallas5:/root/fortressone_progs/staging
