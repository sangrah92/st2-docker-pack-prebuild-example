FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples

RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:xYAf-6WELzmrhodb_3GY@scm.dimensiondata.com/pratik.khairnar/ntt_vmware.git ntt_vmware \
 && /setup-pack-virtualenv.py --pack ntt_vmware


#FROM base AS st2-napalm

#RUN cd /opt/stackstorm/packs \
# && git clone https://github.com/stackstorm-exchange/stackstorm-napalm napalm \
# && /setup-pack-virtualenv.py --pack napalm


FROM base

RUN /setup-pack-virtualenv.py --pack core \
 && /setup-pack-virtualenv.py --pack packs \
 && /setup-pack-virtualenv.py --pack linux \
 && /setup-pack-virtualenv.py --pack chatops

COPY --from=st2-examples /opt/stackstorm/packs/ntt_vmware /opt/stackstorm/packs/ntt_vmware
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_vmware /opt/stackstorm/virtualenvs/ntt_vmware

#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
