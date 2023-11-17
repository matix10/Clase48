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

