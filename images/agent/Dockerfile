FROM whatwewant/gzcaas:v1-dind

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

RUN apt update -y

RUN zmicro update -a

RUN zmicro package install jq

RUN zmicro package install sync

RUN zmicro package install ossutil

RUN zmicro plugin run workspace env initialize nodejs

RUN zmicro plugin install eunomia

ENV CAAS_SHELL=eunomia-shell

ENV CAAS_METADATA_DIR=/data/gzcaas/metadata

ENV CAAS_WORKDIR=/data/gzcaas/workdir
