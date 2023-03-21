FROM cm2network/csgo:sourcemod
WORKDIR /home/steam
RUN ./${WORKDIR}/entry.sh

RUN cd ${WORKDIR}/csgo-dedicated/csgo/
RUN wget https://github.com/splewis/get5/releases/download/v0.13.0/get5-v0.13.0.tar.gz
RUN tar -xf get5-v0.13.0.tar.gz
RUN rm get5-v0.13.0.tar.gz

# run wget http://api.csmix.net/match/${MATCH_ID}/get5.json