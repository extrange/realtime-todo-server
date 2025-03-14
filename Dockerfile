FROM node:23@sha256:e940261391ab78a883bbcfba448bcbb6d36803053f67017e6e270ef095f213ca AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]