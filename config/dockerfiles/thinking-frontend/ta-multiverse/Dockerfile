FROM whatwewant/node-builder:v16-1.5.3 as builder

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

ENV TZ="Asia/Shanghai"

WORKDIR /build

COPY package.json .

COPY .npmrc .

COPY package-lock.json .

RUN npm i

COPY . .

# RUN  npm run build
RUN export PATH=/build/node_modules/.bin:$PATH && tant-intl build && nx run-many --target=build --projects=portal,ta,va,hermes

RUN npm run dist

FROM whatwewant/eunomia-runner-unicom:v1

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

COPY --from=builder /build/dist /var/www/html

# RUN echo "$(date)" >/var/www/html/.buildtime

# RUN echo "$(date)" >/var/www/html/buildtime.js

# ARG EUNOMIA_PIPELINE_BUILD_ID=-1

# RUN echo "${EUNOMIA_PIPELINE_BUILD_ID}" >/var/www/html/eunomia.buildid.js

# RUN echo "$(date)" >/var/www/html/eunomia.buildtime.js

COPY ./build.eunomia.js /var/www/html/
COPY ./buildid.eunomia.js /var/www/html
COPY ./buildtime.eunomia.js /var/www/html
