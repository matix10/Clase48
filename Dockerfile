FROM jitesoft/node-yarn:latest as builder

RUN mkdir /acceleration-a
COPY /acceleration-a /acceleration-a

WORKDIR /acceleration-a
EXPOSE 3002
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build
RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM jitesoft/node-yarn:latest as img
COPY --from=builder /acceleration-a  /acceleration-a
WORKDIR /acceleration-a
ENV HOST 0.0.0.0

CMD [ "yarn", "start" ]


FROM jitesoft/node-yarn:latest as builder2

RUN mkdir /acceleration-dv
COPY /acceleration-dv /acceleration-dv

WORKDIR /acceleration-dv
EXPOSE 3001
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build
RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM jitesoft/node-yarn:latest as img2
COPY --from=builder2 /acceleration-dv /acceleration-dv
WORKDIR /acceleration-dv
ENV HOST 0.0.0.0

CMD [ "yarn", "start" ]




FROM jitesoft/node-yarn:latest as builder3

RUN mkdir /acceleration-calc
COPY /acceleration-calc /acceleration-calc

WORKDIR /acceleration-calc
EXPOSE 3000
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build
RUN rm -rf node_modules && \
  NODE_ENV=production yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=true

FROM jitesoft/node-yarn:latest as img3
COPY --from=builder3 /acceleration-calc /acceleration-calc
WORKDIR /acceleration-calc
ENV HOST 0.0.0.0

CMD [ "yarn", "start" ]
