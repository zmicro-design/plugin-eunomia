FROM whatwewant/pipeline-builder:v1

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

RUN zmicro plugin run workspace env initialize nodejs

ARG VERSION=latest

RUN zmicro update -a

COPY . /usr/local/lib/zmicro/plugins/eunomia

RUN zmicro plugin register eunomia

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh