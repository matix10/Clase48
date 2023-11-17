FROM jitesoft/node-yarn:latest as builder3

COPY . .

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
COPY --from=builder3 . .
ENV HOST 0.0.0.0

CMD [ "yarn", "start" ]
