FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples

RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_o365.git ntt_o365 \
 && /setup-pack-virtualenv.py --pack ntt_o365
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_checkpoint.git ntt_checkpoint \
 && /setup-pack-virtualenv.py --pack ntt_checkpoint 
 

 
 
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


#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
