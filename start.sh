#!/bin/bash

docker rm SCP
docker run -tid --name=SCP \
-v /opt/SCP/SCP:/home/steam/server_data \
-v /opt/SCP/Scripts:/home/steam/server_scripts \
-v /opt/SCP/SCP_Config:/home/steam/.config/SCP\ Secret\ Laboratory/ \
-p 7777:7777 crazymarf/scp_secret_laboratory:latest
