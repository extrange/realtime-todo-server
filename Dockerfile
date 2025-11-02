FROM node:24@sha256:34af25027ee1b8bffd482ba995ec1e577fbd398db87beb4c60b80c2c9c025127 AS base

#-------------------------

FROM base

WORKDIR /workspace

COPY . .

RUN npm ci

CMD ["npm", "run", "start"]