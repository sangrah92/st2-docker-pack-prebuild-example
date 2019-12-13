FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_storage.git ntt_storage \
 && /setup-pack-virtualenv.py --pack ntt_storage 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_pfizer.git ntt_pfizer \
 && /setup-pack-virtualenv.py --pack ntt_pfizer 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_msdc.git ntt_msdc \
 && /setup-pack-virtualenv.py --pack ntt_msdc

 
 
#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops


COPY --from=st2-examples /opt/stackstorm/packs/ntt_storage /opt/stackstorm/packs/ntt_storage
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_storage /opt/stackstorm/virtualenvs/ntt_storage

COPY --from=st2-examples /opt/stackstorm/packs/ntt_pfizer /opt/stackstorm/packs/ntt_pfizer
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_pfizer /opt/stackstorm/virtualenvs/ntt_pfizer

COPY --from=st2-examples /opt/stackstorm/packs/ntt_msdc /opt/stackstorm/packs/ntt_msdc
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_msdc /opt/stackstorm/virtualenvs/ntt_msdc


#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
