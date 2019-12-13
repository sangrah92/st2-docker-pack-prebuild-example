FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_voice_cisco.git ntt_voice_cisco \
 && /setup-pack-virtualenv.py --pack ntt_voice_cisco 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_vnext_sample_pack.git ntt_vnext_sample_pack \
 && /setup-pack-virtualenv.py --pack ntt_vnext_sample_pack 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_unix.git ntt_unix \
 && /setup-pack-virtualenv.py --pack ntt_unix

 
 
#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops


COPY --from=st2-examples /opt/stackstorm/packs/ntt_voice_cisco /opt/stackstorm/packs/ntt_voice_cisco
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_voice_cisco /opt/stackstorm/virtualenvs/ntt_voice_cisco

COPY --from=st2-examples /opt/stackstorm/packs/ntt_vnext_sample_pack /opt/stackstorm/packs/ntt_vnext_sample_pack
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_vnext_sample_pack /opt/stackstorm/virtualenvs/ntt_vnext_sample_pack

COPY --from=st2-examples /opt/stackstorm/packs/ntt_unix /opt/stackstorm/packs/ntt_unix
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_unix /opt/stackstorm/virtualenvs/ntt_unix


#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
