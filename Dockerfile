FROM whatwewant/serve:v1 as base

# FROM whatwewant/pipeline-builder:v1

FROM whatwewant/zmicro:v1

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

COPY --from=base /bin/serve /bin/serve

RUN apt update -y && apt install -yqq rsync

# RUN zmicro plugin run workspace env initialize nodejs

ARG VERSION=latest

RUN zmicro update -a

# COPY . /usr/local/lib/zmicro/plugins/eunomia

# RUN zmicro plugin register eunomia

RUN zmicro plugin install eunomia

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
