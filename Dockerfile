FROM node:24@sha256:40ad9f3064e67d6860b4bc3fe1880b2953934fd6320ada990e45fe0efa6badd7 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]