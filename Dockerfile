FROM stackstorm/stackstorm:2.5.0 AS base

COPY setup-pack-virtualenv.py /setup-pack-virtualenv.py


FROM base AS st2-examples

RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_network_patch.git ntt_network_patch \
 && /setup-pack-virtualenv.py --pack ntt_network_patch
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_vmware.git ntt_vmware \
 && /setup-pack-virtualenv.py --pack ntt_vmware
 
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
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_voice_cisco.git ntt_voice_cisco \
 && /setup-pack-virtualenv.py --pack ntt_voice_cisco
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_vnext_sample_pack.git ntt_vnext_sample_pack \
 && /setup-pack-virtualenv.py --pack ntt_vnext_sample_pack
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_unix.git ntt_unix \
 && /setup-pack-virtualenv.py --pack ntt_unix
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_storage.git ntt_storage \
 && /setup-pack-virtualenv.py --pack ntt_storage
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_pfizer.git ntt_pfizer \
 && /setup-pack-virtualenv.py --pack ntt_pfizer
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_network_cisco.git ntt_network_cisco \
 && /setup-pack-virtualenv.py --pack ntt_network_cisco
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_network.git ntt_network \
 && /setup-pack-virtualenv.py --pack ntt_network 
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_msdc.git ntt_msdc \
 && /setup-pack-virtualenv.py --pack ntt_msdc
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_ivr.git ntt_ivr \
 && /setup-pack-virtualenv.py --pack ntt_ivr
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrt@scm.dimensiondata.com/vnext/StackStorm-Packs/ntt_itsm.git ntt_itsm \
 && /setup-pack-virtualenv.py --pack ntt_itsm
 
RUN cd /opt/stackstorm/packs \
 && git clone https://PRIVATE-TOKEN:aEJFW8JRRZuaPt66ZYrtscm.dimensiondata.com/vnext/StackStorm-Packs/ntt_insite_msen.git ntt_insite_msen \
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

COPY --from=st2-examples /opt/stackstorm/packs/ntt_network_patch /opt/stackstorm/packs/ntt_network_patch
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_network_patch /opt/stackstorm/virtualenvs/ntt_network_patch

COPY --from=st2-examples /opt/stackstorm/packs/ntt_vmware /opt/stackstorm/packs/ntt_vmware
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_vmware /opt/stackstorm/virtualenvs/ntt_vmware

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

COPY --from=st2-examples /opt/stackstorm/packs/ntt_voice_cisco /opt/stackstorm/packs/ntt_voice_cisco
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_voice_cisco /opt/stackstorm/virtualenvs/ntt_voice_cisco

COPY --from=st2-examples /opt/stackstorm/packs/ntt_vnext_sample_pack /opt/stackstorm/packs/ntt_vnext_sample_pack
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_vnext_sample_pack /opt/stackstorm/virtualenvs/ntt_vnext_sample_pack

COPY --from=st2-examples /opt/stackstorm/packs/ntt_unix /opt/stackstorm/packs/ntt_unix
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_unix /opt/stackstorm/virtualenvs/ntt_unix

COPY --from=st2-examples /opt/stackstorm/packs/ntt_storage /opt/stackstorm/packs/ntt_storage
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_storage /opt/stackstorm/virtualenvs/ntt_storage

COPY --from=st2-examples /opt/stackstorm/packs/ntt_pfizer /opt/stackstorm/packs/ntt_pfizer
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_pfizer /opt/stackstorm/virtualenvs/ntt_pfizer

COPY --from=st2-examples /opt/stackstorm/packs/ntt_network_cisco /opt/stackstorm/packs/ntt_network_cisco
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_network_cisco /opt/stackstorm/virtualenvs/ntt_network_cisco

COPY --from=st2-examples /opt/stackstorm/packs/ntt_network /opt/stackstorm/packs/ntt_network
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_network /opt/stackstorm/virtualenvs/ntt_network

COPY --from=st2-examples /opt/stackstorm/packs/ntt_msdc /opt/stackstorm/packs/ntt_msdc
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_msdc /opt/stackstorm/virtualenvs/ntt_msdc

COPY --from=st2-examples /opt/stackstorm/packs/ntt_ivr /opt/stackstorm/packs/ntt_ivr
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_ivr /opt/stackstorm/virtualenvs/ntt_ivr

COPY --from=st2-examples /opt/stackstorm/packs/ntt_itsm /opt/stackstorm/packs/ntt_itsm
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_itsm /opt/stackstorm/virtualenvs/ntt_itsm

COPY --from=st2-examples /opt/stackstorm/packs/ntt_insite_msen /opt/stackstorm/packs/ntt_insite_msen
COPY --from=st2-examples /opt/stackstorm/virtualenvs/ntt_insite_msen /opt/stackstorm/virtualenvs/ntt_insite_msen

#COPY --from=st2-napalm /opt/stackstorm/packs/napalm /opt/stackstorm/packs/napalm
#COPY --from=st2-napalm /opt/stackstorm/virtualenvs/napalm /opt/stackstorm/virtualenvs/napalm
