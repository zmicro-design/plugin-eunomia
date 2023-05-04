FROM whatwewant/zmicro:v1

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

RUN apt update -y && apt install -yqq rsync

RUN zmicro plugin run workspace env initialize nodejs

ARG VERSION=latest

RUN zmicro update -a

RUN zmicro plugin install eunomia

RUN zmicro package install gzcaas

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
