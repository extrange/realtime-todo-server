FROM node:23@sha256:8ec46835f28cc572d67820fc56a6c5ab7d08c6e9b690ae6941aad462943e152e AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]