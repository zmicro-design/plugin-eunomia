FROM whatwewant/node-builder:v16-1.5.3 as builder

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

WORKDIR /build

COPY package.json .

COPY package-lock.json .

RUN  npm i

COPY . .

RUN  npm run build 

RUN  npm run dist

FROM whatwewant/eunomia-runner-unicom:v1

LABEL MAINTAINER="Zero<tobewhatwewant@outlook.com>"

COPY --from=builder /build/dist /var/www/html
