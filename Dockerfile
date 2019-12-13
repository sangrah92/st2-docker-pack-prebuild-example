FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples

RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_o365.git ntt_o365 \
 && /setup-pack-virtualenv.py --pack ntt_o365
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_checkpoint.git ntt_checkpoint \
 && /setup-pack-virtualenv.py --pack ntt_checkpoint 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_ods.git ntt_ods \
 && /setup-pack-virtualenv.py --pack ntt_ods 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_utils_json.git ntt_utils_json \
 && /setup-pack-virtualenv.py --pack ntt_utils_json 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_database_oracle.git ntt_database_oracle \
 && /setup-pack-virtualenv.py --pack ntt_database_oracle 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_windows.git ntt_windows \
 && /setup-pack-virtualenv.py --pack ntt_windows  
 
 
#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops

COPY --from=st2-examples /opt/stackstorm/packs/ntt_o365 /opt/stackstorm/packs/ntt_o365
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_o365 /opt/stackstorm/virtualenvs/ntt_o365

COPY --from=st2-examples /opt/stackstorm/packs/ntt_checkpoint /opt/stackstorm/packs/ntt_checkpoint
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_checkpoint /opt/stackstorm/virtualenvs/ntt_checkpoint

COPY --from=st2-examples /opt/stackstorm/packs/ntt_ods /opt/stackstorm/packs/ntt_ods
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_ods /opt/stackstorm/virtualenvs/ntt_ods

COPY --from=st2-examples /opt/stackstorm/packs/ntt_utils_json /opt/stackstorm/packs/ntt_utils_json
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_utils_json /opt/stackstorm/virtualenvs/ntt_utils_json

COPY --from=st2-examples /opt/stackstorm/packs/ntt_database_oracle /opt/stackstorm/packs/ntt_database_oracle
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_database_oracle /opt/stackstorm/virtualenvs/ntt_database_oracle

COPY --from=st2-examples /opt/stackstorm/packs/ntt_windows /opt/stackstorm/packs/ntt_windows
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_windows /opt/stackstorm/virtualenvs/ntt_windows

#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
