FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:cqTqq9q12WDZJLkLztGU@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_backup.git ntt_backup \
 && /setup-pack-virtualenv.py --pack ntt_backup 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:cqTqq9q12WDZJLkLztGU@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_discovery.git ntt_discovery \
 && /setup-pack-virtualenv.py --pack ntt_discovery 
   
#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops


COPY --from=st2-examples /opt/stackstorm/packs/ntt_backup /opt/stackstorm/packs/ntt_backup
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_backup /opt/stackstorm/virtualenvs/ntt_backup

COPY --from=st2-examples /opt/stackstorm/packs/ntt_discovery /opt/stackstorm/packs/ntt_discovery
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_discovery /opt/stackstorm/virtualenvs/ntt_discovery


#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
