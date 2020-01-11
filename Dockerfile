FROM debian:buster

# download requirements
RUN apt-get -y update && \
    apt-get -y install lib32gcc1 lib32stdc++6 wget gnupg screen && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN wget http://download.mono-project.com/repo/xamarin.gpg
RUN apt-key add xamarin.gpg
RUN rm xamarin.gpg
RUN echo "deb http://download.mono-project.com/repo/debian buster main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update -
RUN apt-get -y -q install mono-complete

# setup steam user
RUN useradd -m steam
WORKDIR /home/steam
USER steam

# download steamcmd
RUN mkdir steamcmd && cd steamcmd && \
    wget -O - "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

# start steamcmd to force it to update itself
RUN ./steamcmd/steamcmd.sh +quit && \
    mkdir -pv /home/steam/.steam/sdk32/ && \
    ln -s /home/steam/steamcmd/linux32/steamclient.so /home/steam/.steam/sdk32/steamclient.so

# start the server main script
ENTRYPOINT ["bash", "/home/steam/server_scripts/server.sh"]