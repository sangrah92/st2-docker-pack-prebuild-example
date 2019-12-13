FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_ivr.git ntt_ivr \
 && /setup-pack-virtualenv.py --pack ntt_ivr 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_itsm.git ntt_itsm \
 && /setup-pack-virtualenv.py --pack ntt_itsm 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:PJRdDTTWs7hA_pW8CUC9@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_insite_msen.git ntt_insite_msen \
 && /setup-pack-virtualenv.py --pack ntt_insite_msen

 
 
#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops


COPY --from=st2-examples /opt/stackstorm/packs/ntt_ivr /opt/stackstorm/packs/ntt_ivr
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_ivr /opt/stackstorm/virtualenvs/ntt_ivr

COPY --from=st2-examples /opt/stackstorm/packs/ntt_itsm /opt/stackstorm/packs/ntt_itsm
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_itsm /opt/stackstorm/virtualenvs/ntt_itsm

COPY --from=st2-examples /opt/stackstorm/packs/ntt_insite_msen /opt/stackstorm/packs/ntt_insite_msen
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_insite_msen /opt/stackstorm/virtualenvs/ntt_insite_msen


#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
