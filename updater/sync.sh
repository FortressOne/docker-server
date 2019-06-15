#!/usr/bin/env bash

# update qwprogs from latest github release
curl -L \
  -o /fortressonesv/fortress/qwprogs.dat \
  -z /fortressonesv/fortress/qwprogs.dat \
  https://github.com/FortressOne/server-qwprogs/releases/latest/download/qwprogs.dat

# update maps/progs/sounds/lits etc from map-repo rsync mirror
rsync -atzv rsync://fortressone.quakerepo.net/maps /fortressonesv
