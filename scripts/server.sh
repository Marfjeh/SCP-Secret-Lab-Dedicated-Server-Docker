#!/bin/bash

# update server's data
/home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/server_data \
    +app_update 996560 -beta Linux \
    +exit
#screen -t scp -m bash -c "./LocalAdmin 7777"
cd /home/steam/server_data/
./LocalAdmin 7777

exit 0
