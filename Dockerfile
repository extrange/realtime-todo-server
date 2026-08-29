FROM node:24@sha256:be23f54a88d34e8824c741b19b91064094f92c1c97b194144bfc8b50d67258e2 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY package.json package-lock.json /workspace/

RUN npm ci

COPY . .

CMD ["npm", "run", "start"]