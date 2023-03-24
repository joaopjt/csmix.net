FROM steamcmd/steamcmd:alpine

ENV HOMEDIR /root/Steam
ENV STEAMAPPSDIR ${HOMEDIR}/steamapps

ENV STEAMAPPID 740
ENV STEAMAPP csgo
ENV STEAMAPPDIR "${STEAMAPPSDIR}/${STEAMAPP}-dedicated"
ENV CSGOAPPDIR "${STEAMAPPDIR}/csgo"

RUN steamcmd +login anonymous \
	     +app_update ${STEAMAPPID} \
	     +quit

RUN cd ${CSGOAPPDIR} \
       wget https://mms.alliedmods.net/mmsdrop/1.12/mmsource-1.12.0-git1167-linux.tar.gz \
       tar -xf mmsource-1.12.0-git1167-linux.tar.gz \
       rm mmsource-1.12.0-git1167-linux.tar.gz

RUN cd ${CSGOAPPDIR} \
       wget https://sm.alliedmods.net/smdrop/1.12/sourcemod-1.12.0-git6987-linux.tar.gz \
       tar -xf sourcemod-1.12.0-git6987-linux.tar.gz \
       rm sourcemod-1.12.0-git6987-linux.tar.gz

RUN cd ${CSGOAPPDIR} \
    wget https://github.com/splewis/get5/releases/download/v0.13.0/get5-v0.13.0.tar.gz \
    tar -xf get5-v0.13.0.tar.gz \
    get5-v0.13.0.tar.gz

# run wget http://api.csmix.net/match/${MATCH_ID}/get5.json
